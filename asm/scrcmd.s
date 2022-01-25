#include "constants/sprites.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FAC94
	.public sConditionTable
	.public _020FACB0
	.public _020FACC4
	.public _020FACDC

	.rodata

	.public sNumScriptCmds
sNumScriptCmds:
	.word (gScriptCmdTable_end-gScriptCmdTable)/4
	.public _020FAC94
_020FAC94:
	.byte 0x03, 0x19, 0x0D, 0x06, 0x04, 0x0D
	.short 0x021F
	.public sConditionTable
sConditionTable:
	;     <  =  >
	.byte 1, 0, 0 ; lt
	.byte 0, 1, 0 ; eq
	.byte 0, 0, 1 ; gt
	.byte 1, 1, 0 ; le
	.byte 0, 1, 1 ; ge
	.byte 1, 0, 1 ; ne
	.public _020FACB0
	.balign 4, 0
_020FACB0:
	.word SDK_OVERLAY_OVY_20_ID
	.word SDK_OVERLAY_OVY_24_ID
	.word SDK_OVERLAY_OVY_21_ID
	.word SDK_OVERLAY_OVY_22_ID
	.word SDK_OVERLAY_OVY_25_ID
	.public _020FACC4
_020FACC4:
	.word 0x07FFFFFF
	.word 0x07FFFFFF
	.word 0x07FFFFFF
	.word 0x07FFFFFF
	.word 0x07FFFFFF
	.word 0x07FFFFFF
	.public _020FACDC
_020FACDC:
	.byte 0x00, 0x30, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x00
	.byte 0x00, 0xD0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x00
	.byte 0x00, 0x80, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00
	.public gScriptCmdTable
gScriptCmdTable:
	.word ScrCmd_Nop                                    ; 000
	.word ScrCmd_Dummy                                  ; 001
	.word ScrCmd_End                                    ; 002
	.word ScrCmd_Wait                                   ; 003
	.word ScrCmd_LoadByte                               ; 004
	.word ScrCmd_LoadWord                               ; 005
	.word ScrCmd_LoadByteFromAddr                       ; 006
	.word ScrCmd_WriteByteToAddr                        ; 007
	.word ScrCmd_SetPtrByte                             ; 008
	.word ScrCmd_CopyLocal                              ; 009
	.word ScrCmd_CopyByte                               ; 010
	.word ScrCmd_CompareLocalToLocal                    ; 011
	.word ScrCmd_CompareLocalToValue                    ; 012
	.word ScrCmd_CompareLocalToAddr                     ; 013
	.word ScrCmd_CompareAddrToLocal                     ; 014
	.word ScrCmd_CompareAddrToValue                     ; 015
	.word ScrCmd_CompareAddrToAddr                      ; 016
	.word ScrCmd_CompareVarToValue                      ; 017
	.word ScrCmd_CompareVarToVar                        ; 018
	.word ScrCmd_RunScript                              ; 019
	.word ScrCmd_RunScriptWait                          ; 020
	.word ScrCmd_RestartCurrentScript                   ; 021
	.word ScrCmd_GoTo                                   ; 022
	.word ScrCmd_ObjectGoTo                             ; 023
	.word ScrCmd_BgGoTo                                 ; 024
	.word ScrCmd_DirectionGoTo                          ; 025
	.word ScrCmd_Call                                   ; 026
	.word ScrCmd_Return                                 ; 027
	.word ScrCmd_GoToIf                                 ; 028
	.word ScrCmd_CallIf                                 ; 029
	.word ScrCmd_SetFlag                                ; 030
	.word ScrCmd_ClearFlag                              ; 031
	.word ScrCmd_CheckFlag                              ; 032
	.word ScrCmd_SetFlagVar                             ; 033
	.word ScrCmd_ClearFlagVar                           ; 034
	.word ScrCmd_CheckFlagVar                           ; 035
	.word ScrCmd_SetTrainerFlag                         ; 036
	.word ScrCmd_ClearTrainerFlag                       ; 037
	.word ScrCmd_CheckTrainerFlag                       ; 038
	.word ScrCmd_AddVar                                 ; 039
	.word ScrCmd_SubVar                                 ; 040
	.word ScrCmd_SetVar                                 ; 041
	.word ScrCmd_CopyVar                                ; 042
	.word ScrCmd_SetOrCopyVar                           ; 043
	.word ScrCmd_NonNPCMsg                              ; 044
	.word ScrCmd_NPCMsg                                 ; 045
	.word ScrCmd_NonNpcMsgVar                                    ; 046
	.word ScrCmd_NpcMsgVar                                    ; 047
	.word ScrCmd_048                                    ; 048
	.word ScrCmd_049                                    ; 049
	.word ScrCmd_WaitButton                             ; 050
	.word ScrCmd_051                                    ; 051
	.word ScrCmd_OpenMsg                                    ; 052
	.word ScrCmd_CloseMsg                               ; 053
	.word ScrCmd_054                                    ; 054
	.word ScrCmd_DirectionSignpost                                    ; 055
	.word ScrCmd_055                                    ; 056
	.word ScrCmd_057                                    ; 057
	.word ScrCmd_058                                    ; 058
	.word ScrCmd_TrainerTips                                    ; 059
	.word ScrCmd_060                                    ; 060
	.word ScrCmd_061                                    ; 061
	.word ScrCmd_062                                    ; 062
	.word ScrCmd_063                                    ; 063
	.word ScrCmd_064                                    ; 064
	.word ScrCmd_065                                    ; 065
	.word ScrCmd_066                                    ; 066
	.word ScrCmd_067                                    ; 067
	.word ScrCmd_068                                    ; 068
	.word ScrCmd_069                                    ; 069
	.word ScrCmd_070                                    ; 070
	.word ScrCmd_071                                    ; 071
	.word ScrCmd_072                                    ; 072
	.word ScrCmd_PlaySE                                 ; 073
	.word ScrCmd_StopSE                                    ; 074
	.word ScrCmd_WaitSE                                 ; 075
	.word ScrCmd_PlayCry                                    ; 076
	.word ScrCmd_WaitCry                                    ; 077
	.word ScrCmd_PlayFanfare                            ; 078
	.word ScrCmd_WaitFanfare                            ; 079
	.word ScrCmd_PlayBGM                                ; 080
	.word ScrCmd_081                                    ; 081
	.word ScrCmd_ResetBGM                               ; 082
	.word ScrCmd_083                                    ; 083
	.word ScrCmd_FadeOutBGM                             ; 084
	.word ScrCmd_085                                    ; 085
	.word ScrCmd_086                                    ; 086
	.word ScrCmd_TempBGM                                ; 087
	.word ScrCmd_088                                    ; 088
	.word ScrCmd_ChatotHasCry                                    ; 089
	.word ScrCmd_ChatotStartRecording                                    ; 090
	.word ScrCmd_ChatotStopRecording                                    ; 091
	.word ScrCmd_ChatotSaveRecording                                    ; 092
	.word ScrCmd_093                                    ; 093
	.word ScrCmd_ApplyMovement                          ; 094
	.word ScrCmd_WaitMovement                           ; 095
	.word ScrCmd_LockAll                                ; 096
	.word ScrCmd_ReleaseAll                             ; 097
	.word ScrCmd_098                                    ; 098
	.word ScrCmd_099                                    ; 099
	.word ScrCmd_ShowPerson                             ; 100
	.word ScrCmd_HidePerson                             ; 101
	.word ScrCmd_102                                    ; 102
	.word ScrCmd_103                                    ; 103
	.word ScrCmd_FacePlayer                             ; 104
	.word ScrCmd_GetPlayerCoords                        ; 105
	.word ScrCmd_GetPersonCoords                        ; 106
	.word ScrCmd_107                                    ; 107
	.word ScrCmd_108                                    ; 108
	.word ScrCmd_109                                    ; 109
	.word ScrCmd_AddMoney                               ; 110
	.word ScrCmd_SubMoneyImmediate                      ; 111
	.word ScrCmd_HasEnoughMoneyImmediate                ; 112
	.word ScrCmd_113                                    ; 113
	.word ScrCmd_114                                    ; 114
	.word ScrCmd_115                                    ; 115
	.word ScrCmd_116                                    ; 116
	.word ScrCmd_117                                    ; 117
	.word ScrCmd_118                                    ; 118
	.word ScrCmd_GetCoinAmount                                    ; 119
	.word ScrCmd_GiveCoins                                    ; 120
	.word ScrCmd_TakeCoins                                    ; 121
	.word ScrCmd_GiveAthletePoints                                    ; 122
	.word ScrCmd_TakeAthletePoints                                    ; 123
	.word ScrCmd_CheckAthletePoints                                    ; 124
	.word ScrCmd_GiveItem                               ; 125
	.word ScrCmd_TakeItem                               ; 126
	.word ScrCmd_HasSpaceForItem                        ; 127
	.word ScrCmd_HasItem                                ; 128
	.word ScrCmd_ItemIsTMOrHM                           ; 129
	.word ScrCmd_GetItemPocket                          ; 130
	.word ScrCmd_SetStarterChoice                       ; 131
	.word ScrCmd_GenderMsgbox                           ; 132
	.word ScrCmd_GetSealQuantity                                    ; 133
	.word ScrCmd_GiveOrTakeSeal                                    ; 134
	.word ScrCmd_GiveRandomSeal                                    ; 135
	.word ScrCmd_136                                    ; 136
	.word ScrCmd_GiveMon                                ; 137
	.word ScrCmd_GiveEgg                                ; 138
	.word ScrCmd_SetMonMove                             ; 139
	.word ScrCmd_MonHasMove                             ; 140
	.word ScrCmd_GetPartySlotWithMove                          ; 141
	.word ScrCmd_GetPhoneBookRematch                    ; 142
	.word ScrCmd_NameRival                              ; 143
	.word ScrCmd_GetFriendSprite                        ; 144
	.word ScrCmd_RegisterPokegearCard                   ; 145
	.word ScrCmd_RegisterGearNumber                     ; 146
	.word ScrCmd_CheckRegisteredPhoneNumber                                    ; 147
	.word ScrCmd_148                                    ; 148
	.word ScrCmd_149                                    ; 149
	.word ScrCmd_150                                    ; 150
	.word ScrCmd_151                                    ; 151
	.word ScrCmd_152                                    ; 152
	.word ScrCmd_153                                    ; 153
	.word ScrCmd_154                                    ; 154
	.word ScrCmd_155                                    ; 155
	.word ScrCmd_156                                    ; 156
	.word ScrCmd_TownMap                                    ; 157
	.word ScrCmd_158                                    ; 158
	.word ScrCmd_159                                    ; 159
	.word ScrCmd_160                                    ; 160
	.word ScrCmd_161                                    ; 161
	.word ScrCmd_162                                    ; 162
	.word ScrCmd_HOF_Credits                                    ; 163
	.word ScrCmd_164                                    ; 164
	.word ScrCmd_165                                    ; 165
	.word ScrCmd_166                                    ; 166
	.word ScrCmd_ChooseStarter                                    ; 167
	.word ScrCmd_GetTrainerPathToPlayer                                    ; 168
	.word ScrCmd_TrainerStepTowardsPlayer                                    ; 169
	.word ScrCmd_170                                    ; 170
	.word ScrCmd_GetEyeTrainerNum                                    ; 171
	.word ScrCmd_172                                    ; 172
	.word ScrCmd_NicknameInput                          ; 173
	.word ScrCmd_FadeScreen                             ; 174
	.word ScrCmd_WaitFade                               ; 175
	.word ScrCmd_Warp                                    ; 176
	.word ScrCmd_177                                    ; 177
	.word ScrCmd_178                                    ; 178
	.word ScrCmd_179                                    ; 179
	.word ScrCmd_180                                    ; 180
	.word ScrCmd_181                                    ; 181
	.word ScrCmd_182                                    ; 182
	.word ScrCmd_183                                    ; 183
	.word ScrCmd_184                                    ; 184
	.word ScrCmd_185                                    ; 185
	.word ScrCmd_186                                    ; 186
	.word ScrCmd_GetPlayerState                         ; 187
	.word ScrCmd_SetAvatarBits                                    ; 188
	.word ScrCmd_UpdateAvatarState                                    ; 189
	.word ScrCmd_BufferPlayersName                      ; 190
	.word ScrCmd_BufferRivalsName                                    ; 191
	.word ScrCmd_BufferFriendsName                                    ; 192
	.word ScrCmd_BufferMonSpeciesName                   ; 193
	.word ScrCmd_BufferItemName                         ; 194
	.word ScrCmd_BufferPocketName                       ; 195
	.word ScrCmd_BufferTMHMMoveName                     ; 196
	.word ScrCmd_BufferMoveName                                    ; 197
	.word ScrCmd_BufferInt                                    ; 198
	.word ScrCmd_BufferPartyMonNick                     ; 199
	.word ScrCmd_BufferTrainerClassName                                    ; 200
	.word ScrCmd_BufferPlayerUnionAvatarClassName                                    ; 201
	.word ScrCmd_BufferSpeciesName                ; 202
	.word ScrCmd_BufferStarterSpeciesName                                    ; 203
	.word ScrCmd_BufferDPPtRivalStarterSpeciesName                                    ; 204
	.word ScrCmd_BufferDPPtFriendStarterSpeciesName                                    ; 205
	.word ScrCmd_GetStarterChoice                       ; 206
	.word ScrCmd_BufferDecorationName                                    ; 207
	.word ScrCmd_208                                    ; 208
	.word ScrCmd_209                                    ; 209
	.word ScrCmd_BufferMapSecName                                    ; 210
	.word ScrCmd_211                                    ; 211
	.word ScrCmd_GetTrainerNum                                    ; 212
	.word ScrCmd_TrainerBattle                          ; 213
	.word ScrCmd_TrainerMessage                                    ; 214
	.word ScrCmd_GetTrainerMsgParams                                    ; 215
	.word ScrCmd_GetRematchMsgParams                                    ; 216
	.word ScrCmd_TrainerIsDoubleBattle                                    ; 217
	.word ScrCmd_EncounterMusic                                    ; 218
	.word ScrCmd_WhiteOut                               ; 219
	.word ScrCmd_CheckBattleWon                         ; 220
	.word ScrCmd_221                                    ; 221
	.word ScrCmd_PartyCheckForDouble                                    ; 222
	.word ScrCmd_223                                    ; 223
	.word ScrCmd_224                                    ; 224
	.word ScrCmd_225                                    ; 225
	.word ScrCmd_226                                    ; 226
	.word ScrCmd_227                                    ; 227
	.word ScrCmd_228                                    ; 228
	.word ScrCmd_229                                    ; 229
	.word ScrCmd_230                                    ; 230
	.word ScrCmd_231                                    ; 231
	.word ScrCmd_232                                    ; 232
	.word ScrCmd_233                                    ; 233
	.word ScrCmd_234                                    ; 234
	.word ScrCmd_235                                    ; 235
	.word ScrCmd_236                                    ; 236
	.word ScrCmd_237                                    ; 237
	.word ScrCmd_238                                    ; 238
	.word ScrCmd_239                                    ; 239
	.word ScrCmd_SetDynamicWarp                                    ; 240
	.word ScrCmd_GetDynamicWarpFloorNo                                    ; 241
	.word ScrCmd_ElevatorCurFloorBox                                    ; 242
	.word ScrCmd_CountJohtoDexSeen                                    ; 243
	.word ScrCmd_CountJohtoDexOwned                                    ; 244
	.word ScrCmd_CountNationalDexSeen                                    ; 245
	.word ScrCmd_CountNationalDexOwned                                    ; 246
	.word ScrCmd_247                                    ; 247
	.word ScrCmd_GetDexEvalResult                                    ; 248
	.word ScrCmd_249                                    ; 249
	.word ScrCmd_250                                    ; 250
	.word ScrCmd_CatchingTutorial                                    ; 251
	.word ScrCmd_252                                    ; 252
	.word ScrCmd_253                                    ; 253
	.word ScrCmd_254                                    ; 254
	.word ScrCmd_255                                    ; 255
	.word ScrCmd_256                                    ; 256
	.word ScrCmd_257                                    ; 257
	.word ScrCmd_258                                    ; 258
	.word ScrCmd_259                                    ; 259
	.word ScrCmd_260                                    ; 260
	.word ScrCmd_261                                    ; 261
	.word ScrCmd_262                                    ; 262
	.word ScrCmd_263                                    ; 263
	.word ScrCmd_264                                    ; 264
	.word ScrCmd_265                                    ; 265
	.word ScrCmd_266                                    ; 266
	.word ScrCmd_267                                    ; 267
	.word ScrCmd_268                                    ; 268
	.word ScrCmd_269                                    ; 269
	.word ScrCmd_270                                    ; 270
	.word ScrCmd_271                                    ; 271
	.word ScrCmd_272                                    ; 272
	.word ScrCmd_273                                    ; 273
	.word ScrCmd_274                                    ; 274
	.word ScrCmd_MartBuy                                    ; 275
	.word ScrCmd_SpecialMartBuy                                    ; 276
	.word ScrCmd_DecorationMart                                    ; 277
	.word ScrCmd_SealMart                                    ; 278
	.word ScrCmd_OverworldWhiteOut                                    ; 279
	.word ScrCmd_SetSpawn                                    ; 280
	.word ScrCmd_GetPlayerGender                        ; 281
	.word ScrCmd_HealParty                              ; 282
	.word ScrCmd_283                                    ; 283
	.word ScrCmd_284                                    ; 284
	.word ScrCmd_285                                    ; 285
	.word ScrCmd_286                                    ; 286
	.word ScrCmd_287                                    ; 287
	.word ScrCmd_288                                    ; 288
	.word ScrCmd_289                                    ; 289
	.word ScrCmd_290                                    ; 290
	.word ScrCmd_GivePokedex                                    ; 291
	.word ScrCmd_292                                    ; 292
	.word ScrCmd_GiveRunningShoes                       ; 293
	.word ScrCmd_CheckBadge                             ; 294
	.word ScrCmd_GiveBadge                              ; 295
	.word ScrCmd_CountBadges                            ; 296
	.word ScrCmd_297                                    ; 297
	.word ScrCmd_298                                    ; 298
	.word ScrCmd_CheckEscortMode                                    ; 299
	.word ScrCmd_SetEscortMode                                    ; 300
	.word ScrCmd_ClearEscortMode                                    ; 301
	.word ScrCmd_302                                    ; 302
	.word ScrCmd_303                                    ; 303
	.word ScrCmd_304                                    ; 304
	.word ScrCmd_305                                    ; 305
	.word ScrCmd_306                                    ; 306
	.word ScrCmd_307                                    ; 307
	.word ScrCmd_308                                    ; 308
	.word ScrCmd_309                                    ; 309
	.word ScrCmd_310                                    ; 310
	.word ScrCmd_311                                    ; 311
	.word ScrCmd_BufferDayCareMonNicks                                    ; 312
	.word ScrCmd_GetDayCareState                                    ; 313
	.word ScrCmd_314                                    ; 314
	.word ScrCmd_315                                    ; 315
	.word ScrCmd_316                                    ; 316
	.word ScrCmd_317                                    ; 317
	.word ScrCmd_318                                    ; 318
	.word ScrCmd_319                                    ; 319
	.word ScrCmd_320                                    ; 320
	.word ScrCmd_321                                    ; 321
	.word ScrCmd_322                                    ; 322
	.word ScrCmd_323                                    ; 323
	.word ScrCmd_324                                    ; 324
	.word ScrCmd_325                                    ; 325
	.word ScrCmd_326                                    ; 326
	.word ScrCmd_327                                    ; 327
	.word ScrCmd_328                                    ; 328
	.word ScrCmd_329                                    ; 329
	.word ScrCmd_330                                    ; 330
	.word ScrCmd_331                                    ; 331
	.word ScrCmd_GetPartyCount                          ; 332
	.word ScrCmd_333                                    ; 333
	.word ScrCmd_334                                    ; 334
	.word ScrCmd_335                                    ; 335
	.word ScrCmd_BufferBerryName                                    ; 336
	.word ScrCmd_BufferNatureName                                    ; 337
	.word ScrCmd_338                                    ; 338
	.word ScrCmd_MovePerson                           ; 339
	.word ScrCmd_SetObjectMovementType                                    ; 340
	.word ScrCmd_341                                    ; 341
	.word ScrCmd_342                                    ; 342
	.word ScrCmd_343                                    ; 343
	.word ScrCmd_344                                    ; 344
	.word ScrCmd_345                                    ; 345
	.word ScrCmd_346                                    ; 346
	.word ScrCmd_347                                    ; 347
	.word ScrCmd_348                                    ; 348
	.word ScrCmd_PartySelectUI                                    ; 349
	.word ScrCmd_350                                    ; 350
	.word ScrCmd_PartySelect                                    ; 351
	.word ScrCmd_ChooseMoveUI                                    ; 352
	.word ScrCmd_GetMoveSelection                                    ; 353
	.word ScrCmd_GetPartyMonSpecies                     ; 354
	.word ScrCmd_PartymonIsMine                         ; 355
	.word ScrCmd_PartyCountNotEgg                       ; 356
	.word ScrCmd_CountAliveMons                                    ; 357
	.word ScrCmd_PokeathlonPartyCount                                    ; 358
	.word ScrCmd_359                                    ; 359
	.word ScrCmd_SubMoneyVar                            ; 360
	.word ScrCmd_RetrieveDayCareMon                                    ; 361
	.word ScrCmd_362                                    ; 362
	.word ScrCmd_363                                    ; 363
	.word ScrCmd_364                                    ; 364
	.word ScrCmd_ResetDayCareEgg                                    ; 365
	.word ScrCmd_GiveDayCareEgg                                    ; 366
	.word ScrCmd_BufferDayCareWithdrawCost                                    ; 367
	.word ScrCmd_HasEnoughMoneyVar                      ; 368
	.word ScrCmd_EggHatchAnim                                    ; 369
	.word ScrCmd_370                                    ; 370
	.word ScrCmd_BufferDayCareMonGrowth                                    ; 371
	.word ScrCmd_GetTailDayCareMonSpeciesAndNick                                    ; 372
	.word ScrCmd_PutMonInDayCare                                    ; 373
	.word ScrCmd_374                                    ; 374
	.word ScrCmd_375                                    ; 375
	.word ScrCmd_376                                    ; 376
	.word ScrCmd_377                                    ; 377
	.word ScrCmd_378                                    ; 378
	.word ScrCmd_379                                    ; 379
	.word ScrCmd_380                                    ; 380
	.word ScrCmd_381                                    ; 381
	.word ScrCmd_382                                    ; 382
	.word ScrCmd_383                                    ; 383
	.word ScrCmd_384                                    ; 384
	.word ScrCmd_BufferDayCareMonStats                                    ; 385
	.word ScrCmd_GetPlayerFacing                                    ; 386
	.word ScrCmd_GetDayCareCompatibility                                    ; 387
	.word ScrCmd_CheckDayCareEgg                                    ; 388
	.word ScrCmd_PlayerHasSpecies                                    ; 389
	.word ScrCmd_SizeRecordCompare                                    ; 390
	.word ScrCmd_SizeRecordUpdate                                    ; 391
	.word ScrCmd_BufferMonSize                                    ; 392
	.word ScrCmd_BufferRecordSize                                    ; 393
	.word ScrCmd_394                                    ; 394
	.word ScrCmd_395                                    ; 395
	.word ScrCmd_CountMonMoves                                    ; 396
	.word ScrCmd_397                                    ; 397
	.word ScrCmd_398                                    ; 398
	.word ScrCmd_BufferPartyMonMoveName                                    ; 399
	.word ScrCmd_StrengthFlagAction                                    ; 400
	.word ScrCmd_401                                    ; 401
	.word ScrCmd_402                                    ; 402
	.word ScrCmd_403                                    ; 403
	.word ScrCmd_404                                    ; 404
	.word ScrCmd_405                                    ; 405
	.word ScrCmd_406                                    ; 406
	.word ScrCmd_407                                    ; 407
	.word ScrCmd_408                                    ; 408
	.word ScrCmd_409                                    ; 409
	.word ScrCmd_410                                    ; 410
	.word ScrCmd_411                                    ; 411
	.word ScrCmd_412                                    ; 412
	.word ScrCmd_413                                    ; 413
	.word ScrCmd_414                                    ; 414
	.word ScrCmd_415                                    ; 415
	.word ScrCmd_416                                    ; 416
	.word ScrCmd_417                                    ; 417
	.word ScrCmd_418                                    ; 418
	.word ScrCmd_419                                    ; 419
	.word ScrCmd_420                                    ; 420
	.word ScrCmd_421                                    ; 421
	.word ScrCmd_422                                    ; 422
	.word ScrCmd_CheckJohtoDexComplete                                    ; 423
	.word ScrCmd_CheckNationalDexComplete                                    ; 424
	.word ScrCmd_425                                    ; 425
	.word ScrCmd_426                                    ; 426
	.word ScrCmd_427                                    ; 427
	.word ScrCmd_428                                    ; 428
	.word ScrCmd_CountFossils                           ; 429
	.word ScrCmd_SetPhoneCall                           ; 430
	.word ScrCmd_RunPhoneCall                           ; 431
	.word ScrCmd_GetFossilPokemon                       ; 432
	.word ScrCmd_GetFossilMinimumAmount                 ; 433
	.word ScrCmd_434                                    ; 434
	.word ScrCmd_SurvivePoisoning                                    ; 435
	.word ScrCmd_436                                    ; 436
	.word ScrCmd_DebugWatch                             ; 437
	.word ScrCmd_GetStdMsgNaix                          ; 438
	.word ScrCmd_NonNpcMsgExtern                        ; 439
	.word ScrCmd_MsgboxExtern                           ; 440
	.word ScrCmd_441                                    ; 441
	.word ScrCmd_442                                    ; 442
	.word ScrCmd_443                                    ; 443
	.word ScrCmd_444                                    ; 444
	.word ScrCmd_445                                    ; 445
	.word ScrCmd_446                                    ; 446
	.word ScrCmd_SafariZoneAction                                    ; 447
	.word ScrCmd_448                                    ; 448
	.word ScrCmd_449                                    ; 449
	.word ScrCmd_450                                    ; 450
	.word ScrCmd_451                                    ; 451
	.word ScrCmd_452                                    ; 452
	.word ScrCmd_453                                    ; 453
	.word ScrCmd_454                                    ; 454
	.word ScrCmd_455                                    ; 455
	.word ScrCmd_456                                    ; 456
	.word ScrCmd_457                                    ; 457
	.word ScrCmd_458                                    ; 458
	.word ScrCmd_459                                    ; 459
	.word ScrCmd_LoadPhoneDat                                    ; 460
	.word ScrCmd_GetPhoneContactMsgIds                                    ; 461
	.word ScrCmd_462                                    ; 462
	.word ScrCmd_463                                    ; 463
	.word ScrCmd_CreateRoamer                                    ; 464
	.word ScrCmd_465                                    ; 465
	.word ScrCmd_466                                    ; 466
	.word ScrCmd_467                                    ; 467
	.word ScrCmd_468                                    ; 468
	.word ScrCmd_469                                    ; 469
	.word ScrCmd_470                                    ; 470
	.word ScrCmd_471                                    ; 471
	.word ScrCmd_472                                    ; 472
	.word ScrCmd_473                                    ; 473
	.word ScrCmd_474                                    ; 474
	.word ScrCmd_475                                    ; 475
	.word ScrCmd_476                                    ; 476
	.word ScrCmd_NatDexFlagAction                                    ; 477
	.word ScrCmd_478                                    ; 478
	.word ScrCmd_479                                    ; 479
	.word ScrCmd_MonHasRibbon                           ; 480
	.word ScrCmd_GiveRibbon                             ; 481
	.word ScrCmd_BufferRibbonName                                    ; 482
	.word ScrCmd_GetEVTotal                                    ; 483
	.word ScrCmd_GetWeekday                             ; 484
	.word ScrCmd_485                                    ; 485
	.word ScrCmd_Dummy                                  ; 486
	.word ScrCmd_PokeCenAnim                            ; 487
	.word ScrCmd_ElevatorAnim                                    ; 488
	.word ScrCmd_MysteryGift                                    ; 489
	.word ScrCmd_NopVar490                                    ; 490
	.word ScrCmd_491                                    ; 491
	.word ScrCmd_492                                    ; 492
	.word ScrCmd_PromptEasyChat                         ; 493
	.word ScrCmd_494                                    ; 494
	.word ScrCmd_GetGameVersion                                    ; 495
	.word ScrCmd_496                                    ; 496
	.word ScrCmd_497                                    ; 497
	.word ScrCmd_PrimoPasswordCheck1                    ; 498
	.word ScrCmd_PrimoPasswordCheck2                    ; 499
	.word ScrCmd_500                                    ; 500
	.word ScrCmd_501                                    ; 501
	.word ScrCmd_502                                    ; 502
	.word ScrCmd_LotoIdGet                                    ; 503
	.word ScrCmd_LotoIdSearch                                    ; 504
	.word ScrCmd_LotoIdSet                                    ; 505
	.word ScrCmd_BufferBoxMonNick                                    ; 506
	.word ScrCmd_CountPCEmptySpace                      ; 507
	.word ScrCmd_508                                    ; 508
	.word ScrCmd_509                                    ; 509
	.word ScrCmd_510                                    ; 510
	.word ScrCmd_511                                    ; 511
	.word ScrCmd_512                                    ; 512
	.word ScrCmd_513                                    ; 513
	.word ScrCmd_HallOfFameAnim                                    ; 514
	.word ScrCmd_AddSpecialGameStat                     ; 515
	.word ScrCmd_BufferFashionName                                    ; 516
	.word ScrCmd_517                                    ; 517
	.word ScrCmd_518                                    ; 518
	.word ScrCmd_519                                    ; 519
	.word ScrCmd_520                                    ; 520
	.word ScrCmd_521                                    ; 521
	.word ScrCmd_522                                    ; 522
	.word ScrCmd_523                                    ; 523
	.word ScrCmd_524                                    ; 524
	.word ScrCmd_525                                    ; 525
	.word ScrCmd_526                                    ; 526
	.word ScrCmd_527                                    ; 527
	.word ScrCmd_528                                    ; 528
	.word ScrCmd_PartySelectMon                         ; 529
	.word ScrCmd_530                                    ; 530
	.word ScrCmd_BufferBackgroundName                                    ; 531
	.word ScrCmd_CheckCoinsImmediate                                    ; 532
	.word ScrCmd_CheckGiveCoins                         ; 533
	.word ScrCmd_534                                    ; 534
	.word ScrCmd_535                                    ; 535
	.word ScrCmd_536                                    ; 536
	.word ScrCmd_537                                    ; 537
	.word ScrCmd_538                                    ; 538
	.word ScrCmd_539                                    ; 539
	.word ScrCmd_540                                    ; 540
	.word ScrCmd_BufferIntEx                                    ; 541
	.word ScrCmd_542                                    ; 542
	.word ScrCmd_543                                    ; 543
	.word ScrCmd_544                                    ; 544
	.word ScrCmd_545                                    ; 545
	.word ScrCmd_546                                    ; 546
	.word ScrCmd_547                                    ; 547
	.word ScrCmd_548                                    ; 548
	.word ScrCmd_549                                    ; 549
	.word ScrCmd_550                                    ; 550
	.word ScrCmd_551                                    ; 551
	.word ScrCmd_552                                    ; 552
	.word ScrCmd_553                                    ; 553
	.word ScrCmd_554                                    ; 554
	.word ScrCmd_555                                    ; 555
	.word ScrCmd_556                                    ; 556
	.word ScrCmd_CheckBattlePoints                                    ; 557
	.word ScrCmd_558                                    ; 558
	.word ScrCmd_559                                    ; 559
	.word ScrCmd_560                                    ; 560
	.word ScrCmd_561                                    ; 561
	.word ScrCmd_MultiBattle                                    ; 562
	.word ScrCmd_563                                    ; 563
	.word ScrCmd_564                                    ; 564
	.word ScrCmd_565                                    ; 565
	.word ScrCmd_566                                    ; 566
	.word ScrCmd_567                                    ; 567
	.word ScrCmd_568                                    ; 568
	.word ScrCmd_569                                    ; 569
	.word ScrCmd_CheckCoinsVar                                    ; 570
	.word ScrCmd_571                                    ; 571
	.word ScrCmd_572                                    ; 572
	.word ScrCmd_573                                    ; 573
	.word ScrCmd_574                                    ; 574
	.word ScrCmd_575                                    ; 575
	.word ScrCmd_576                                    ; 576
	.word ScrCmd_577                                    ; 577
	.word ScrCmd_578                                    ; 578
	.word ScrCmd_579                                    ; 579
	.word ScrCmd_BufferSealName                                    ; 580
	.word ScrCmd_581                                    ; 581
	.word ScrCmd_582                                    ; 582
	.word ScrCmd_583                                    ; 583
	.word ScrCmd_PartyLegalCheck                                    ; 584
	.word ScrCmd_585                                    ; 585
	.word ScrCmd_586                                    ; 586
	.word ScrCmd_587                                    ; 587
	.word ScrCmd_588                                    ; 588
	.word ScrCmd_WildBattle                                    ; 589
	.word ScrCmd_GetTrcardStars                                    ; 590
	.word ScrCmd_591                                    ; 591
	.word ScrCmd_592                                    ; 592
	.word ScrCmd_593                                    ; 593
	.word ScrCmd_594                                    ; 594
	.word ScrCmd_595                                    ; 595
	.word ScrCmd_596                                    ; 596
	.word ScrCmd_597                                    ; 597
	.word ScrCmd_598                                    ; 598
	.word ScrCmd_599                                    ; 599
	.word ScrCmd_600                                    ; 600
	.word ScrCmd_601                                    ; 601
	.word ScrCmd_602                                    ; 602
	.word ScrCmd_603                                    ; 603
	.word ScrCmd_604                                    ; 604
	.word ScrCmd_605                                    ; 605
	.word ScrCmd_606                                    ; 606
	.word ScrCmd_607                                    ; 607
	.word ScrCmd_608                                    ; 608
	.word ScrCmd_609                                    ; 609
	.word ScrCmd_610                                    ; 610
	.word ScrCmd_Pokeathlon                                    ; 611
	.word ScrCmd_612                                    ; 612
	.word ScrCmd_GetPhoneContactRandomGiftBerry         ; 613
	.word ScrCmd_GetPhoneContactGiftItem                ; 614
	.word ScrCmd_CameronPhoto                           ; 615
	.word ScrCmd_616                                    ; 616
	.word ScrCmd_617                                    ; 617
	.word ScrCmd_PhotoAlbumIsFull                       ; 618
	.word ScrCmd_619                                    ; 619
	.word ScrCmd_620                                    ; 620
	.word ScrCmd_621                                    ; 621
	.word ScrCmd_622                                    ; 622
	.word ScrCmd_AnimApricornTree                                    ; 623
	.word ScrCmd_ApricornTreeGetApricorn                                    ; 624
	.word ScrCmd_GiveApricornFromTree                                    ; 625
	.word ScrCmd_BufferApricornName                                    ; 626
	.word ScrCmd_627                                    ; 627
	.word ScrCmd_628                                    ; 628
	.word ScrCmd_629                                    ; 629
	.word ScrCmd_630                                    ; 630
	.word ScrCmd_631                                    ; 631
	.word ScrCmd_632                                    ; 632
	.word ScrCmd_633                                    ; 633
	.word ScrCmd_634                                    ; 634
	.word ScrCmd_635                                    ; 635
	.word ScrCmd_636                                    ; 636
	.word ScrCmd_637                                    ; 637
	.word ScrCmd_638                                    ; 638
	.word ScrCmd_639                                    ; 639
	.word ScrCmd_640                                    ; 640
	.word ScrCmd_641                                    ; 641
	.word ScrCmd_642                                    ; 642
	.word ScrCmd_643                                    ; 643
	.word ScrCmd_644                                    ; 644
	.word ScrCmd_645                                    ; 645
	.word ScrCmd_646                                    ; 646
	.word ScrCmd_647                                    ; 647
	.word ScrCmd_648                                    ; 648
	.word ScrCmd_ScratchOffCard                                    ; 649
	.word ScrCmd_ScratchOffCardEnd                                    ; 650
	.word ScrCmd_GetScratchOffPrize                                    ; 651
	.word ScrCmd_652                                    ; 652
	.word ScrCmd_MoveTutorChooseMove                                    ; 653
	.word ScrCmd_TutorMoveTeachInSlot                                    ; 654
	.word ScrCmd_TutorMoveGetPrice                                    ; 655
	.word ScrCmd_656                                    ; 656
	.word ScrCmd_StatJudge                                    ; 657
	.word ScrCmd_BufferStatName                                    ; 658
	.word ScrCmd_SetMonForme                                    ; 659
	.word ScrCmd_BufferTrainerName                                    ; 660
	.word ScrCmd_661                                    ; 661
	.word ScrCmd_662                                    ; 662
	.word ScrCmd_663                                    ; 663
	.word ScrCmd_664                                    ; 664
	.word ScrCmd_665                                    ; 665
	.word ScrCmd_666                                    ; 666
	.word ScrCmd_667                                    ; 667
	.word ScrCmd_BufferTypeName                         ; 668
	.word ScrCmd_GetItemQuantity                        ; 669
	.word ScrCmd_670                                    ; 670
	.word ScrCmd_671                                    ; 671
	.word ScrCmd_672                                    ; 672
	.word ScrCmd_673                                    ; 673
	.word ScrCmd_674                                    ; 674
	.word ScrCmd_675                                    ; 675
	.word ScrCmd_676                                    ; 676
	.word ScrCmd_677                                    ; 677
	.word ScrCmd_678                                    ; 678
	.word ScrCmd_679                                    ; 679
	.word ScrCmd_680                                    ; 680
	.word ScrCmd_681                                    ; 681
	.word ScrCmd_682                                    ; 682
	.word ScrCmd_683                                    ; 683
	.word ScrCmd_684                                    ; 684
	.word ScrCmd_685                                    ; 685
	.word ScrCmd_686                                    ; 686
	.word ScrCmd_687                                    ; 687
	.word ScrCmd_688                                    ; 688
	.word ScrCmd_CommSanitizeParty                                    ; 689
	.word ScrCmd_DayCareSanitizeMon                                    ; 690
	.word ScrCmd_691                                    ; 691
	.word ScrCmd_692                                    ; 692
	.word ScrCmd_693                                    ; 693
	.word ScrCmd_694                                    ; 694
	.word ScrCmd_695                                    ; 695
	.word ScrCmd_696                                    ; 696
	.word ScrCmd_697                                    ; 697
	.word ScrCmd_698                                    ; 698
	.word ScrCmd_699                                    ; 699
	.word ScrCmd_700                                    ; 700
	.word ScrCmd_701                                    ; 701
	.word ScrCmd_702                                    ; 702
	.word ScrCmd_703                                    ; 703
	.word ScrCmd_704                                    ; 704
	.word ScrCmd_705                                    ; 705
	.word ScrCmd_706                                    ; 706
	.word ScrCmd_707                                    ; 707
	.word ScrCmd_708                                    ; 708
	.word ScrCmd_709                                    ; 709
	.word ScrCmd_710                                    ; 710
	.word ScrCmd_711                                    ; 711
	.word ScrCmd_712                                    ; 712
	.word ScrCmd_AlphPuzzle                                    ; 713
	.word ScrCmd_714                                    ; 714
	.word ScrCmd_UpdateDayCareMonObjects                                    ; 715
	.word ScrCmd_716                                    ; 716
	.word ScrCmd_717                                    ; 717
	.word ScrCmd_718                                    ; 718
	.word ScrCmd_719                                    ; 719
	.word ScrCmd_720                                    ; 720
	.word ScrCmd_721                                    ; 721
	.word ScrCmd_722                                    ; 722
	.word ScrCmd_723                                    ; 723
	.word ScrCmd_724                                    ; 724
	.word ScrCmd_725                                    ; 725
	.word ScrCmd_726                                    ; 726
	.word ScrCmd_727                                    ; 727
	.word ScrCmd_728                                    ; 728
	.word ScrCmd_729                                    ; 729
	.word ScrCmd_730                                    ; 730
	.word ScrCmd_731                                    ; 731
	.word ScrCmd_732                                    ; 732
	.word ScrCmd_733                                    ; 733
	.word ScrCmd_734                                    ; 734
	.word ScrCmd_735                                    ; 735
	.word ScrCmd_736                                    ; 736
	.word ScrCmd_737                                    ; 737
	.word ScrCmd_738                                    ; 738
	.word ScrCmd_739                                    ; 739
	.word ScrCmd_740                                    ; 740
	.word ScrCmd_741                                    ; 741
	.word ScrCmd_742                                    ; 742
	.word ScrCmd_743                                    ; 743
	.word ScrCmd_744                                    ; 744
	.word ScrCmd_BufferPokeathlonCourseName                                    ; 745
	.word ScrCmd_TouchscreenMenuHide                    ; 746
	.word ScrCmd_TouchscreenMenuShow                    ; 747
	.word ScrCmd_GetMenuChoice                          ; 748
	.word ScrCmd_MenuInitStdGmm                         ; 749
	.word ScrCmd_MenuInit                               ; 750
	.word ScrCmd_MenuItemAdd                            ; 751
	.word ScrCmd_MenuExec                               ; 752
	.word ScrCmd_753                                    ; 753
	.word ScrCmd_754                                    ; 754
	.word ScrCmd_755                                    ; 755
	.word ScrCmd_756                                    ; 756
	.word ScrCmd_757                                    ; 757
	.word ScrCmd_758                                    ; 758
	.word ScrCmd_759                                    ; 759
	.word ScrCmd_760                                    ; 760
	.word ScrCmd_761                                    ; 761
	.word ScrCmd_762                                    ; 762
	.word ScrCmd_763                                    ; 763
	.word ScrCmd_764                                    ; 764
	.word ScrCmd_765                                    ; 765
	.word ScrCmd_766                                    ; 766
	.word ScrCmd_767                                    ; 767
	.word ScrCmd_768                                    ; 768
	.word ScrCmd_769                                    ; 769
	.word ScrCmd_770                                    ; 770
	.word ScrCmd_771                                    ; 771
	.word ScrCmd_772                                    ; 772
	.word ScrCmd_Cinematic                                    ; 773
	.word ScrCmd_774                                    ; 774
	.word ScrCmd_775                                    ; 775
	.word ScrCmd_GiveTogepiEgg                          ; 776
	.word ScrCmd_777                                    ; 777
	.word ScrCmd_GiveSpikyEarPichu                                    ; 778
	.word ScrCmd_RadioMusicIsPlaying                                    ; 779
	.word ScrCmd_CasinoGame                                    ; 780
	.word ScrCmd_781                                    ; 781
	.word ScrCmd_MartSell                                    ; 782
	.word ScrCmd_783                                    ; 783
	.word ScrCmd_ScriptOverlayCmd                                    ; 784
	.word ScrCmd_BugContestAction                                    ; 785
	.word ScrCmd_BufferBugContestWinner                                    ; 786
	.word ScrCmd_JudgeBugContest                                    ; 787
	.word ScrCmd_BufferBugContestMonNick                                    ; 788
	.word ScrCmd_BugContestGetTimeLeft                                    ; 789
	.word ScrCmd_IsBugContestantRegistered                                    ; 790
	.word ScrCmd_791                                    ; 791
	.word ScrCmd_792                                    ; 792
	.word ScrCmd_BankTransaction                        ; 793
	.word ScrCmd_CheckBankBalance                       ; 794
	.word ScrCmd_795                                    ; 795
	.word ScrCmd_796                                    ; 796
	.word ScrCmd_797                                    ; 797
	.word ScrCmd_BufferRulesetName                                    ; 798
	.word ScrCmd_799                                    ; 799
	.word ScrCmd_800                                    ; 800
	.word ScrCmd_801                                    ; 801
	.word ScrCmd_802                                    ; 802
	.word ScrCmd_803                                    ; 803
	.word ScrCmd_804                                    ; 804
	.word ScrCmd_805                                    ; 805
	.word ScrCmd_806                                    ; 806
	.word ScrCmd_807                                    ; 807
	.word ScrCmd_808                                    ; 808
	.word ScrCmd_809                                    ; 809
	.word ScrCmd_810                                    ; 810
	.word ScrCmd_811                                    ; 811
	.word ScrCmd_812                                    ; 812
	.word ScrCmd_MomGiftCheck                                    ; 813
	.word ScrCmd_814                                    ; 814
	.word ScrCmd_815                                    ; 815
	.word ScrCmd_UnownCircle                                    ; 816
	.word ScrCmd_817                                    ; 817
	.word ScrCmd_818                                    ; 818
	.word ScrCmd_819                                    ; 819
	.word ScrCmd_820                                    ; 820
	.word ScrCmd_821                                    ; 821
	.word ScrCmd_822                                    ; 822
	.word ScrCmd_823                                    ; 823
	.word ScrCmd_824                                    ; 824
	.word ScrCmd_825                                    ; 825
	.word ScrCmd_826                                    ; 826
	.word ScrCmd_GetPartymonForme                       ; 827
	.word ScrCmd_828                                    ; 828
	.word ScrCmd_829                                    ; 829
	.word ScrCmd_830                                    ; 830
	.word ScrCmd_831                                    ; 831
	.word ScrCmd_832                                    ; 832
	.word ScrCmd_833                                    ; 833
	.word ScrCmd_834                                    ; 834
	.word ScrCmd_835                                    ; 835
	.word ScrCmd_836                                    ; 836
	.word ScrCmd_837                                    ; 837
	.word ScrCmd_BankOrWalletIsFull                     ; 838
	.word ScrCmd_839                                    ; 839
	.word ScrCmd_840                                    ; 840
	.word ScrCmd_841                                    ; 841
	.word ScrCmd_842                                    ; 842
	.word ScrCmd_BufferItemNameIndef                    ; 843
	.word ScrCmd_BufferItemNamePlural                                    ; 844
	.word ScrCmd_BufferPartyMonSpeciesNameIndef                                    ; 845
	.word ScrCmd_BufferSpeciesNameIndef                                    ; 846
	.word ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef                                    ; 847
	.word ScrCmd_BufferFashionNameIndef                                    ; 848
	.word ScrCmd_BufferTrainerClassNameIndef                                    ; 849
	.word ScrCmd_BufferSealNamePlural                                    ; 850
	.word ScrCmd_Capitalize                                    ; 851
	.word ScrCmd_BufferDeptStoreFloorNo                                    ; 852
gScriptCmdTable_end:

	.bss

_021D415C:
	.space 0x10

	.text

	thumb_func_start ScrCmd_Nop
ScrCmd_Nop: ; 0x02040890
	mov r0, #0
	bx lr
	thumb_func_end ScrCmd_Nop

	thumb_func_start ScrCmd_Dummy
ScrCmd_Dummy: ; 0x02040894
	mov r0, #0
	bx lr
	thumb_func_end ScrCmd_Dummy

	thumb_func_start ScrCmd_End
ScrCmd_End: ; 0x02040898
	push {r3, lr}
	bl StopScript
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_End

	thumb_func_start ScrCmd_Wait
ScrCmd_Wait: ; 0x020408A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl GetVarPointer
	strh r7, [r0]
	ldr r1, _020408D4 ; =RunPauseTimer
	add r0, r5, #0
	str r4, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020408D4: .word RunPauseTimer
	thumb_func_end ScrCmd_Wait

	thumb_func_start RunPauseTimer
RunPauseTimer: ; 0x020408D8
	push {r3, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	bne _020408FA
	mov r0, #1
	pop {r3, pc}
_020408FA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end RunPauseTimer

	thumb_func_start ScrCmd_DebugWatch
ScrCmd_DebugWatch: ; 0x02040900
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_DebugWatch

	thumb_func_start ScrCmd_LoadByte
ScrCmd_LoadByte: ; 0x02040918
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r2, [r2]
	lsl r1, r3, #2
	add r0, r0, r1
	str r2, [r0, #0x64]
	mov r0, #0
	bx lr
	thumb_func_end ScrCmd_LoadByte

	thumb_func_start ScrCmd_LoadWord
ScrCmd_LoadWord: ; 0x02040930
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r5, [r2]
	bl ScriptReadWord
	lsl r1, r5, #2
	add r1, r4, r1
	str r0, [r1, #0x64]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_LoadWord

	thumb_func_start ScrCmd_LoadByteFromAddr
ScrCmd_LoadByteFromAddr: ; 0x0204094C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadWord
	ldrb r1, [r0]
	lsl r0, r4, #2
	add r0, r5, r0
	str r1, [r0, #0x64]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_LoadByteFromAddr

	thumb_func_start ScrCmd_WriteByteToAddr
ScrCmd_WriteByteToAddr: ; 0x02040968
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	strb r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_WriteByteToAddr

	thumb_func_start ScrCmd_SetPtrByte
ScrCmd_SetPtrByte: ; 0x02040980
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	strb r1, [r0]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_SetPtrByte

	thumb_func_start ScrCmd_CopyLocal
ScrCmd_CopyLocal: ; 0x0204099C
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r2, [r1, #0x64]
	lsl r1, r3, #2
	add r0, r0, r1
	str r2, [r0, #0x64]
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ScrCmd_CopyLocal

	thumb_func_start ScrCmd_CopyByte
ScrCmd_CopyByte: ; 0x020409BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	ldrb r0, [r0]
	strb r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CopyByte

	thumb_func_start Compare
Compare: ; 0x020409D4
	cmp r0, r1
	bhs _020409DC
	mov r0, #0
	bx lr
_020409DC:
	cmp r0, r1
	bne _020409E4
	mov r0, #1
	bx lr
_020409E4:
	mov r0, #2
	bx lr
	thumb_func_end Compare

	thumb_func_start ScrCmd_CompareLocalToLocal
ScrCmd_CompareLocalToLocal: ; 0x020409E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldrb r0, [r0]
	add r2, r1, #1
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x64]
	str r2, [r4, #8]
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl Compare
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_CompareLocalToLocal

	thumb_func_start ScrCmd_CompareLocalToValue
ScrCmd_CompareLocalToValue: ; 0x02040A18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldrb r0, [r0]
	add r2, r1, #1
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x64]
	str r2, [r4, #8]
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl Compare
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CompareLocalToValue

	thumb_func_start ScrCmd_CompareLocalToAddr
ScrCmd_CompareLocalToAddr: ; 0x02040A40
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	bl ScriptReadWord
	ldrb r1, [r0]
	add r0, r5, #0
	bl Compare
	strb r0, [r4, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CompareLocalToAddr

	thumb_func_start ScrCmd_CompareAddrToLocal
ScrCmd_CompareAddrToLocal: ; 0x02040A68
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	ldrb r0, [r0]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl Compare
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CompareAddrToLocal

	thumb_func_start ScrCmd_CompareAddrToValue
ScrCmd_CompareAddrToValue: ; 0x02040A90
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	ldrb r0, [r0]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	bl Compare
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_CompareAddrToValue

	thumb_func_start ScrCmd_CompareAddrToAddr
ScrCmd_CompareAddrToAddr: ; 0x02040AAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadWord
	ldrb r4, [r0]
	add r0, r5, #0
	bl ScriptReadWord
	ldrb r1, [r0]
	add r0, r4, #0
	bl Compare
	strb r0, [r5, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CompareAddrToAddr

	thumb_func_start ScrCmd_CompareVarToValue
ScrCmd_CompareVarToValue: ; 0x02040ACC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldrh r5, [r0]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	bl Compare
	strb r0, [r4, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CompareVarToValue

	thumb_func_start ScrCmd_CompareVarToVar
ScrCmd_CompareVarToVar: ; 0x02040AF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r1]
	bl Compare
	strb r0, [r5, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CompareVarToVar

	thumb_func_start ScrCmd_RunScript
ScrCmd_RunScript: ; 0x02040B30
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #7
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xe
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r7, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	bl CreateScriptContext
	str r0, [r6]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_RunScript

	thumb_func_start ScrCmd_RunScriptWait
ScrCmd_RunScriptWait: ; 0x02040B68
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x80
	ldr r7, [r0]
	mov r1, #5
	add r0, r7, #0
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #7
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldrb r1, [r4]
	add r0, r7, #0
	add r1, #0xd
	bl FieldSysGetAttrAddr
	str r0, [sp]
	add r0, r6, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r7, #0
	bl CreateScriptContext
	ldr r1, [sp]
	str r0, [r1]
	ldrb r1, [r4]
	strb r1, [r0, #3]
	ldrb r0, [r4]
	mov r1, #1
	add r0, r0, #1
	strb r0, [r4]
	ldrb r0, [r6, #3]
	ldrb r2, [r5]
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	strb r0, [r5]
	ldr r1, _02040BC8 ; =sub_02040BCC
	add r0, r6, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02040BC8: .word sub_02040BCC
	thumb_func_end ScrCmd_RunScriptWait

	thumb_func_start sub_02040BCC
sub_02040BCC: ; 0x02040BCC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #5
	add r0, r6, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #7
	bl FieldSysGetAttrAddr
	mov r0, #1
	ldrb r1, [r5, #3]
	add r2, r0, #0
	ldrb r3, [r4]
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	beq _02040BF8
	mov r0, #0
_02040BF8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02040BCC

	thumb_func_start ScrCmd_RestartCurrentScript
ScrCmd_RestartCurrentScript: ; 0x02040BFC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #5
	add r0, r6, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #7
	bl FieldSysGetAttrAddr
	ldrb r0, [r5, #3]
	ldrb r2, [r4]
	mov r1, #1
	sub r0, r0, #1
	lsl r1, r0
	add r0, r2, #0
	eor r0, r1
	strb r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_RestartCurrentScript

	thumb_func_start ScrCmd_GoTo
ScrCmd_GoTo: ; 0x02040C2C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	add r2, r0, #0
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r1, r1, r2
	bl ScriptJump
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_GoTo

	thumb_func_start ScrCmd_ObjectGoTo
ScrCmd_ObjectGoTo: ; 0x02040C44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadWord
	add r7, r0, #0
	ldr r0, [r6]
	bl MapObject_GetID
	cmp r4, r0
	bne _02040C78
	ldr r1, [r5, #8]
	add r0, r5, #0
	add r1, r1, r7
	bl ScriptJump
_02040C78:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_ObjectGoTo

	thumb_func_start ScrCmd_BgGoTo
ScrCmd_BgGoTo: ; 0x02040C7C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x74]
	bl sub_02050658
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	add r0, r5, #0
	bl ScriptReadWord
	add r2, r0, #0
	cmp r6, r4
	bne _02040CA6
	ldr r1, [r5, #8]
	add r0, r5, #0
	add r1, r1, r2
	bl ScriptJump
_02040CA6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_BgGoTo

	thumb_func_start ScrCmd_DirectionGoTo
ScrCmd_DirectionGoTo: ; 0x02040CAC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #9
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	add r0, r5, #0
	bl ScriptReadWord
	add r2, r0, #0
	ldr r0, [r6]
	cmp r0, r4
	bne _02040CDC
	ldr r1, [r5, #8]
	add r0, r5, #0
	add r1, r1, r2
	bl ScriptJump
_02040CDC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_DirectionGoTo

	thumb_func_start ScrCmd_Call
ScrCmd_Call: ; 0x02040CE0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	add r2, r0, #0
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r1, r1, r2
	bl ScriptCall
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_Call

	thumb_func_start ScrCmd_Return
ScrCmd_Return: ; 0x02040CF8
	push {r3, lr}
	bl ScriptReturn
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_Return

	thumb_func_start ScrCmd_GoToIf
ScrCmd_GoToIf: ; 0x02040D04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadWord
	add r1, r0, #0
	lsl r0, r4, #1
	add r3, r4, r0
	ldr r0, _02040D34 ; =sConditionTable
	ldrb r2, [r5, #2]
	add r0, r0, r3
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _02040D30
	ldr r2, [r5, #8]
	add r0, r5, #0
	add r1, r2, r1
	bl ScriptJump
_02040D30:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040D34: .word sConditionTable
	thumb_func_end ScrCmd_GoToIf

	thumb_func_start ScrCmd_CallIf
ScrCmd_CallIf: ; 0x02040D38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadWord
	add r1, r0, #0
	lsl r0, r4, #1
	add r3, r4, r0
	ldr r0, _02040D68 ; =sConditionTable
	ldrb r2, [r5, #2]
	add r0, r0, r3
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _02040D64
	ldr r2, [r5, #8]
	add r0, r5, #0
	add r1, r2, r1
	bl ScriptCall
_02040D64:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040D68: .word sConditionTable
	thumb_func_end ScrCmd_CallIf

	thumb_func_start ScrCmd_SetFlag
ScrCmd_SetFlag: ; 0x02040D6C
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl FlagSet
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_SetFlag

	thumb_func_start ScrCmd_ClearFlag
ScrCmd_ClearFlag: ; 0x02040D84
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl FlagClear
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_ClearFlag

	thumb_func_start ScrCmd_CheckFlag
ScrCmd_CheckFlag: ; 0x02040D9C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	bl FlagGet
	strb r0, [r4, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CheckFlag

	thumb_func_start ScrCmd_CheckFlagVar
ScrCmd_CheckFlagVar: ; 0x02040DB8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldrh r1, [r6]
	add r0, r5, #0
	bl FlagGet
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_CheckFlagVar

	thumb_func_start ScrCmd_SetFlagVar
ScrCmd_SetFlagVar: ; 0x02040DF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r1, r0, #0
	ldrh r1, [r1]
	add r0, r4, #0
	bl FlagSet
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_SetFlagVar

	thumb_func_start ScrCmd_ClearFlagVar
ScrCmd_ClearFlagVar: ; 0x02040E1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r1, r0, #0
	ldrh r1, [r1]
	add r0, r4, #0
	bl FlagClear
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ClearFlagVar

	thumb_func_start ScrCmd_SetTrainerFlag
ScrCmd_SetTrainerFlag: ; 0x02040E44
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl TrainerFlagSet
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_SetTrainerFlag

	thumb_func_start ScrCmd_ClearTrainerFlag
ScrCmd_ClearTrainerFlag: ; 0x02040E68
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl TrainerFlagClear
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_ClearTrainerFlag

	thumb_func_start ScrCmd_CheckTrainerFlag
ScrCmd_CheckTrainerFlag: ; 0x02040E8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl TrainerFlagCheck
	strb r0, [r5, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CheckTrainerFlag

	thumb_func_start ScrCmd_AddVar
ScrCmd_AddVar: ; 0x02040EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	ldrh r1, [r4]
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_AddVar

	thumb_func_start ScrCmd_SubVar
ScrCmd_SubVar: ; 0x02040EE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	ldrh r1, [r4]
	sub r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_SubVar

	thumb_func_start ScrCmd_SetVar
ScrCmd_SetVar: ; 0x02040F14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_SetVar

	thumb_func_start ScrCmd_CopyVar
ScrCmd_CopyVar: ; 0x02040F38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CopyVar

	thumb_func_start ScrCmd_SetOrCopyVar
ScrCmd_SetOrCopyVar: ; 0x02040F68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_SetOrCopyVar

	thumb_func_start ScrCmd_048
ScrCmd_048: ; 0x02040F94
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	bl sub_02037474
	cmp r0, #0
	bne _02040FBC
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl ov01_021EF4DC
	b _02040FDC
_02040FBC:
	add r0, sp, #4
	add r1, r5, #0
	bl ov01_021EF4C4
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0]
	strb r1, [r0, #1]
	add r0, sp, #4
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov01_021EF4DC
_02040FDC:
	ldr r1, _02040FEC ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02040FEC: .word ov01_021EF348
	thumb_func_end ScrCmd_048

	thumb_func_start ScrCmd_049
ScrCmd_049: ; 0x02040FF0
	push {r3, lr}
	ldr r1, _02040FFC ; =sub_02041000
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02040FFC: .word sub_02041000
	thumb_func_end ScrCmd_049

	thumb_func_start sub_02041000
sub_02041000: ; 0x02041000
	ldr r0, _02041014 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0204100E
	mov r0, #1
	bx lr
_0204100E:
	mov r0, #0
	bx lr
	nop
_02041014: .word gMain
	thumb_func_end sub_02041000

	thumb_func_start ScrCmd_348
ScrCmd_348: ; 0x02041018
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	ldr r1, _0204103C ; =sub_02041040
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_0204103C: .word sub_02041040
	thumb_func_end ScrCmd_348

	thumb_func_start sub_02041040
sub_02041040: ; 0x02041040
	ldr r1, _02041060 ; =gMain
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	beq _0204104E
	mov r0, #1
	bx lr
_0204104E:
	ldr r1, [r0, #0x64]
	sub r1, r1, #1
	str r1, [r0, #0x64]
	bne _0204105A
	mov r0, #1
	bx lr
_0204105A:
	mov r0, #0
	bx lr
	nop
_02041060: .word gMain
	thumb_func_end sub_02041040

	thumb_func_start ScrCmd_WaitButton
ScrCmd_WaitButton: ; 0x02041064
	push {r3, lr}
	ldr r1, _02041070 ; =sub_02041074
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02041070: .word sub_02041074
	thumb_func_end ScrCmd_WaitButton

	thumb_func_start sub_02041074
sub_02041074: ; 0x02041074
	push {r3, lr}
	ldr r1, _020410DC ; =gMain
	ldr r2, [r1, #0x48]
	mov r1, #3
	add r3, r2, #0
	tst r3, r1
	beq _02041086
	mov r0, #1
	pop {r3, pc}
_02041086:
	mov r3, #0x40
	tst r3, r2
	beq _0204109A
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_0204109A:
	mov r3, #0x80
	tst r3, r2
	beq _020410AE
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_020410AE:
	mov r3, #0x20
	tst r3, r2
	beq _020410C2
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_020410C2:
	mov r3, #0x10
	tst r2, r3
	beq _020410D4
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_020410D4:
	mov r0, #0
	pop {r3, pc}
_020410D8:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020410DC: .word gMain
	thumb_func_end sub_02041074

	thumb_func_start ScrCmd_051
ScrCmd_051: ; 0x020410E0
	push {r3, lr}
	ldr r1, _020410EC ; =sub_020410F0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020410EC: .word sub_020410F0
	thumb_func_end ScrCmd_051

	thumb_func_start sub_020410F0
sub_020410F0: ; 0x020410F0
	ldr r0, _0204110C ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _020410FE
	mov r0, #1
	bx lr
_020410FE:
	mov r0, #0xf0
	tst r0, r1
	beq _02041108
	mov r0, #1
	bx lr
_02041108:
	mov r0, #0
	bx lr
	.balign 4, 0
_0204110C: .word gMain
	thumb_func_end sub_020410F0

	thumb_func_start ScrCmd_OpenMsg
ScrCmd_OpenMsg: ; 0x02041110
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #6
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	ldr r0, [r4, #8]
	mov r2, #3
	bl sub_0205B514
	add r0, r4, #0
	mov r1, #1
	bl FieldSysGetAttrAddr
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0205B564
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	orr r0, r1
	strb r0, [r4]
	mov r0, #1
	strb r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_OpenMsg

	thumb_func_start ScrCmd_CloseMsg
ScrCmd_CloseMsg: ; 0x02041168
	push {r4, r5, r6, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #1
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #6
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	mov r0, #0
	strb r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_CloseMsg

	thumb_func_start ScrCmd_054
ScrCmd_054: ; 0x020411A4
	push {r4, r5, r6, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #1
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #6
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r6, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	mov r0, #0
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_054

	thumb_func_start ScrCmd_062
ScrCmd_062: ; 0x020411D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x32
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2e
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x33
	bl FieldSysGetAttrAddr
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x34
	bl FieldSysGetAttrAddr
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x2f
	bl FieldSysGetAttrAddr
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x35
	bl FieldSysGetAttrAddr
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	strh r1, [r6]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	strh r1, [r7]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r2, [r2]
	ldr r1, [sp]
	strh r2, [r1]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r2, [r2]
	ldr r1, [sp, #4]
	strh r2, [r1]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r2, [r2]
	ldr r1, [sp, #8]
	strh r2, [r1]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	strh r1, [r0]
	ldr r1, _0204126C ; =sub_02041270
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0204126C: .word sub_02041270
	thumb_func_end ScrCmd_062

	thumb_func_start sub_02041270
sub_02041270: ; 0x02041270
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x32
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x33
	bl FieldSysGetAttrAddr
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x34
	bl FieldSysGetAttrAddr
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x35
	bl FieldSysGetAttrAddr
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2e
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2f
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	ldrh r0, [r6]
	cmp r0, #0
	bne _020412C6
	ldrh r0, [r5]
	cmp r0, #0
	bne _020412C6
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020412C6:
	ldrh r3, [r7]
	cmp r3, #0
	beq _020412E8
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _020412E0
	mov r1, #3
	mov r2, #1
	bl BgSetPosTextAndCommit
	b _020412E8
_020412E0:
	mov r1, #3
	mov r2, #2
	bl BgSetPosTextAndCommit
_020412E8:
	ldr r0, [sp, #4]
	ldrh r3, [r0]
	cmp r3, #0
	beq _0204130C
	ldr r0, [sp]
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _02041304
	mov r1, #3
	mov r2, #4
	bl BgSetPosTextAndCommit
	b _0204130C
_02041304:
	mov r1, #3
	mov r2, #5
	bl BgSetPosTextAndCommit
_0204130C:
	ldrh r0, [r6]
	cmp r0, #0
	beq _02041316
	sub r0, r0, #1
	strh r0, [r6]
_02041316:
	ldrh r0, [r5]
	cmp r0, #0
	beq _02041320
	sub r0, r0, #1
	strh r0, [r5]
_02041320:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02041270

	thumb_func_start ScrCmd_DirectionSignpost
ScrCmd_DirectionSignpost: ; 0x02041328
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x12
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x11
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	str r0, [sp, #0x18]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r0, [r0]
	str r0, [sp, #0x10]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ScriptReadHalfword
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	ldr r2, [sp, #0x1c]
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x68]
	ldr r1, [sp, #0x14]
	bl ov01_021F3D68
	ldr r0, [r4, #0x68]
	mov r1, #1
	bl ov01_021F3D70
	add r0, r4, #0
	bl ov01_021F3D98
	ldr r0, [r5, #0x78]
	ldr r1, [sp, #0x10]
	ldr r2, [r6]
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x18]
	ldr r1, [r7]
	ldr r0, [r0]
	ldr r2, [r6]
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x68]
	bl ov01_021F3D80
	mov r3, #0
	str r3, [sp]
	ldr r1, _020413D0 ; =0x00020A0F
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r7]
	mov r1, #1
	bl AddTextPrinterParameterized2
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020413D0: .word 0x00020A0F
	thumb_func_end ScrCmd_DirectionSignpost

	thumb_func_start ScrCmd_055
ScrCmd_055: ; 0x020413D4
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r4, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r5, [r2]
	bl ScriptReadHalfword
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x68]
	add r1, r5, #0
	bl ov01_021F3D68
	ldr r0, [r4, #0x68]
	mov r1, #1
	bl ov01_021F3D70
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_055

	thumb_func_start ScrCmd_057
ScrCmd_057: ; 0x02041410
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	ldr r0, [r3, #0x68]
	bl ov01_021F3D70
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_057

	thumb_func_start ScrCmd_058
ScrCmd_058: ; 0x0204142C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	bl ov01_021F3D88
	cmp r0, #1
	bne _02041442
	mov r0, #0
	pop {r4, pc}
_02041442:
	ldr r1, _02041450 ; =sub_02041454
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02041450: .word sub_02041454
	thumb_func_end ScrCmd_058

	thumb_func_start sub_02041454
sub_02041454: ; 0x02041454
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	bl ov01_021F3D88
	cmp r0, #1
	bne _02041468
	mov r0, #1
	pop {r3, pc}
_02041468:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02041454

	thumb_func_start ScrCmd_TrainerTips
ScrCmd_TrainerTips: ; 0x0204146C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #3
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x12
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x11
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	str r0, [sp, #0x18]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x78]
	ldr r1, [sp, #0x10]
	ldr r2, [r6]
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x18]
	ldr r1, [r7]
	ldr r0, [r0]
	ldr r2, [r6]
	bl StringExpandPlaceholders
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r4, #0x68]
	bl ov01_021F3D80
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _02041518 ; =0x00020A0F
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r7]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	ldr r0, [sp, #0x1c]
	ldr r1, _0204151C ; =sub_02041520
	str r0, [r5, #0x64]
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02041518: .word 0x00020A0F
_0204151C: .word sub_02041520
	thumb_func_end ScrCmd_TrainerTips

	thumb_func_start sub_02041520
sub_02041520: ; 0x02041520
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #3
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #0x64]
	add r7, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r6, r0, #0
	ldr r0, [r4, #0x68]
	bl ov01_021F3D84
	ldrb r0, [r7]
	ldr r4, _020415BC ; =0x0000FFFF
	bl sub_0205B624
	cmp r0, #1
	bne _0204155A
	mov r0, #2
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204155A:
	ldr r0, _020415C0 ; =gMain
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02041568
	mov r4, #0
	b _02041584
_02041568:
	mov r1, #0x80
	tst r1, r0
	beq _02041572
	mov r4, #1
	b _02041584
_02041572:
	mov r1, #0x20
	tst r1, r0
	beq _0204157C
	mov r4, #2
	b _02041584
_0204157C:
	mov r1, #0x10
	tst r0, r1
	beq _02041584
	mov r4, #3
_02041584:
	ldr r0, _020415BC ; =0x0000FFFF
	cmp r4, r0
	beq _020415B8
	ldrb r0, [r7]
	bl sub_020200A0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	mov r0, #0
	strh r0, [r6]
	add r5, #0x80
	ldr r2, [r5]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r2, #0xd2
	bic r1, r0
	strb r1, [r2]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020415B8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020415BC: .word 0x0000FFFF
_020415C0: .word gMain
	thumb_func_end sub_02041520

	thumb_func_start ScrCmd_060
ScrCmd_060: ; 0x020415C4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _020415DC ; =sub_020415E0
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_020415DC: .word sub_020415E0
	thumb_func_end ScrCmd_060

	thumb_func_start sub_020415E0
sub_020415E0: ; 0x020415E0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r1, [r5, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r6, r0, #0
	ldr r0, _0204166C ; =gMain
	ldr r1, _02041670 ; =0x0000FFFF
	ldr r2, [r0, #0x48]
	mov r0, #3
	add r3, r2, #0
	tst r3, r0
	beq _0204161A
	mov r0, #0
	strh r0, [r6]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0204161A:
	mov r3, #0x40
	tst r3, r2
	beq _02041624
	mov r1, #0
	b _02041640
_02041624:
	mov r3, #0x80
	tst r3, r2
	beq _0204162E
	mov r1, #1
	b _02041640
_0204162E:
	mov r3, #0x20
	tst r3, r2
	beq _02041638
	mov r1, #2
	b _02041640
_02041638:
	mov r3, #0x10
	tst r2, r3
	beq _02041640
	add r1, r0, #0
_02041640:
	ldr r0, _02041670 ; =0x0000FFFF
	cmp r1, r0
	beq _02041666
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	mov r0, #0
	strh r0, [r6]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041666:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0204166C: .word gMain
_02041670: .word 0x0000FFFF
	thumb_func_end sub_020415E0

	thumb_func_start ScrCmd_061
ScrCmd_061: ; 0x02041674
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0204031C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_061

	thumb_func_start ScrCmd_063
ScrCmd_063: ; 0x02041684
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #2
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	ldr r2, _020416D8 ; =0x000003D9
	mov r1, #3
	mov r3, #0xb
	bl sub_0200E3DC
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, _020416DC ; =_020FAC94
	ldr r2, _020416D8 ; =0x000003D9
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	str r0, [r6]
	ldr r1, _020416E0 ; =sub_020416E4
	add r0, r5, #0
	str r7, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020416D8: .word 0x000003D9
_020416DC: .word _020FAC94
_020416E0: .word sub_020416E4
	thumb_func_end ScrCmd_063

	thumb_func_start sub_020416E4
sub_020416E4: ; 0x020416E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #2
	add r0, r6, #0
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #4
	bl sub_02001FDC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02041718
	mov r0, #0
	pop {r4, r5, r6, pc}
_02041718:
	cmp r0, #0
	bne _02041720
	mov r0, #0
	b _02041722
_02041720:
	mov r0, #1
_02041722:
	strh r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020416E4

	thumb_func_start ScrCmd_345
ScrCmd_345: ; 0x02041728
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl FieldSysGetAttrAddr
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0x13
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	ldr r1, _02041754 ; =0x000003E2
	add r0, r4, #0
	bl sub_0200F0AC
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02041754: .word 0x000003E2
	thumb_func_end ScrCmd_345

	thumb_func_start ScrCmd_346
ScrCmd_346: ; 0x02041758
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x13
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl sub_0200F450
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_346

	thumb_func_start sub_02041770
sub_02041770: ; 0x02041770
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	add r6, r1, #0
	mov r1, #0x10
	add r7, r2, #0
	str r0, [sp, #0x20]
	bl FieldSysGetAttrAddr
	str r0, [sp, #0x24]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r0, [r0]
	add r2, r1, #1
	str r0, [sp, #0x1c]
	str r2, [r5, #8]
	ldrb r0, [r1]
	add r1, r2, #1
	str r0, [sp, #0x18]
	str r1, [r5, #8]
	ldrb r0, [r2]
	str r0, [sp, #0x14]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	bl GetVarPointer
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl FieldSysGetAttrAddr
	ldr r1, [sp, #0x2c]
	str r4, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x24]
	ldr r1, [r1]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x14]
	bl ov01_021EDF78
	str r0, [r6]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x64]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02041770

	thumb_func_start ScrCmd_064
ScrCmd_064: ; 0x020417EC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_064

	thumb_func_start ScrCmd_065
ScrCmd_065: ; 0x02041808
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	ldr r2, [r4, #0x78]
	add r0, r4, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_065

	thumb_func_start ScrCmd_066
ScrCmd_066: ; 0x02041824
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r1, [r4, #8]
	add r3, r1, #1
	str r3, [r4, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r4, #8]
	ldrb r2, [r3]
	ldr r0, [r0]
	bl ov01_021EDC7C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_066

	thumb_func_start ScrCmd_559
ScrCmd_559: ; 0x0204184C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl ov01_021EDC7C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_559

	thumb_func_start ScrCmd_067
ScrCmd_067: ; 0x02041890
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021EDC84
	ldr r1, _020418B0 ; =sub_020418B4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020418B0: .word sub_020418B4
	thumb_func_end ScrCmd_067

	thumb_func_start sub_020418B4
sub_020418B4: ; 0x020418B4
	push {r3, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	ldr r0, _020418D8 ; =0x0000EEEE
	cmp r1, r0
	beq _020418D2
	mov r0, #1
	pop {r3, pc}
_020418D2:
	mov r0, #0
	pop {r3, pc}
	nop
_020418D8: .word 0x0000EEEE
	thumb_func_end sub_020418B4

	thumb_func_start ScrCmd_585
ScrCmd_585: ; 0x020418DC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021EDC84
	ldr r1, _020418FC ; =sub_02041900
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020418FC: .word sub_02041900
	thumb_func_end ScrCmd_585

	thumb_func_start sub_02041900
sub_02041900: ; 0x02041900
	push {r4, r5, r6, lr}
	add r1, r0, #0
	add r0, #0x80
	ldr r1, [r1, #0x64]
	ldr r5, [r0]
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldrh r1, [r4]
	ldr r0, _0204194C ; =0x0000EEEE
	cmp r1, r0
	bne _02041946
	add r5, #0x80
	ldr r0, [r5]
	bl sub_0205A478
	cmp r0, #0
	beq _02041942
	mov r0, #8
	strh r0, [r4]
	ldr r0, [r6]
	bl ov01_021EDF38
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041942:
	mov r0, #0
	pop {r4, r5, r6, pc}
_02041946:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0204194C: .word 0x0000EEEE
	thumb_func_end sub_02041900

	thumb_func_start ScrCmd_068
ScrCmd_068: ; 0x02041950
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_068

	thumb_func_start ScrCmd_069
ScrCmd_069: ; 0x0204196C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	ldr r2, [r4, #0x78]
	add r0, r4, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_069

	thumb_func_start ScrCmd_070
ScrCmd_070: ; 0x02041988
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r3, r0, #0
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl MoveTutorMenu_SetListItem
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_070

	thumb_func_start ScrCmd_071
ScrCmd_071: ; 0x020419E8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021EDFA4
	ldr r1, _02041A08 ; =sub_020418B4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02041A08: .word sub_020418B4
	thumb_func_end ScrCmd_071

	thumb_func_start ScrCmd_695
ScrCmd_695: ; 0x02041A0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r4]
	bl ov01_021EE014
	ldr r1, _02041A44 ; =sub_020418B4
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02041A44: .word sub_020418B4
	thumb_func_end ScrCmd_695

	thumb_func_start ScrCmd_677
ScrCmd_677: ; 0x02041A48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl ov01_021EE0EC
	ldr r1, _02041A94 ; =sub_020418B4
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02041A94: .word sub_020418B4
	thumb_func_end ScrCmd_677

	thumb_func_start ScrCmd_072
ScrCmd_072: ; 0x02041A98
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021EE974
	ldr r1, _02041AC0 ; =sub_020418B4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02041AC0: .word sub_020418B4
	thumb_func_end ScrCmd_072

	thumb_func_start ScrCmd_841
ScrCmd_841: ; 0x02041AC4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021EF018
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_841

	thumb_func_start ScrCmd_842
ScrCmd_842: ; 0x02041AE4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl FieldSysGetAttrAddr
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021EF034
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_842

	thumb_func_start ScrCmd_ApplyMovement
ScrCmd_ApplyMovement: ; 0x02041B04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_02041C70
	add r7, r0, #0
	bne _02041B3E
	cmp r4, #0xfd
	beq _02041B3A
	bl GF_AssertFail
_02041B3A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02041B3E:
	cmp r4, #0xfd
	bne _02041B46
	bl ov01_021F7704
_02041B46:
	ldr r1, [r5, #8]
	add r0, r7, #0
	add r1, r1, r6
	bl EventObjectMovementMan_Create
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	bl FieldSysGetAttrAddr
	ldrb r1, [r0]
	add r5, #0x80
	mov r2, #0
	add r1, r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_02041CC4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_ApplyMovement

	thumb_func_start ScrCmd_563
ScrCmd_563: ; 0x02041B74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_02041C70
	str r0, [sp, #4]
	cmp r0, #0
	bne _02041BCA
	bl GF_AssertFail
_02041BCA:
	mov r0, #4
	add r1, r0, #0
	add r1, #0xfc
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl MapObject_GetNextX
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [sp, #4]
	bl MapObject_GetNextY
	lsl r0, r0, #0x10
	ldr r2, [sp]
	lsr r0, r0, #0x10
	mov r1, #0
	cmp r6, r2
	bhs _02041C00
	mov r2, #0xf
	strh r2, [r4]
	ldr r2, [sp]
	add r1, r1, #1
	sub r2, r2, r6
	strh r2, [r4, #2]
	b _02041C10
_02041C00:
	cmp r6, r2
	bls _02041C10
	mov r2, #0xe
	strh r2, [r4]
	ldr r2, [sp]
	add r1, r1, #1
	sub r2, r6, r2
	strh r2, [r4, #2]
_02041C10:
	cmp r0, r7
	bhs _02041C24
	lsl r2, r1, #2
	mov r3, #0xc
	strh r3, [r4, r2]
	sub r3, r7, r0
	add r0, r4, r2
	strh r3, [r0, #2]
	add r1, r1, #1
	b _02041C36
_02041C24:
	cmp r0, r7
	bls _02041C36
	lsl r2, r1, #2
	mov r3, #0xd
	strh r3, [r4, r2]
	sub r3, r0, r7
	add r0, r4, r2
	strh r3, [r0, #2]
	add r1, r1, #1
_02041C36:
	lsl r2, r1, #2
	mov r0, #0xfe
	strh r0, [r4, r2]
	mov r1, #0
	add r0, r4, r2
	strh r1, [r0, #2]
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl EventObjectMovementMan_Create
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	bl FieldSysGetAttrAddr
	ldrb r1, [r0]
	add r5, #0x80
	add r2, r4, #0
	add r1, r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_02041CC4
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_563

	thumb_func_start sub_02041C70
sub_02041C70: ; 0x02041C70
	push {r3, lr}
	cmp r1, #0xf2
	bne _02041C80
	ldr r0, [r0, #0x3c]
	mov r1, #0x30
	bl sub_0205EEB4
	pop {r3, pc}
_02041C80:
	cmp r1, #0xf1
	bne _02041C8E
	mov r1, #0xb
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	pop {r3, pc}
_02041C8E:
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041C70

	thumb_func_start ScrCmd_WaitMovement
ScrCmd_WaitMovement: ; 0x02041C98
	push {r3, lr}
	ldr r1, _02041CA4 ; =sub_02041CA8
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02041CA4: .word sub_02041CA8
	thumb_func_end ScrCmd_WaitMovement

	thumb_func_start sub_02041CA8
sub_02041CA8: ; 0x02041CA8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	bl FieldSysGetAttrAddr
	ldrb r0, [r0]
	cmp r0, #0
	bne _02041CBE
	mov r0, #1
	pop {r3, pc}
_02041CBE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041CA8

	thumb_func_start sub_02041CC4
sub_02041CC4: ; 0x02041CC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x10
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02041CDE
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_02041CDE:
	str r5, [r4, #0xc]
	str r6, [r4, #4]
	ldr r0, _02041CF4 ; =sub_02041CF8
	add r1, r4, #0
	mov r2, #0
	str r7, [r4, #8]
	bl sub_0200E320
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02041CF4: .word sub_02041CF8
	thumb_func_end sub_02041CC4

	thumb_func_start sub_02041CF8
sub_02041CF8: ; 0x02041CF8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r0, [r5, #0xc]
	mov r1, #4
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl sub_02062260
	cmp r0, #1
	bne _02041D3C
	ldr r0, [r5, #4]
	bl sub_0206226C
	ldr r0, [r5]
	bl sub_0200E390
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02041D26
	bl FreeToHeap
_02041D26:
	add r0, r5, #0
	bl FreeToHeap
	ldrb r0, [r4]
	cmp r0, #0
	bne _02041D38
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_02041D38:
	sub r0, r0, #1
	strb r0, [r4]
_02041D3C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02041CF8

	thumb_func_start ScrCmd_LockAll
ScrCmd_LockAll: ; 0x02041D40
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	cmp r0, #0
	bne _02041D8A
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	add r0, r5, #0
	bl sub_02069D68
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02041D90
	add r0, r4, #0
	bl sub_0205F648
	cmp r0, #0
	beq _02041D90
	add r0, r4, #0
	bl sub_0205F708
	ldr r1, _02041D94 ; =sub_02041E60
	add r0, r6, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041D8A:
	add r0, r6, #0
	bl ScrCmd_581
_02041D90:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02041D94: .word sub_02041E60
	thumb_func_end ScrCmd_LockAll

	thumb_func_start sub_02041D98
sub_02041D98: ; 0x02041D98
	push {r4, r5, r6, lr}
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0xa
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	ldr r1, _02041E5C ; =_021D415C
	add r6, r0, #0
	ldrb r2, [r1]
	mov r1, #1
	tst r1, r2
	beq _02041DD2
	bl sub_02062198
	cmp r0, #1
	bne _02041DD2
	add r0, r6, #0
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =_021D415C
	mov r0, #0xfe
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041DD2:
	ldr r0, _02041E5C ; =_021D415C
	ldrb r1, [r0]
	mov r0, #4
	tst r0, r1
	beq _02041DF6
	ldr r0, [r5]
	bl sub_0205F648
	cmp r0, #0
	bne _02041DF6
	ldr r0, [r5]
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =_021D415C
	mov r0, #0xfb
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041DF6:
	ldr r0, _02041E5C ; =_021D415C
	ldrb r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02041E22
	ldr r0, [r4, #0x3c]
	mov r1, #0x30
	bl sub_0205EEB4
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041E22
	add r0, r4, #0
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =_021D415C
	mov r0, #0xfd
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041E22:
	ldr r0, _02041E5C ; =_021D415C
	ldrb r1, [r0]
	mov r0, #8
	tst r0, r1
	beq _02041E4C
	ldr r0, [r5]
	bl sub_020660C0
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041E4C
	add r0, r4, #0
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =_021D415C
	mov r0, #0xf7
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041E4C:
	ldr r0, _02041E5C ; =_021D415C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02041E58
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041E58:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02041E5C: .word _021D415C
	thumb_func_end sub_02041D98

	thumb_func_start sub_02041E60
sub_02041E60: ; 0x02041E60
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041E7E
	add r0, r4, #0
	bl sub_0205F6FC
	mov r0, #1
	pop {r4, pc}
_02041E7E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02041E60

	thumb_func_start ScrCmd_581
ScrCmd_581: ; 0x02041E84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0xa
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	str r0, [sp, #4]
	ldr r0, [r4, #0x3c]
	mov r1, #0x30
	bl sub_0205EEB4
	add r7, r0, #0
	ldr r0, [r5]
	bl sub_020660C0
	add r6, r0, #0
	ldr r0, [r4, #0x3c]
	ldr r1, _02041F48 ; =_021D415C
	mov r2, #0
	strb r2, [r1]
	bl sub_0205F574
	ldr r0, [sp, #4]
	bl sub_02062198
	cmp r0, #0
	bne _02041ED8
	ldr r1, _02041F48 ; =_021D415C
	mov r0, #1
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	ldr r0, [sp, #4]
	bl sub_0205F708
_02041ED8:
	ldr r0, [r5]
	bl sub_0205F648
	cmp r0, #0
	beq _02041EF2
	ldr r1, _02041F48 ; =_021D415C
	mov r0, #4
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	bl sub_0205F708
_02041EF2:
	cmp r7, #0
	beq _02041F1A
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02041F1A
	add r0, r7, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041F1A
	ldr r1, _02041F48 ; =_021D415C
	mov r0, #2
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	add r0, r7, #0
	bl sub_0205F708
_02041F1A:
	cmp r6, #0
	beq _02041F38
	add r0, r6, #0
	bl sub_0205F648
	cmp r0, #0
	beq _02041F38
	ldr r1, _02041F48 ; =_021D415C
	mov r0, #8
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	add r0, r6, #0
	bl sub_0205F708
_02041F38:
	ldr r0, [sp]
	ldr r1, _02041F4C ; =sub_02041D98
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02041F48: .word _021D415C
_02041F4C: .word sub_02041D98
	thumb_func_end ScrCmd_581

	thumb_func_start ScrCmd_ReleaseAll
ScrCmd_ReleaseAll: ; 0x02041F50
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_ReleaseAll

	thumb_func_start ScrCmd_098
ScrCmd_098: ; 0x02041F60
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, r0, #0
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	bl GetMapObjectByID
	cmp r0, #0
	beq _02041F80
	bl sub_0205F6FC
	b _02041F88
_02041F80:
	cmp r4, #0xfd
	beq _02041F88
	bl GF_AssertFail
_02041F88:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_098

	thumb_func_start ScrCmd_099
ScrCmd_099: ; 0x02041F8C
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, r0, #0
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	bl GetMapObjectByID
	cmp r0, #0
	beq _02041FAC
	bl sub_0205F708
	b _02041FB4
_02041FAC:
	cmp r4, #0xfd
	beq _02041FB4
	bl GF_AssertFail
_02041FB4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_099

	thumb_func_start ScrCmd_ShowPerson
ScrCmd_ShowPerson: ; 0x02041FB8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl Field_GetNumObjectEvents
	add r6, r0, #0
	add r0, r5, #0
	bl Field_GetObjectEvents
	str r0, [sp]
	ldr r3, [r5, #0x20]
	ldr r0, [r5, #0x3c]
	ldr r3, [r3]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205E34C
	cmp r0, #0
	bne _02041FFA
	bl GF_AssertFail
_02041FFA:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ScrCmd_ShowPerson

	thumb_func_start ScrCmd_HidePerson
ScrCmd_HidePerson: ; 0x02042000
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl GetMapObjectByID
	cmp r0, #0
	bne _0204202A
	bl GF_AssertFail
	b _0204202E
_0204202A:
	bl DeleteMapObject
_0204202E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_HidePerson

	thumb_func_start ScrCmd_102
ScrCmd_102: ; 0x02042034
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r1, [r0, #0x20]
	add r2, r7, #0
	ldr r1, [r1]
	str r1, [sp, #8]
	ldr r0, [r0, #0x3c]
	add r1, r6, #0
	bl CreateSpecialFieldObject
	str r0, [r4]
	bl sub_02061070
	ldr r0, [r4]
	mov r1, #1
	bl sub_0205F690
	ldr r0, [r4]
	mov r1, #0
	bl sub_0205F6AC
	ldr r0, [r4]
	bl MapObject_GetPositionVecPtr
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	add r4, r0, #0
	ldr r1, [r1, #0x2c]
	bl ov01_021F62E8
	add r5, #0x80
	ldr r1, [r5]
	add r0, r4, #0
	ldr r1, [r1, #0x24]
	bl sub_02023214
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_102

	thumb_func_start ScrCmd_103
ScrCmd_103: ; 0x020420CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl MapObject_Remove
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xff
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	bl MapObject_GetPositionVecPtr
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	add r4, r0, #0
	ldr r1, [r1, #0x2c]
	bl ov01_021F62E8
	add r5, #0x80
	ldr r1, [r5]
	add r0, r4, #0
	ldr r1, [r1, #0x24]
	bl sub_02023214
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_103

	thumb_func_start ScrCmd_678
ScrCmd_678: ; 0x02042110
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl FieldSysGetAttrAddr
	mov r1, #2
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r1, [r0, #0x20]
	add r2, r7, #0
	ldr r1, [r1]
	str r1, [sp, #8]
	ldr r0, [r0, #0x3c]
	add r1, r6, #0
	bl CreateSpecialFieldObject
	str r0, [r4]
	bl sub_02061070
	ldr r0, [r4]
	mov r1, #1
	bl sub_0205F690
	ldr r0, [r4]
	mov r1, #0
	bl sub_0205F6AC
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_678

	thumb_func_start ScrCmd_679
ScrCmd_679: ; 0x02042184
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl MapObject_Remove
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_679

	thumb_func_start ScrCmd_FacePlayer
ScrCmd_FacePlayer: ; 0x0204219C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r0, #0x80
	ldr r5, [r0]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	bl sub_020611F4
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _020421C6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020421C6:
	bl sub_0205F2A8
	add r7, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl ov01_021F9408
	ldr r0, [r4]
	bl MapObject_GetID
	cmp r0, #0xfd
	bne _020422AC
	ldr r0, [r4]
	bl ov01_022055DC
	cmp r0, #0
	beq _020422AC
	cmp r7, r6
	beq _020422AC
	ldr r0, [r4]
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl sub_02054918
	add r5, r0, #0
	sub r0, r6, #2
	cmp r0, #1
	bhi _02042242
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _02042226
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	mov r1, #0
	bl ov01_021FF0E4
	b _02042242
_02042226:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02042242
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	mov r1, #0
	bl ov01_021FF964
_02042242:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #0
	bne _020422AC
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_02060E54
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B984
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B7A4
	cmp r0, #0
	bne _020422AC
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_02060EBC
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8AC
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA70
	cmp r0, #0
	bne _020422AC
	mov r1, #1
	ldr r0, [r4]
	lsl r1, r1, #0x14
	bl sub_0205F214
_020422AC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_FacePlayer

	thumb_func_start ScrCmd_GetPlayerCoords
ScrCmd_GetPlayerCoords: ; 0x020422B4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	strh r0, [r6]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetPlayerCoords

	thumb_func_start ScrCmd_GetPersonCoords
ScrCmd_GetPersonCoords: ; 0x020422F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	ldr r0, [r5, #0x3c]
	add r1, r7, #0
	bl GetMapObjectByID
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	cmp r5, #0
	beq _0204235A
	add r0, r5, #0
	bl MapObject_GetNextX
	strh r0, [r6]
	add r0, r5, #0
	bl MapObject_GetNextY
	strh r0, [r4]
	b _02042368
_0204235A:
	mov r0, #0xff
	strh r0, [r6]
	strh r0, [r4]
	cmp r7, #0xfd
	beq _02042368
	bl GF_AssertFail
_02042368:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_GetPersonCoords

	thumb_func_start ScrCmd_GetPlayerFacing
ScrCmd_GetPlayerFacing: ; 0x0204236C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetPlayerFacing

	thumb_func_start ScrCmd_107
ScrCmd_107: ; 0x02042394
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	cmp r7, #0
	beq _020423EA
	lsl r0, r7, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020423F8
_020423EA:
	lsl r0, r7, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020423F8:
	bl _ffix
	str r0, [sp]
	cmp r6, #0
	beq _02042414
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02042422
_02042414:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02042422:
	bl _ffix
	str r0, [sp, #4]
	cmp r4, #0
	beq _0204243E
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0204244C
_0204243E:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0204244C:
	bl _ffix
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C6DC
	add r1, sp, #0
	bl sub_0205F9A0
	add r5, #0x80
	ldr r1, [r5]
	add r0, sp, #0
	ldr r1, [r1, #0x24]
	bl sub_02023514
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_107

	thumb_func_start ScrCmd_108
ScrCmd_108: ; 0x02042478
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	bl sub_0205F79C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_108

	thumb_func_start ScrCmd_109
ScrCmd_109: ; 0x020424AC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	cmp r5, #0
	beq _020424E2
	add r0, r5, #0
	bl sub_0205FC94
_020424E2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_109

	thumb_func_start ScrCmd_574
ScrCmd_574: ; 0x020424E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	cmp r0, #0
	beq _0204252A
	bl MapObject_GetMovement
	strh r0, [r4]
_0204252A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_574

	thumb_func_start ScrCmd_136
ScrCmd_136: ; 0x02042530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	bl GetMonUnownLetter
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_136

	thumb_func_start ScrCmd_PartySelectUI
ScrCmd_PartySelectUI: ; 0x02042574
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r5, #0
	add r1, #0x80
	add r4, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	bl sub_0203E580
	str r0, [r4]
	ldr r1, _020425A0 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020425A0: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_PartySelectUI

	thumb_func_start ScrCmd_566
ScrCmd_566: ; 0x020425A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r5, #0
	add r1, #0x80
	add r4, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	bl sub_0203E5A4
	str r0, [r4]
	ldr r1, _020425D0 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020425D0: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_566

	thumb_func_start ScrCmd_350
ScrCmd_350: ; 0x020425D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0x20
	ldr r0, [r0, #0x10]
	bl sub_0203E6D4
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_350

	thumb_func_start ScrCmd_PartySelect
ScrCmd_PartySelect: ; 0x020425F8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02042624
	bl GF_AssertFail
_02042624:
	ldr r0, [r4]
	bl sub_0203E5C8
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #7
	bne _02042636
	mov r0, #0xff
	strh r0, [r5]
_02042636:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PartySelect

	thumb_func_start ScrCmd_635
ScrCmd_635: ; 0x02042644
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r7, [r4]
	cmp r7, #0
	bne _02042684
	bl GF_AssertFail
_02042684:
	ldr r0, [r4]
	bl sub_0203E5C8
	cmp r0, #7
	bne _02042694
	mov r0, #0xff
	strh r0, [r5]
	b _020426B6
_02042694:
	cmp r0, #6
	bne _020426B6
	add r0, r7, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r7, #0x31
	strh r0, [r5]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
	ldrb r0, [r7]
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	beq _020426B6
	sub r0, r0, #1
	strh r0, [r6]
_020426B6:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_635

	thumb_func_start ScrCmd_639
ScrCmd_639: ; 0x020426C4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldr r4, [r6]
	cmp r4, #0
	bne _02042718
	bl GF_AssertFail
_02042718:
	ldr r0, [r6]
	bl sub_0203E5C8
	cmp r0, #7
	bne _02042728
	mov r0, #0xff
	strh r0, [r5]
	b _0204275C
_02042728:
	cmp r0, #6
	bne _0204275C
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	strh r0, [r5]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0x31
	ldrb r1, [r0]
	ldr r0, [sp]
	add r4, #0x32
	strh r1, [r0]
	ldrh r0, [r0]
	sub r1, r0, #1
	ldr r0, [sp]
	strh r1, [r0]
	ldrb r0, [r4]
	strh r0, [r7]
	ldrh r0, [r7]
	cmp r0, #0
	beq _0204275C
	sub r0, r0, #1
	strh r0, [r7]
_0204275C:
	ldr r0, [r6]
	bl FreeToHeap
	mov r0, #0
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_639

	thumb_func_start ScrCmd_645
ScrCmd_645: ; 0x02042768
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldr r4, [r6]
	cmp r4, #0
	bne _020427BC
	bl GF_AssertFail
_020427BC:
	ldr r0, [r6]
	bl sub_0203E5C8
	cmp r0, #7
	bne _020427CC
	mov r0, #0xff
	strh r0, [r5]
	b _02042800
_020427CC:
	cmp r0, #6
	bne _02042800
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	strh r0, [r5]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0x31
	ldrb r1, [r0]
	ldr r0, [sp]
	add r4, #0x32
	strh r1, [r0]
	ldrh r0, [r0]
	sub r1, r0, #1
	ldr r0, [sp]
	strh r1, [r0]
	ldrb r0, [r4]
	strh r0, [r7]
	ldrh r0, [r7]
	cmp r0, #0
	beq _02042800
	sub r0, r0, #1
	strh r0, [r7]
_02042800:
	ldr r0, [r6]
	bl FreeToHeap
	mov r0, #0
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_645

	thumb_func_start ScrCmd_GetMoveSelection
ScrCmd_GetMoveSelection: ; 0x0204280C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02042840
	bl GF_AssertFail
_02042840:
	cmp r6, #1
	ldr r0, [r4]
	bne _0204284C
	bl sub_0203E864
	b _02042850
_0204284C:
	bl sub_0203E600
_02042850:
	strh r0, [r5]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetMoveSelection

	thumb_func_start ScrCmd_ChooseMoveUI
ScrCmd_ChooseMoveUI: ; 0x02042860
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r3, r0, #0
	cmp r6, #1
	bne _020428B6
	add r1, r5, #0
	add r1, #0x80
	lsl r2, r7, #0x18
	ldr r1, [r1]
	mov r0, #0x20
	lsr r2, r2, #0x18
	bl sub_0203E7F4
	b _020428C4
_020428B6:
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	mov r0, #0x20
	add r2, r7, #0
	bl sub_0203FB94
_020428C4:
	ldr r1, _020428D4 ; =ScrNative_WaitApplication
	str r0, [r4]
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020428D4: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_ChooseMoveUI

	thumb_func_start ScrCmd_GetPhoneBookRematch
ScrCmd_GetPhoneBookRematch: ; 0x020428D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0x20
	bl AllocAndReadPhoneBook
	add r7, r0, #0
	ldr r0, _02042944 ; =SDK_OVERLAY_OVY_26_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl Field_GetTimeOfDayWildParam
	add r3, r0, #0
	add r5, #0x80
	ldr r1, [r5]
	lsl r0, r4, #0x18
	lsl r3, r3, #0x18
	ldr r1, [r1, #0xc]
	lsr r0, r0, #0x18
	add r2, r7, #0
	lsr r3, r3, #0x18
	bl PhoneBookTrainerGetRematchInfo
	strh r0, [r6]
	ldr r0, _02042944 ; =SDK_OVERLAY_OVY_26_ID
	bl UnloadOverlayByID
	add r0, r7, #0
	bl FreePhoneBook
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02042944: .word SDK_OVERLAY_OVY_26_ID
	thumb_func_end ScrCmd_GetPhoneBookRematch

	thumb_func_start ScrCmd_684
ScrCmd_684: ; 0x02042948
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl sub_0203B984
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_684

	thumb_func_start ScrNative_WaitApplication_DestroyTaskData
ScrNative_WaitApplication_DestroyTaskData: ; 0x02042974
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x14
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02042992
	mov r0, #0
	pop {r3, r4, r5, pc}
_02042992:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrNative_WaitApplication_DestroyTaskData

	thumb_func_start sub_020429A0
sub_020429A0: ; 0x020429A0
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x14
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _020429BE
	mov r0, #0
	pop {r3, r4, r5, pc}
_020429BE:
	add r0, r5, #0
	bl sub_02093070
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020429A0

	thumb_func_start sub_020429D4
sub_020429D4: ; 0x020429D4
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_020970C0
	cmp r0, #0
	bne _020429F0
	mov r0, #0
	pop {r4, pc}
_020429F0:
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020429D4

	thumb_func_start ScrNative_WaitApplication
ScrNative_WaitApplication: ; 0x020429F8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02042A0A
	mov r0, #1
	pop {r3, pc}
_02042A0A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrNative_WaitApplication

	thumb_func_start ScrCmd_150
ScrCmd_150: ; 0x02042A10
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_020552A4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_150

	thumb_func_start ScrCmd_436
ScrCmd_436: ; 0x02042A20
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_0205525C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_436

	thumb_func_start sub_02042A30
sub_02042A30: ; 0x02042A30
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	add r4, r2, #0
	bl Save_DressupData_get
	cmp r5, #0
	bne _02042A4E
	add r1, r4, #0
	bl sub_0202B9EC
	cmp r0, #0
	bne _02042A5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02042A4E:
	add r1, r4, #0
	bl sub_0202BA08
	cmp r0, #0
	bne _02042A5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02042A5C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042A30

	thumb_func_start sub_02042A60
sub_02042A60: ; 0x02042A60
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	add r4, r2, #0
	add r6, r3, #0
	bl Save_DressupData_get
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02042A30
	cmp r0, #0
	bne _02042A84
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02042A84:
	ldr r0, [sp]
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	str r7, [r0]
	str r4, [r0, #8]
	str r6, [r0, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02042A60

	thumb_func_start ScrCmd_151
ScrCmd_151: ; 0x02042AB0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F729C
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_151

	thumb_func_start ScrCmd_152
ScrCmd_152: ; 0x02042AC0
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_02078B58
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_152

	thumb_func_start ScrCmd_153
ScrCmd_153: ; 0x02042ACC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	ldr r1, [r4]
	ldr r1, [r1, #4]
	strh r1, [r0]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_153

	thumb_func_start ScrCmd_451
ScrCmd_451: ; 0x02042AFC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl sub_0203769C
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_451

	thumb_func_start ScrCmd_452
ScrCmd_452: ; 0x02042B1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, _02042BA8 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl sub_0200E3DC
	mov r0, #0xb
	str r0, [sp]
	ldr r0, _02042BA8 ; =0x000003D9
	mov r1, #3
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	str r4, [sp, #8]
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r2, #0xa
	ldr r0, [r0, #8]
	mov r3, #5
	bl sub_0200F4A0
	add r5, #0x80
	str r0, [r6]
	ldr r0, [r5]
	add r1, r4, #0
	bl Script_SetMonSeenFlagBySpecies
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02042BA8: .word 0x000003D9
	thumb_func_end ScrCmd_452

	thumb_func_start ScrCmd_547
ScrCmd_547: ; 0x02042BAC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, _02042C28 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl sub_0200E3DC
	mov r0, #0xb
	str r0, [sp]
	ldr r0, _02042C28 ; =0x000003D9
	add r5, #0x80
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0, #8]
	mov r2, #0xa
	mov r3, #5
	bl sub_0200F4F8
	str r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02042C28: .word 0x000003D9
	thumb_func_end ScrCmd_547

	thumb_func_start ScrCmd_453
ScrCmd_453: ; 0x02042C2C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0]
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_453

	thumb_func_start ScrCmd_548
ScrCmd_548: ; 0x02042C44
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #2
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_548

	thumb_func_start ScrCmd_549
ScrCmd_549: ; 0x02042C5C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _02042C74 ; =sub_02042C78
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02042C74: .word sub_02042C78
	thumb_func_end ScrCmd_549

	thumb_func_start sub_02042C78
sub_02042C78: ; 0x02042C78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #3
	beq _02042CA4
	mov r0, #1
	pop {r3, r4, r5, pc}
_02042CA4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042C78

	thumb_func_start ScrCmd_454
ScrCmd_454: ; 0x02042CA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	ldr r6, _02042CDC ; =SDK_OVERLAY_OVY_26_ID
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl HandleLoadOverlay
	ldr r1, [r4]
	cmp r1, #0
	beq _02042CD0
	add r5, #0x80
	ldr r0, [r5]
	bl ov26_022599D8
_02042CD0:
	add r0, r6, #0
	bl UnloadOverlayByID
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02042CDC: .word SDK_OVERLAY_OVY_26_ID
	thumb_func_end ScrCmd_454

	thumb_func_start ScrCmd_681
ScrCmd_681: ; 0x02042CE0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl sub_020961D8
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_681

	thumb_func_start ScrCmd_154
ScrCmd_154: ; 0x02042D00
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	ldr r2, [r5]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [r2, #0x10]
	ldr r2, [r2, #0xc]
	add r3, r4, #0
	bl sub_0203F198
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_154

	thumb_func_start ScrCmd_155
ScrCmd_155: ; 0x02042D58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r5, #0
	add r1, #0x80
	add r6, r0, #0
	ldr r1, [r1]
	mov r0, #0xb
	mov r2, #0
	add r3, r7, #0
	bl sub_02042A60
	str r0, [r4]
	cmp r0, #0
	bne _02042DA0
	mov r0, #1
	strh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02042DA0:
	mov r0, #0
	strh r0, [r6]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r4]
	bl sub_0203F204
	ldr r1, _02042DBC ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02042DBC: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_155

	thumb_func_start ScrCmd_255
ScrCmd_255: ; 0x02042DC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	add r2, r6, #0
	bl sub_02042A30
	cmp r0, #1
	bne _02042DF4
	mov r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_02042DF4:
	mov r0, #0
	strh r0, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_255

	thumb_func_start ScrCmd_256
ScrCmd_256: ; 0x02042DFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	mov r1, #0
	bl sub_0202B9B8
	add r1, r4, #0
	bl sub_0202BD7C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_256

	thumb_func_start ScrCmd_450
ScrCmd_450: ; 0x02042E2C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F964
	ldr r1, _02042E44 ; =ScrNative_WaitApplication
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02042E44: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_450

	thumb_func_start ScrCmd_156
ScrCmd_156: ; 0x02042E48
	push {r3, lr}
	add r1, r0, #0
	ldr r0, [r1, #0x74]
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl sub_0206B910
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_156

	thumb_func_start ScrCmd_TownMap
ScrCmd_TownMap: ; 0x02042E5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl TownMap_new
	str r0, [r4]
	ldr r1, _02042E88 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02042E88: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_TownMap

	thumb_func_start ScrCmd_408
ScrCmd_408: ; 0x02042E8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	str r0, [r6]
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp]
	strh r7, [r4, #4]
	strh r0, [r4, #6]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r6]
	bl sub_0203F0A8
	ldr r1, _02042F00 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02042F00: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_408

	thumb_func_start ScrCmd_158
ScrCmd_158: ; 0x02042F04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	str r1, [r0]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	str r1, [r0, #8]
	add r1, r5, #0
	add r1, #0x80
	ldr r2, [r1]
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0, #4]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r4]
	bl sub_0203E868
	ldr r1, _02042F58 ; =sub_020429A0
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02042F58: .word sub_020429A0
	thumb_func_end ScrCmd_158

	thumb_func_start ScrCmd_159
ScrCmd_159: ; 0x02042F5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F4C8
	ldr r1, _02042F74 ; =ScrNative_WaitApplication
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02042F74: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_159

	thumb_func_start ScrCmd_160
ScrCmd_160: ; 0x02042F78
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069464
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_160

	thumb_func_start ScrCmd_161
ScrCmd_161: ; 0x02042F88
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_0203F4A8
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_161

	thumb_func_start ScrCmd_162
ScrCmd_162: ; 0x02042F98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F4F8
	str r0, [r4]
	ldr r1, _02042FC0 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02042FC0: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_162

	thumb_func_start ScrCmd_HOF_Credits
ScrCmd_HOF_Credits: ; 0x02042FC4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x10]
	bl Special_EnterHallOfFame
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_HOF_Credits

	thumb_func_start ScrCmd_164
ScrCmd_164: ; 0x02042FDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F984
	str r0, [r4]
	ldr r1, _02043004 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02043004: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_164

	thumb_func_start ScrCmd_706
ScrCmd_706: ; 0x02043008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	ldr r0, [r0, #0xc]
	add r2, sp, #0
	bl LoadHallOfFame
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	ldr r1, [sp]
	cmp r1, #2
	bne _0204303A
	mov r1, #1
	strh r1, [r0]
_0204303A:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_706

	thumb_func_start ScrCmd_165
ScrCmd_165: ; 0x02043044
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _02043098
	mov r0, #1
	strh r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_0203F844
	ldr r1, _020430A0 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	b _0204309C
_02043098:
	mov r0, #0
	strh r0, [r4]
_0204309C:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020430A0: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_165

	thumb_func_start ScrCmd_166
ScrCmd_166: ; 0x020430A4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl sub_02078B78
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_166

	thumb_func_start ScrCmd_ChooseStarter
ScrCmd_ChooseStarter: ; 0x020430C4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl LaunchStarterChoiceScene
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ChooseStarter

	thumb_func_start ScrCmd_333
ScrCmd_333: ; 0x020430D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _020430E8
	mov r0, #1
	b _020430EA
_020430E8:
	mov r0, #0
_020430EA:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02043106
	bl GF_AssertFail
_02043106:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0203E460
	str r0, [r6]
	ldr r1, _02043120 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02043120: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_333

	thumb_func_start ScrCmd_334
ScrCmd_334: ; 0x02043124
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02043150
	bl GF_AssertFail
_02043150:
	ldr r0, [r4]
	bl sub_0203E4CC
	strh r0, [r5]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_334

	thumb_func_start ScrCmd_370
ScrCmd_370: ; 0x02043164
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _02043178
	mov r0, #1
	b _0204317A
_02043178:
	mov r0, #0
_0204317A:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02043196
	bl GF_AssertFail
_02043196:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0203E460
	str r0, [r6]
	ldr r1, _020431B0 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020431B0: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_370

	thumb_func_start ScrCmd_172
ScrCmd_172: ; 0x020431B4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x74]
	add r2, r1, #0
	mov r3, #7
	bl CreateNamingScreen
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_172

	thumb_func_start ScrCmd_NameRival
ScrCmd_NameRival: ; 0x020431E4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x74]
	mov r1, #3
	mov r3, #7
	bl CreateNamingScreen
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_NameRival

	thumb_func_start ScrCmd_NicknameInput
ScrCmd_NicknameInput: ; 0x02043214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	cmp r6, #0xff
	bne _0204324E
	add r0, r5, #0
	bl FieldSys_BugContest_get
	ldrb r1, [r0, #0x17]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _0204324A
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0204324A:
	ldr r5, [r0, #0x10]
	b _0204325C
_0204324E:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
_0204325C:
	add r0, r5, #0
	mov r1, #0x75
	add r2, sp, #0xc
	bl GetMonData
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	str r6, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r4, #0x74]
	mov r1, #1
	mov r3, #0xa
	bl CreateNamingScreen
	mov r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_NicknameInput

	thumb_func_start ScrCmd_629
ScrCmd_629: ; 0x020432A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0209707C
	str r0, [r4]
	ldr r1, _020432C8 ; =sub_020429D4
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020432C8: .word sub_020429D4
	thumb_func_end ScrCmd_629

	thumb_func_start ScrCmd_630
ScrCmd_630: ; 0x020432CC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl sub_0205A894
	add r5, r0, #0
	bl sub_02029084
	cmp r5, r0
	bne _020432F2
	mov r0, #0
	b _020432F4
_020432F2:
	mov r0, #1
_020432F4:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_630

	thumb_func_start ScrCmd_492
ScrCmd_492: ; 0x020432FC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r3, r0, #0
	ldr r0, _02043358 ; =0x0000FFFF
	add r5, #0x80
	strh r0, [r3]
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x10]
	add r2, r6, #0
	bl sub_0203E960
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02043358: .word 0x0000FFFF
	thumb_func_end ScrCmd_492

	thumb_func_start ScrCmd_PromptEasyChat
ScrCmd_PromptEasyChat: ; 0x0204335C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, _020433B8 ; =0x0000FFFF
	add r5, #0x80
	strh r1, [r4]
	strh r1, [r0]
	str r0, [sp]
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0x10]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0203E960
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020433B8: .word 0x0000FFFF
	thumb_func_end ScrCmd_PromptEasyChat

	thumb_func_start ScrCmd_494
ScrCmd_494: ; 0x020433BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl BufferECWord
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_494

	thumb_func_start ScrCmd_FadeScreen
ScrCmd_FadeScreen: ; 0x02043400
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	add r3, r0, #0
	str r6, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r7, #0
	add r2, r7, #0
	bl sub_0200FA24
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_FadeScreen

	thumb_func_start ScrCmd_WaitFade
ScrCmd_WaitFade: ; 0x02043448
	push {r3, lr}
	ldr r1, _02043454 ; =sub_02043458
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02043454: .word sub_02043458
	thumb_func_end ScrCmd_WaitFade

	thumb_func_start sub_02043458
sub_02043458: ; 0x02043458
	push {r3, lr}
	bl sub_0200FB5C
	cmp r0, #1
	bne _02043466
	mov r0, #1
	pop {r3, pc}
_02043466:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02043458

	thumb_func_start ScrCmd_Warp
ScrCmd_Warp: ; 0x0204346C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r4, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	mvn r2, r2
	add r3, r7, #0
	bl sub_0205388C
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_Warp

	thumb_func_start ScrCmd_448
ScrCmd_448: ; 0x020434DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	mov r2, #0
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x10]
	mvn r2, r2
	add r3, r7, #0
	bl sub_0205412C
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_448

	thumb_func_start ScrCmd_449
ScrCmd_449: ; 0x02043538
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_02054190
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_449

	thumb_func_start ScrCmd_445
ScrCmd_445: ; 0x02043548
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl sub_0203B960
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	ldr r1, [r5]
	strh r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_445

	thumb_func_start ScrCmd_446
ScrCmd_446: ; 0x02043574
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	ldr r1, [r4]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	strh r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_446

	thumb_func_start ScrCmd_840
ScrCmd_840: ; 0x02043598
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl MapHeader_MapIsPokemonCenter
	cmp r0, #1
	bne _020435D4
	mov r0, #1
	strh r0, [r4]
	b _020435E2
_020435D4:
	add r0, r5, #0
	bl MapHeader_MapIsPokemonLeagueLobby
	cmp r0, #1
	bne _020435E2
	mov r0, #2
	strh r0, [r4]
_020435E2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_840

	thumb_func_start ScrCmd_177
ScrCmd_177: ; 0x020435E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2590
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_177

	thumb_func_start ScrCmd_178
ScrCmd_178: ; 0x02043618
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2068
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_178

	thumb_func_start ScrCmd_179
ScrCmd_179: ; 0x02043648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2908
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_179

	thumb_func_start ScrCmd_180
ScrCmd_180: ; 0x02043678
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r5, #0x80
	ldr r0, [r5]
	add r1, r4, #0
	sub r2, r2, #2
	add r3, r6, #0
	bl sub_020538C0
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_180

	thumb_func_start ScrCmd_181
ScrCmd_181: ; 0x020436C4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	add r5, r0, #0
	mov r1, #0xc
	bl sub_0203B98C
	add r0, r5, #0
	bl sub_0203B984
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov01_021EB2B8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_181

	thumb_func_start ScrCmd_182
ScrCmd_182: ; 0x020436F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2DA4
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_182

	thumb_func_start ScrCmd_183
ScrCmd_183: ; 0x02043724
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C724
	add r3, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	add r2, r6, #0
	bl ov02_02249458
	str r0, [r4]
	ldr r1, _02043788 ; =sub_0204378C
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02043788: .word sub_0204378C
	thumb_func_end ScrCmd_183

	thumb_func_start sub_0204378C
sub_0204378C: ; 0x0204378C
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	bl ov02_0224953C
	cmp r0, #1
	bne _020437AE
	ldr r0, [r4]
	bl ov02_02249548
	mov r0, #1
	pop {r4, pc}
_020437AE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204378C

	thumb_func_start ScrCmd_184
ScrCmd_184: ; 0x020437B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _020437DC
	mov r0, #1
	b _020437DE
_020437DC:
	mov r0, #0
_020437DE:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_184

	thumb_func_start ScrCmd_185
ScrCmd_185: ; 0x020437E4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	add r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r1]
	cmp r0, #1
	bne _02043828
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _0204386C ; =0x000003F5
	bl sub_02054F28
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _0204386C ; =0x000003F5
	mov r2, #1
	bl sub_02054FDC
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	ldr r0, [r0, #0x40]
	bl ov01_021F1AFC
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0x40]
	bl ov01_021F1B04
	b _02043868
_02043828:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #0x40]
	bl ov01_021F1AFC
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_02054F28
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl sub_02054F60
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	mov r2, #1
	bl sub_02054FDC
_02043868:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0204386C: .word 0x000003F5
	thumb_func_end ScrCmd_185

	thumb_func_start ScrCmd_591
ScrCmd_591: ; 0x02043870
	push {r3, lr}
	add r0, #0x80
	mov r1, #0x13
	ldr r0, [r0]
	lsl r1, r1, #6
	bl sub_02054F28
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_591

	thumb_func_start ScrCmd_186
ScrCmd_186: ; 0x02043884
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0x40]
	bl sub_0205CAA4
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_186

	thumb_func_start ScrCmd_GetPlayerState
ScrCmd_GetPlayerState: ; 0x0204389C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C700
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetPlayerState

	thumb_func_start ScrCmd_SetAvatarBits
ScrCmd_SetAvatarBits: ; 0x020438C4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x40]
	bl sub_0205C710
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_SetAvatarBits

	thumb_func_start ScrCmd_UpdateAvatarState
ScrCmd_UpdateAvatarState: ; 0x020438DC
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl ov01_021F1B04
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_UpdateAvatarState

	thumb_func_start ScrCmd_211
ScrCmd_211: ; 0x020438EC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_Roamers_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl Roamers_GetRand
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02097F9C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_211

	thumb_func_start ScrCmd_GetStarterChoice
ScrCmd_GetStarterChoice: ; 0x02043938
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl GetStarterFromScriptState
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetStarterChoice

	thumb_func_start ScrCmd_SetStarterChoice
ScrCmd_SetStarterChoice: ; 0x02043964
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r1, r4, #0
	bl SetStarterToScriptState
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_SetStarterChoice

	thumb_func_start ScrCmd_TrainerMessage
ScrCmd_TrainerMessage: ; 0x02043990
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #8
	add r0, r4, #0
	bl FieldSysGetAttrAddr
	add r0, r4, #0
	mov r1, #0x11
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [sp]
	ldr r2, [r6]
	mov r3, #0xb
	bl GetTrainerMessageByIdPair
	add r0, r4, #0
	mov r1, #1
	bl FieldSysGetAttrAddr
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #1
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	ldr r1, [r6]
	add r0, r4, #0
	mov r3, #1
	bl sub_0205B5B4
	strb r0, [r7]
	ldr r1, _02043A24 ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02043A24: .word ov01_021EF348
	thumb_func_end ScrCmd_TrainerMessage

	thumb_func_start ScrCmd_226
ScrCmd_226: ; 0x02043A28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov03_02255BB0
	ldr r1, _02043A94 ; =sub_02043A98
	add r0, r5, #0
	str r6, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02043A94: .word sub_02043A98
	thumb_func_end ScrCmd_226

	thumb_func_start sub_02043A98
sub_02043A98: ; 0x02043A98
	push {r4, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	bl ov03_02255BFC
	cmp r0, #0
	bne _02043AB8
	mov r0, #0
	pop {r4, pc}
_02043AB8:
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02043A98

	thumb_func_start ScrCmd_227
ScrCmd_227: ; 0x02043AC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov03_02255C18
	ldr r1, _02043B2C ; =sub_02043B30
	add r0, r5, #0
	str r6, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02043B2C: .word sub_02043B30
	thumb_func_end ScrCmd_227

	thumb_func_start sub_02043B30
sub_02043B30: ; 0x02043B30
	push {r4, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	bl ov03_02255C64
	cmp r0, #0
	bne _02043B50
	mov r0, #0
	pop {r4, pc}
_02043B50:
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02043B30

	thumb_func_start ScrCmd_228
ScrCmd_228: ; 0x02043B58
	push {r3, lr}
	bl ScriptReadHalfword
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_228

	thumb_func_start ScrCmd_229
ScrCmd_229: ; 0x02043B64
	push {r3, lr}
	bl ScriptReadHalfword
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_229

	thumb_func_start ScrCmd_230
ScrCmd_230: ; 0x02043B70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r5, #0x80
	ldr r4, [r6]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x10]
	add r1, #0x30
	mov r2, #5
	bl sub_02051428
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_230

	thumb_func_start ScrCmd_231
ScrCmd_231: ; 0x02043BA0
	mov r0, #1
	bx lr
	thumb_func_end ScrCmd_231

	thumb_func_start ScrCmd_SetDynamicWarp
ScrCmd_SetDynamicWarp: ; 0x02043BA4
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	add r1, sp, #0
	bl FlyPoints_SetDynamicWarp
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_SetDynamicWarp

	thumb_func_start ScrCmd_GetDynamicWarpFloorNo
ScrCmd_GetDynamicWarpFloorNo: ; 0x02043C24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetDynamicWarp
	ldr r0, [r0]
	bl MapNumToFloorNo
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_GetDynamicWarpFloorNo

	thumb_func_start ScrCmd_ElevatorCurFloorBox
ScrCmd_ElevatorCurFloorBox: ; 0x02043C54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	str r0, [sp, #8]
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	ldr r1, [r7]
	ldr r3, [sp, #0xc]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r1, r6, #0
	add r2, r4, #0
	bl PrintCurFloorInNewWindow
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ElevatorCurFloorBox

	thumb_func_start ScrCmd_CountJohtoDexSeen
ScrCmd_CountJohtoDexSeen: ; 0x02043CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl Pokedex_CountJohtoDexSeen
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CountJohtoDexSeen

	thumb_func_start ScrCmd_CountJohtoDexOwned
ScrCmd_CountJohtoDexOwned: ; 0x02043CE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl Pokedex_CountJohtoDexOwned
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CountJohtoDexOwned

	thumb_func_start ScrCmd_CountNationalDexSeen
ScrCmd_CountNationalDexSeen: ; 0x02043D14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl Pokedex_CountNationalDexSeen
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CountNationalDexSeen

	thumb_func_start ScrCmd_CountNationalDexOwned
ScrCmd_CountNationalDexOwned: ; 0x02043D44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl Pokedex_CountNationalDexOwned
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CountNationalDexOwned

	thumb_func_start ScrCmd_247
ScrCmd_247: ; 0x02043D74
	mov r0, #0
	bx lr
	thumb_func_end ScrCmd_247

	thumb_func_start ScrCmd_GetDexEvalResult
ScrCmd_GetDexEvalResult: ; 0x02043D78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, [r5, #8]
	str r0, [sp]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	cmp r6, #0
	bne _02043DE6
	add r0, r7, #0
	bl Pokedex_CountJohtoOwned_ExcludeMythical
	add r6, r0, #0
	ldr r0, [sp]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r2, r5, #0
	bl sub_0205BBD0
	b _02043E02
_02043DE6:
	add r0, r7, #0
	bl Pokedex_CountNationalOwned_ExcludeMythical
	add r6, r0, #0
	ldr r0, [sp]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r2, r5, #0
	bl sub_0205BC78
_02043E02:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_GetDexEvalResult

	thumb_func_start ScrCmd_249
ScrCmd_249: ; 0x02043E08
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	lsr r2, r2, #0x18
	add r3, r4, #0
	bl sub_02051020
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_249

	thumb_func_start ScrCmd_WildBattle
ScrCmd_WildBattle: ; 0x02043E5C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	ldr r1, [r5, #8]
	lsl r2, r2, #0x18
	add r0, r1, #1
	str r0, [r5, #8]
	mov r0, #1
	str r0, [sp]
	ldrb r0, [r1]
	add r1, r6, #0
	lsr r2, r2, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0x74]
	add r3, r4, #0
	bl sub_02051020
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_WildBattle

	thumb_func_start ScrCmd_686
ScrCmd_686: ; 0x02043EB8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	lsr r2, r2, #0x18
	add r3, r4, #0
	bl sub_02051090
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_686

	thumb_func_start ScrCmd_250
ScrCmd_250: ; 0x02043F0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl sub_02051228
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_250

	thumb_func_start ScrCmd_CatchingTutorial
ScrCmd_CatchingTutorial: ; 0x02043F48
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_02051334
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_CatchingTutorial

	thumb_func_start ScrCmd_252
ScrCmd_252: ; 0x02043F54
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F818
	ldr r1, _02043F6C ; =ScrNative_WaitApplication
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02043F6C: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_252

	thumb_func_start ScrCmd_253
ScrCmd_253: ; 0x02043F70
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r5, [r1, #0xc]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02027500
	cmp r0, #0
	beq _02043F9C
	mov r0, #0
	strh r0, [r4]
	b _02043FC0
_02043F9C:
	add r0, r5, #0
	bl sub_020274E0
	cmp r0, #0
	bne _02043FAC
	mov r0, #1
	strh r0, [r4]
	b _02043FC0
_02043FAC:
	add r0, r5, #0
	bl sub_02027520
	cmp r0, #0
	beq _02043FBC
	mov r0, #2
	strh r0, [r4]
	b _02043FC0
_02043FBC:
	mov r0, #3
	strh r0, [r4]
_02043FC0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_253

	thumb_func_start ScrCmd_254
ScrCmd_254: ; 0x02043FC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F43E8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_254

	thumb_func_start ScrCmd_641
ScrCmd_641: ; 0x02043FEC
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02027FFC
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_641

	thumb_func_start ScrCmd_642
ScrCmd_642: ; 0x02043FFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020274E8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_642

	thumb_func_start ScrCmd_257
ScrCmd_257: ; 0x02044024
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	ldr r1, _02044050 ; =sub_02044054
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02044050: .word sub_02044054
	thumb_func_end ScrCmd_257

	thumb_func_start sub_02044054
sub_02044054: ; 0x02044054
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037454
	cmp r0, #2
	bge _02044064
	mov r0, #1
	pop {r4, pc}
_02044064:
	ldr r0, [r4, #0x64]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	pop {r4, pc}
	thumb_func_end sub_02044054

	thumb_func_start ScrCmd_258
ScrCmd_258: ; 0x02044070
	push {r3, lr}
	bl sub_02037BEC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_258

	thumb_func_start ScrCmd_259
ScrCmd_259: ; 0x0204407C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0205A6AC
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_259

	thumb_func_start ScrCmd_260
ScrCmd_260: ; 0x020440AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r5, #0x80
	ldr r0, [r5]
	ldr r1, [r1]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A9A0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_260

	thumb_func_start ScrCmd_261
ScrCmd_261: ; 0x020440E4
	push {r4, lr}
	bl ScriptReadHalfword
	add r4, r0, #0
	cmp r4, #5
	beq _02044104
	cmp r4, #7
	beq _02044104
	cmp r4, #9
	beq _02044104
	cmp r4, #6
	beq _02044104
	cmp r4, #0xc
	beq _02044104
	cmp r4, #0xa
	bne _0204410A
_02044104:
	bl sub_020380F4
	b _02044112
_0204410A:
	cmp r4, #0xb
	bne _02044112
	bl sub_02038104
_02044112:
	bl sub_0203769C
	cmp r0, #0
	bne _02044120
	add r0, r4, #0
	bl sub_0205A904
_02044120:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_261

	thumb_func_start ScrCmd_264
ScrCmd_264: ; 0x02044124
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	bl ScriptEnvironment_GetSav2Ptr
	bl SaveData_EasyChat_get
	add r5, r0, #0
	cmp r4, #0
	bne _0204417A
	ldr r0, [r7]
	bl MapObject_GetID
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	b _0204417C
_0204417A:
	mov r2, #0
_0204417C:
	str r5, [sp]
	ldr r0, [r6]
	ldr r3, [sp, #4]
	add r1, r4, #0
	bl sub_0205AA9C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_264

	thumb_func_start ScrCmd_265
ScrCmd_265: ; 0x02044190
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02091574
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_265

	thumb_func_start ScrCmd_266
ScrCmd_266: ; 0x020441A0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x84
	ldr r0, [r0]
	bl sub_0205AD0C
	bl sub_02037FF0
	ldr r1, _020441C0 ; =sub_020441C4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020441C0: .word sub_020441C4
	thumb_func_end ScrCmd_266

	thumb_func_start sub_020441C4
sub_020441C4: ; 0x020441C4
	push {r3, lr}
	bl sub_02037454
	cmp r0, #2
	bge _020441D2
	mov r0, #1
	pop {r3, pc}
_020441D2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020441C4

	thumb_func_start ScrCmd_267
ScrCmd_267: ; 0x020441D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	ldr r0, [r4]
	bl MapObject_GetID
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	ldr r2, [sp]
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r7]
	bl sub_0205A750
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_267

	thumb_func_start ScrCmd_586
ScrCmd_586: ; 0x02044230
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A4D8
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0204426C
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl FreeToHeap
_0204426C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_586

	thumb_func_start ScrCmd_268
ScrCmd_268: ; 0x02044270
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6]
	bl MapObject_GetID
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_0205A200
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_268

	thumb_func_start ScrCmd_274
ScrCmd_274: ; 0x020442AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6]
	bl MapObject_GetID
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	add r2, r7, #0
	bl sub_0205A284
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_274

	thumb_func_start ScrCmd_269
ScrCmd_269: ; 0x020442FC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _02044314 ; =sub_02044318
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02044314: .word sub_02044318
	thumb_func_end ScrCmd_269

	thumb_func_start sub_02044318
sub_02044318: ; 0x02044318
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A358
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	cmp r4, #0
	bne _02044340
	mov r0, #0
	pop {r4, r5, r6, pc}
_02044340:
	strh r4, [r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02044318

	thumb_func_start ScrCmd_270
ScrCmd_270: ; 0x02044348
	push {r3, lr}
	add r0, #0x80
	ldr r1, [r0]
	ldr r0, [r1, #0x3c]
	add r1, #0x84
	ldr r1, [r1]
	bl sub_0205B27C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_270

	thumb_func_start ScrCmd_262
ScrCmd_262: ; 0x0204435C
	push {r3, lr}
	mov r0, #4
	bl sub_0205A904
	bl sub_020380CC
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_262

	thumb_func_start ScrCmd_263
ScrCmd_263: ; 0x0204436C
	push {r3, lr}
	bl sub_02038104
	bl sub_02037FF0
	mov r0, #0
	bl sub_0205A904
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_263

	thumb_func_start ScrCmd_271
ScrCmd_271: ; 0x02044380
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r4, #0x80
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_0205A3B0
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_271

	thumb_func_start ScrCmd_272
ScrCmd_272: ; 0x020443BC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _020443D4 ; =sub_020443D8
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_020443D4: .word sub_020443D8
	thumb_func_end ScrCmd_272

	thumb_func_start sub_020443D8
sub_020443D8: ; 0x020443D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A35C
	cmp r0, #1
	blo _02044410
	add r5, #0x80
	strh r0, [r4]
	ldr r0, [r5]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205ABB0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02044410:
	mov r0, #0
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020443D8

	thumb_func_start ScrCmd_273
ScrCmd_273: ; 0x02044418
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _02044430 ; =sub_02044434
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02044430: .word sub_02044434
	thumb_func_end ScrCmd_273

	thumb_func_start sub_02044434
sub_02044434: ; 0x02044434
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A39C
	ldr r1, _0204447C ; =gMain
	ldr r2, [r1, #0x48]
	mov r1, #2
	tst r1, r2
	beq _0204446E
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #8
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A47C
_0204446E:
	cmp r0, #0
	beq _02044478
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02044478:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204447C: .word gMain
	thumb_func_end sub_02044434

	thumb_func_start ScrCmd_286
ScrCmd_286: ; 0x02044480
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_02054030
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_286

	thumb_func_start ScrCmd_287
ScrCmd_287: ; 0x02044490
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	ldr r2, [r4]
	add r0, r6, #0
	bl sub_0205B3DC
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_287

	thumb_func_start ScrCmd_288
ScrCmd_288: ; 0x020444CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r6, #0
	add r2, r7, #0
	bl sub_0205B418
	strh r0, [r4]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	ldrh r1, [r4]
	mov r2, #2
	bl sub_0205B46C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_288

	thumb_func_start ScrCmd_558
ScrCmd_558: ; 0x02044534
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r6, #0
	add r2, r7, #0
	bl sub_0205B418
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_558

	thumb_func_start ScrCmd_289
ScrCmd_289: ; 0x0204458C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl PlayerProfile_SetAvatar
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_289

	thumb_func_start ScrCmd_OverworldWhiteOut
ScrCmd_OverworldWhiteOut: ; 0x020445C0
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_0205297C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_OverworldWhiteOut

	thumb_func_start ScrCmd_SetSpawn
ScrCmd_SetSpawn: ; 0x020445CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	add r1, r4, #0
	bl FlyPoints_SetDeathSpawn
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_SetSpawn

	thumb_func_start ScrCmd_GetPlayerGender
ScrCmd_GetPlayerGender: ; 0x020445F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_GetPlayerGender

	thumb_func_start ScrCmd_HealParty
ScrCmd_HealParty: ; 0x02044628
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl TaskManager_GetSys
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_HealParty

	thumb_func_start ScrCmd_283
ScrCmd_283: ; 0x02044640
	push {r4, lr}
	add r4, r0, #0
	bl sub_02058284
	ldr r1, _02044654 ; =sub_02044658
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02044654: .word sub_02044658
	thumb_func_end ScrCmd_283

	thumb_func_start sub_02044658
sub_02044658: ; 0x02044658
	push {r3, lr}
	bl sub_02037D78
	cmp r0, #1
	beq _0204466E
	bl sub_02035650
	cmp r0, #1
	beq _0204466E
	mov r0, #1
	pop {r3, pc}
_0204466E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044658

	thumb_func_start ScrCmd_587
ScrCmd_587: ; 0x02044674
	push {r4, lr}
	add r4, r0, #0
	bl sub_020582A8
	ldr r1, _02044688 ; =sub_02044658
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02044688: .word sub_02044658
	thumb_func_end ScrCmd_587

	thumb_func_start ScrCmd_284
ScrCmd_284: ; 0x0204468C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02058190
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_284

	thumb_func_start ScrCmd_285
ScrCmd_285: ; 0x0204469C
	push {r3, lr}
	bl ScriptReadHalfword
	bl sub_02057F28
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_285

	thumb_func_start ScrCmd_335
ScrCmd_335: ; 0x020446AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	add r1, r6, #0
	bl Bag_PocketNotEmpty
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_335

	thumb_func_start ScrCmd_338
ScrCmd_338: ; 0x020446EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl Field_SetObjectEventXYPos
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_338

	thumb_func_start ScrCmd_MovePerson
ScrCmd_MovePerson: ; 0x0204473C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r5, r0, #0
	add r1, r7, #0
	str r4, [sp]
	bl sub_0205FC2C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_MovePerson

	thumb_func_start ScrCmd_SetObjectMovementType
ScrCmd_SetObjectMovementType: ; 0x020447CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl Field_SetObjectEventMovement
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_SetObjectMovementType

	thumb_func_start ScrCmd_341
ScrCmd_341: ; 0x02044804
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl Field_SetObjectEventFacing
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_341

	thumb_func_start ScrCmd_342
ScrCmd_342: ; 0x0204483C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl Field_SetWarpXYPos
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_342

	thumb_func_start ScrCmd_343
ScrCmd_343: ; 0x0204488C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl Field_SetBgEventXYPos
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_343

	thumb_func_start ScrCmd_344
ScrCmd_344: ; 0x020448DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r5, r0, #0
	bne _0204491A
	bl GF_AssertFail
_0204491A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9408
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_344

	thumb_func_start ScrCmd_347
ScrCmd_347: ; 0x02044928
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xc
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	ldr r1, [r5]
	cmp r1, #0
	beq _02044950
	strh r0, [r1]
_02044950:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_347

	thumb_func_start ScrCmd_307
ScrCmd_307: ; 0x02044954
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	lsl r1, r4, #5
	ldr r3, [r5, #8]
	add r2, r0, #0
	add r0, r3, #1
	str r0, [r5, #8]
	add r5, #0x80
	lsl r4, r6, #5
	ldrb r3, [r3]
	ldr r0, [r5]
	add r1, r7, r1
	add r2, r2, r4
	bl ov01_021E9AE8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_307

	thumb_func_start ScrCmd_308
ScrCmd_308: ; 0x020449AC
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9C00
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_308

	thumb_func_start ScrCmd_309
ScrCmd_309: ; 0x020449C4
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9C20
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_309

	thumb_func_start ScrCmd_310
ScrCmd_310: ; 0x020449DC
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9BB8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_310

	thumb_func_start ScrCmd_311
ScrCmd_311: ; 0x020449F4
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9BDC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_311

	thumb_func_start ScrCmd_314
ScrCmd_314: ; 0x02044A0C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068DE0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_314

	thumb_func_start ScrCmd_315
ScrCmd_315: ; 0x02044A1C
	push {r4, lr}
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #1
	beq _02044A38
	mov r0, #0
	pop {r4, pc}
_02044A38:
	add r0, r4, #0
	bl ov04_02254D98
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_315

	thumb_func_start ScrCmd_316
ScrCmd_316: ; 0x02044A44
	push {r4, lr}
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #1
	beq _02044A60
	mov r0, #0
	pop {r4, pc}
_02044A60:
	add r0, r4, #0
	bl ov04_02254DD0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_316

	thumb_func_start ScrCmd_317
ScrCmd_317: ; 0x02044A6C
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r4, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, r4, #0
	ldrb r5, [r2]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #1
	beq _02044A92
	mov r0, #1
	pop {r3, r4, r5, pc}
_02044A92:
	cmp r5, #0
	beq _02044A9A
	mov r1, #0xa
	b _02044A9C
_02044A9A:
	mov r1, #0x1e
_02044A9C:
	add r0, r4, #0
	bl ov04_02254DE0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_317

	thumb_func_start ScrCmd_318
ScrCmd_318: ; 0x02044AA8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068E08
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_318

	thumb_func_start ScrCmd_319
ScrCmd_319: ; 0x02044AB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ov04_02256058
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_319

	thumb_func_start ScrCmd_320
ScrCmd_320: ; 0x02044AE0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068E24
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_320

	thumb_func_start ScrCmd_321
ScrCmd_321: ; 0x02044AF0
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r0, #8]
	ldrb r2, [r3]
	add r0, r4, #0
	bl ov04_0225640C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_321

	thumb_func_start ScrCmd_322
ScrCmd_322: ; 0x02044B10
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r2, [r4, #8]
	ldr r6, [r1]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r5, [r2]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov04_022563C4
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_322

	thumb_func_start ScrCmd_323
ScrCmd_323: ; 0x02044B40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068E70
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_323

	thumb_func_start ScrCmd_324
ScrCmd_324: ; 0x02044B50
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068EB0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_324

	thumb_func_start ScrCmd_325
ScrCmd_325: ; 0x02044B60
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov04_02253ED4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_325

	thumb_func_start ScrCmd_326
ScrCmd_326: ; 0x02044B70
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068ED0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_326

	thumb_func_start ScrCmd_327
ScrCmd_327: ; 0x02044B80
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov04_02254568
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_327

	thumb_func_start ScrCmd_328
ScrCmd_328: ; 0x02044B9C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov04_02254404
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_328

	thumb_func_start ScrCmd_329
ScrCmd_329: ; 0x02044BB8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068F00
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_329

	thumb_func_start ScrCmd_330
ScrCmd_330: ; 0x02044BC8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068F40
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_330

	thumb_func_start ScrCmd_331
ScrCmd_331: ; 0x02044BD8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068F54
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_331

	thumb_func_start ScrCmd_685
ScrCmd_685: ; 0x02044BE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r4, r0, #0
	bl MapObject_GetNextX
	strh r0, [r6]
	add r0, r4, #0
	bl MapObject_GetNextHeight
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	strh r0, [r7]
	add r0, r4, #0
	bl MapObject_GetNextY
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_685

	thumb_func_start ScrCmd_EggHatchAnim
ScrCmd_EggHatchAnim: ; 0x02044C54
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F9F4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_EggHatchAnim

	thumb_func_start ScrCmd_374
ScrCmd_374: ; 0x02044C64
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl GetMapObjectByID
	add r4, r0, #0
	bne _02044C8C
	bl GF_AssertFail
_02044C8C:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F690
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_374

	thumb_func_start ScrCmd_375
ScrCmd_375: ; 0x02044C98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl GetMapObjectByID
	add r4, r0, #0
	bne _02044CC0
	bl GF_AssertFail
_02044CC0:
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F690
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_375

	thumb_func_start ScrCmd_376
ScrCmd_376: ; 0x02044CCC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl sub_0203F074
	str r0, [r4]
	ldr r1, _02044CF8 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02044CF8: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_376

	thumb_func_start ScrCmd_377
ScrCmd_377: ; 0x02044CFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_Mailbox_get
	mov r1, #0
	bl Mailbox_CountMessages
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_377

	thumb_func_start ScrCmd_378
ScrCmd_378: ; 0x02044D28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	add r5, #0x80
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_02097D3C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_378

	thumb_func_start ScrCmd_379
ScrCmd_379: ; 0x02044D68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl Field_GetTImeOfDay
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_379

	thumb_func_start ScrCmd_380
ScrCmd_380: ; 0x02044D8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	strh r1, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_380

	thumb_func_start ScrCmd_381
ScrCmd_381: ; 0x02044DC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	strh r1, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_381

	thumb_func_start ScrCmd_403
ScrCmd_403: ; 0x02044DFC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202BB08
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_403

	thumb_func_start ScrCmd_404
ScrCmd_404: ; 0x02044E40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0202BA2C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_404

	thumb_func_start ScrCmd_405
ScrCmd_405: ; 0x02044E9C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r7, #0
	bl sub_0202BA70
	cmp r6, r0
	bhi _02044EF6
	mov r0, #1
	b _02044EF8
_02044EF6:
	mov r0, #0
_02044EF8:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_405

	thumb_func_start ScrCmd_406
ScrCmd_406: ; 0x02044F00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r4, #0
	bl sub_0202BBD8
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_406

	thumb_func_start ScrCmd_407
ScrCmd_407: ; 0x02044F30
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r6, #0
	bl sub_0202BA5C
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_407

	thumb_func_start ScrCmd_CheckJohtoDexComplete
ScrCmd_CheckJohtoDexComplete: ; 0x02044F74
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl Pokedex_JohtoDexIsComplete
	cmp r0, #1
	bne _02044FA8
	mov r0, #1
	strh r0, [r4]
_02044FA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CheckJohtoDexComplete

	thumb_func_start ScrCmd_CheckNationalDexComplete
ScrCmd_CheckNationalDexComplete: ; 0x02044FAC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl Pokedex_NationalDexIsComplete
	cmp r0, #1
	bne _02044FE0
	mov r0, #1
	strh r0, [r4]
_02044FE0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_CheckNationalDexComplete

	thumb_func_start ScrCmd_425
ScrCmd_425: ; 0x02044FE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x20
	bl sub_0203FA8C
	str r0, [r4]
	ldr r1, _02045024 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02045024: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_425

	thumb_func_start ScrCmd_427
ScrCmd_427: ; 0x02045028
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_427

	thumb_func_start ScrCmd_420
ScrCmd_420: ; 0x02045040
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_Inc
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_420

	thumb_func_start ScrCmd_421
ScrCmd_421: ; 0x02045060
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r7, #0
	bl GameStats_GetCapped
	ldr r1, _020450B4 ; =0xFFFF0000
	and r1, r0
	lsr r1, r1, #0x10
	strh r1, [r4]
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020450B4: .word 0xFFFF0000
	thumb_func_end ScrCmd_421

	thumb_func_start ScrCmd_422
ScrCmd_422: ; 0x020450B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	lsl r2, r4, #0x10
	add r4, r2, #0
	orr r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _020450EC
	cmp r0, #1
	beq _02045100
	cmp r0, #2
	beq _02045114
	b _02045126
_020450EC:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r6, #0
	add r2, r4, #0
	bl GameStats_Add
	b _02045126
_02045100:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r6, #0
	add r2, r4, #0
	bl GameStats_SetCapped
	b _02045126
_02045114:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r6, #0
	add r2, r4, #0
	bl GameStats_UpdateBounded
_02045126:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_422

	thumb_func_start ScrCmd_704
ScrCmd_704: ; 0x0204512C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	add r2, r6, #0
	bl GameStats_Add
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_704

	thumb_func_start ScrCmd_705
ScrCmd_705: ; 0x02045160
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	add r2, r6, #0
	bl GameStats_Add
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_705

	thumb_func_start ScrCmd_SafariZoneAction
ScrCmd_SafariZoneAction: ; 0x02045188
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_SafariZone_get
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r4, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	str r0, [sp]
	add r0, r6, #0
	bl sub_0203B9B8
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0203B9BC
	add r6, r0, #0
	cmp r4, #0
	beq _020451E0
	cmp r4, #1
	beq _020451F8
	b _02045228
_020451E0:
	ldr r0, [sp, #4]
	bl ScriptState_SetSafariSysFlag
	ldr r0, [sp, #8]
	ldr r1, [sp]
	bl sub_0202F5F8
	mov r0, #0x1e
	strh r0, [r7]
	mov r0, #0
	strh r0, [r6]
	b _02045228
_020451F8:
	ldr r0, [sp, #4]
	bl ScriptState_ClearSafariSysFlag
	ldr r0, [sp, #8]
	mov r1, #1
	bl sub_0202F5F8
	ldr r0, [sp, #8]
	bl sub_0202F6AC
	add r1, r0, #0
	beq _02045222
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0209730C
	ldr r0, [sp, #8]
	mov r1, #0
	bl sub_0202F6A0
_02045222:
	mov r0, #0
	strh r0, [r7]
	strh r0, [r6]
_02045228:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_SafariZoneAction

	thumb_func_start ScrCmd_459
ScrCmd_459: ; 0x02045230
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl ov02_02245B80
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_459

	thumb_func_start ScrCmd_456
ScrCmd_456: ; 0x0204523C
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0x40]
	bl sub_0205C858
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_456

	thumb_func_start ScrCmd_463
ScrCmd_463: ; 0x02045254
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202D9D0
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_463

	thumb_func_start ScrCmd_CreateRoamer
ScrCmd_CreateRoamer: ; 0x02045264
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0xc]
	bl Save_CreateRoamerByID
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_CreateRoamer

	thumb_func_start ScrCmd_470
ScrCmd_470: ; 0x0204527C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r5, [r1]
	ldr r0, _020452AC ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	mov r0, #0xb
	add r1, r5, #0
	bl ov23_022598C0
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_020452AC: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end ScrCmd_470

	thumb_func_start ScrCmd_471
ScrCmd_471: ; 0x020452B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl ov23_02259B50
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_471

	thumb_func_start ScrCmd_472
ScrCmd_472: ; 0x020452E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl ov23_02259B58
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_472

	thumb_func_start ScrCmd_612
ScrCmd_612: ; 0x02045310
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl ov23_02259B60
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_612

	thumb_func_start ScrCmd_473
ScrCmd_473: ; 0x02045340
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r5, #0x74]
	ldr r1, [r4]
	mov r3, #0xb
	bl sub_02067A1C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_473

	thumb_func_start ScrCmd_474
ScrCmd_474: ; 0x02045374
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov23_02259944
	ldr r0, _02045390 ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02045390: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end ScrCmd_474

	thumb_func_start ScrCmd_362
ScrCmd_362: ; 0x02045394
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r6, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r7, r0, #0
	ldr r0, _020453CC ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r5, #0x80
	ldr r0, [r5]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov23_02259964
	ldr r0, _020453CC ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020453CC: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end ScrCmd_362

	thumb_func_start ScrCmd_363
ScrCmd_363: ; 0x020453D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	ldr r0, _02045424 ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r5, #0x80
	lsl r2, r6, #0x18
	ldr r0, [r5]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl ov23_02259AA0
	strh r0, [r7]
	ldr r0, _02045424 ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02045424: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end ScrCmd_363

	thumb_func_start ScrCmd_475
ScrCmd_475: ; 0x02045428
	mov r0, #0
	bx lr
	thumb_func_end ScrCmd_475

	thumb_func_start ScrCmd_476
ScrCmd_476: ; 0x0204542C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl sub_0202A57C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_476

	thumb_func_start ScrCmd_NatDexFlagAction
ScrCmd_NatDexFlagAction: ; 0x02045440
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0
	strh r0, [r6]
	cmp r4, #1
	bne _02045486
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl Pokedex_SetNatDexFlag
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_SetNatDexFlag
	b _020454A0
_02045486:
	cmp r4, #2
	bne _0204549C
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl Pokedex_GetNatDexFlag
	strh r0, [r6]
	b _020454A0
_0204549C:
	bl GF_AssertFail
_020454A0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_NatDexFlagAction

	thumb_func_start ScrCmd_GetEVTotal
ScrCmd_GetEVTotal: ; 0x020454A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	mov r1, #0xd
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	add r1, r4, r6
	add r2, r7, r1
	ldr r1, [sp, #4]
	add r2, r1, r2
	ldr r1, [sp, #8]
	add r1, r1, r2
	add r1, r0, r1
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetEVTotal

	thumb_func_start ScrCmd_GetWeekday
ScrCmd_GetWeekday: ; 0x02045540
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, sp, #0
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0xc]
	strh r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetWeekday

	thumb_func_start ScrCmd_485
ScrCmd_485: ; 0x02045568
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl ov03_022566B0
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_485

	thumb_func_start ScrCmd_PokeCenAnim
ScrCmd_PokeCenAnim: ; 0x02045588
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r4, #0x80
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl PokecenterAnimCreate
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PokeCenAnim

	thumb_func_start ScrCmd_ElevatorAnim
ScrCmd_ElevatorAnim: ; 0x020455B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	add r5, #0x80
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov02_0224BDE8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ElevatorAnim

	thumb_func_start ScrCmd_GetGameVersion
ScrCmd_GetGameVersion: ; 0x020455F0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #GAME_VERSION
	strh r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetGameVersion

	thumb_func_start ScrCmd_PrimoPasswordCheck1
ScrCmd_PrimoPasswordCheck1: ; 0x0204560C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl GetStoragePCPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r1, r7, #0
	bl ov02_0224CD38
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _020456AA
	cmp r5, #7
	ble _020456B4
_020456AA:
	mov r0, #0xff
	strh r0, [r4]
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020456B4:
	add r0, r6, #0
	add r1, r5, #0
	bl PCStorage_IsBonusWallpaperUnlocked
	cmp r0, #0
	beq _020456C4
	mov r0, #0
	b _020456CE
_020456C4:
	add r0, r6, #0
	add r1, r5, #0
	bl PCStorage_UnlockBonusWallpaper
	add r0, r5, #1
_020456CE:
	strh r0, [r4]
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PrimoPasswordCheck1

	thumb_func_start ScrCmd_PrimoPasswordCheck2
ScrCmd_PrimoPasswordCheck2: ; 0x020456D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl GetStoragePCPointer
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0xc]
	add r1, r6, #0
	add r2, r7, #0
	bl ov02_0224CD74
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02045778
	mov r0, #0xff
	strh r0, [r4]
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02045778:
	strh r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_PrimoPasswordCheck2

	thumb_func_start ScrCmd_500
ScrCmd_500: ; 0x02045780
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov02_0224BF58
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_500

	thumb_func_start ScrCmd_501
ScrCmd_501: ; 0x0204579C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov02_0224BFC0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_501

	thumb_func_start ScrCmd_502
ScrCmd_502: ; 0x020457B8
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov02_0224BFCC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_502

	thumb_func_start Script_SetMonSeenFlagBySpecies
Script_SetMonSeenFlagBySpecies: ; 0x020457D4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl Sav2_Pokedex_get
	add r6, r0, #0
	mov r0, #0x20
	bl AllocMonZeroed
	add r4, r0, #0
	bl ZeroMonData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x32
	mov r3, #0x20
	bl CreateMon
	add r0, r6, #0
	add r1, r4, #0
	bl Pokedex_SetMonSeenFlag
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Script_SetMonSeenFlagBySpecies

	thumb_func_start ScrCmd_687
ScrCmd_687: ; 0x02045818
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl Script_SetMonSeenFlagBySpecies
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_687

	thumb_func_start ScrCmd_CountPCEmptySpace
ScrCmd_CountPCEmptySpace: ; 0x0204583C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl GetStoragePCPointer
	bl PCStorage_CountEmptySpotsInAllBoxes
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CountPCEmptySpace

	thumb_func_start ScrCmd_512
ScrCmd_512: ; 0x02045868
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x17
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	mov r0, #0
	add r5, #0x80
	str r0, [r4]
	ldr r0, [r5]
	bl ov01_021F2F70
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_512

	thumb_func_start ScrCmd_513
ScrCmd_513: ; 0x0204588C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x17
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021F2FF0
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_513

	thumb_func_start ScrCmd_HallOfFameAnim
ScrCmd_HallOfFameAnim: ; 0x020458A4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r4, #0x80
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl ov02_0224CDB0
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_HallOfFameAnim

	thumb_func_start ScrCmd_AddSpecialGameStat
ScrCmd_AddSpecialGameStat: ; 0x020458CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_AddSpecial
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_AddSpecialGameStat

	thumb_func_start ScrCmd_517
ScrCmd_517: ; 0x020458EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl PartyHasMon
	strh r0, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_517

	thumb_func_start ScrCmd_518
ScrCmd_518: ; 0x0204592C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, sp, #4
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	bl GetPartyCount
	add r4, #0x80
	add r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r7, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _020459A2
_0204596C:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, _020459A8 ; =0x00000182
	cmp r0, r1
	bne _0204599C
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #4
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_SetMonCaughtFlag
_0204599C:
	add r5, r5, #1
	cmp r5, r6
	blt _0204596C
_020459A2:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020459A8: .word 0x00000182
	thumb_func_end ScrCmd_518

	thumb_func_start ScrCmd_519
ScrCmd_519: ; 0x020459AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0xc]
	bl GetPartyCount
	add r2, sp, #0x18
	mov r4, #0
	ldr r3, _02045A5C ; =_020FACC4
	str r0, [sp, #8]
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #8]
	str r4, [sp, #4]
	cmp r0, #0
	ble _02045A50
	mov r5, #1
	str r7, [sp, #0x14]
_020459F6:
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	mov r0, #0x67
	ldr r1, [sp, #0x10]
	lsl r0, r0, #2
	cmp r1, r0
	bne _02045A46
	mov r2, #0
	add r1, r2, #0
	str r3, [r7]
	cmp r4, #0
	ble _02045A3C
	ldr r6, [sp, #0x14]
_02045A2C:
	ldr r0, [r6]
	cmp r3, r0
	bne _02045A34
	add r2, r5, #0
_02045A34:
	add r1, r1, #1
	add r6, r6, #4
	cmp r1, r4
	blt _02045A2C
_02045A3C:
	cmp r2, #0
	bne _02045A46
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02045A46:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r7, r7, #4
	cmp r4, r0
	blt _020459F6
_02045A50:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #1
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02045A5C: .word _020FACC4
	thumb_func_end ScrCmd_519

	thumb_func_start ScrCmd_520
ScrCmd_520: ; 0x02045A60
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066820
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_520

	thumb_func_start ScrCmd_521
ScrCmd_521: ; 0x02045A74
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066830
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_521

	thumb_func_start ScrCmd_522
ScrCmd_522: ; 0x02045A88
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02055618
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_522

	thumb_func_start ScrCmd_523
ScrCmd_523: ; 0x02045AAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r7, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r7, r0, #0
	bne _02045B2A
	bl GF_AssertFail
_02045B2A:
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, [r5, #0x74]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	add r1, r7, #0
	bl sub_0205BED8
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_523

	thumb_func_start ScrCmd_524
ScrCmd_524: ; 0x02045B40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r5, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r5, r0, #0
	bne _02045B94
	bl GF_AssertFail
_02045B94:
	ldr r0, [r4, #0x74]
	add r1, r5, #0
	add r2, r7, #0
	add r3, r6, #0
	bl sub_0205BFB4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_524

	thumb_func_start ScrCmd_525
ScrCmd_525: ; 0x02045BA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0205BDB8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_525

	thumb_func_start ScrCmd_526
ScrCmd_526: ; 0x02045BCC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	mov r6, #0
	add r7, r0, #0
	add r4, r6, #0
	add r5, sp, #4
_02045BFA:
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x22
	mov r2, #1
	bl sub_0202BA2C
	cmp r0, #1
	bne _02045C10
	mov r0, #1
	strh r0, [r5]
	add r6, r6, #1
_02045C10:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #0x10
	blt _02045BFA
	cmp r6, #0
	bne _02045C28
	ldr r0, [sp]
	ldr r1, _02045C60 ; =0x0000FFFF
	add sp, #0x24
	strh r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02045C28:
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	mov r4, #0
	add r2, sp, #4
_02045C36:
	ldrh r0, [r2]
	cmp r0, #1
	bne _02045C42
	cmp r1, #0
	beq _02045C4A
	sub r1, r1, #1
_02045C42:
	add r4, r4, #1
	add r2, r2, #2
	cmp r4, #0x10
	blt _02045C36
_02045C4A:
	cmp r4, #0x10
	blt _02045C52
	bl GF_AssertFail
_02045C52:
	ldr r0, [sp]
	add r4, #0x22
	strh r4, [r0]
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02045C60: .word 0x0000FFFF
	thumb_func_end ScrCmd_526

	thumb_func_start ScrCmd_528
ScrCmd_528: ; 0x02045C64
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	ldr r1, _02045C80 ; =gMain + 0x60
	ldrb r1, [r1, #0xa]
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02045C80: .word gMain + 0x60
	thumb_func_end ScrCmd_528

	thumb_func_start ScrCmd_530
ScrCmd_530: ; 0x02045C84
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r5, #0x80
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	cmp r4, #0
	beq _02045CB8
	add r1, r6, #0
	bl sub_02066C1C
	b _02045CBE
_02045CB8:
	add r1, r6, #0
	bl sub_02066C4C
_02045CBE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_530

	thumb_func_start ScrCmd_BufferBackgroundName
ScrCmd_BufferBackgroundName: ; 0x02045CC4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferContestBackgroundName
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_BufferBackgroundName

	thumb_func_start ScrCmd_534
ScrCmd_534: ; 0x02045CFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066D40
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_534

	thumb_func_start ScrCmd_536
ScrCmd_536: ; 0x02045D28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202BB7C
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_536

	thumb_func_start ScrCmd_537
ScrCmd_537: ; 0x02045D6C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02066D60
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_537

	thumb_func_start ScrCmd_538
ScrCmd_538: ; 0x02045D7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_EasyChat_get
	bl SaveEasyChat_RandomTrendySayingSet
	cmp r0, #0x20
	bne _02045DCE
	ldr r0, _02045DE4 ; =0x0000FFFF
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02045DCE:
	strh r0, [r4]
	bl TrendyWordIdxToECWord
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r7, #0
	bl BufferECWord
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02045DE4: .word 0x0000FFFF
	thumb_func_end ScrCmd_538

	thumb_func_start ScrCmd_540
ScrCmd_540: ; 0x02045DE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_EasyChat_get
	bl SaveEasyChat_TrendySayingsUnlockedAllCheck
	cmp r0, #1
	bne _02045E14
	mov r0, #1
	b _02045E16
_02045E14:
	mov r0, #0
_02045E16:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_540

	thumb_func_start ScrCmd_539
ScrCmd_539: ; 0x02045E1C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02066DA8
	cmp r0, #5
	blo _02045E4C
	mov r0, #1
	b _02045E4E
_02045E4C:
	mov r0, #0
_02045E4E:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_539

	thumb_func_start ScrCmd_543
ScrCmd_543: ; 0x02045E54
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	ldr r6, [r4]
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl Sav2_SysInfo_get
	add r7, r0, #0
	bl Sav2_SysInfo_GetBirthMonth
	add r4, r0, #0
	add r0, r6, #0
	bl sub_02055600
	cmp r4, r0
	bne _02045E9E
	add r0, r7, #0
	bl Sav2_SysInfo_GetBirthDay
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205560C
	cmp r4, r0
	bne _02045E9E
	mov r0, #1
	strh r0, [r5]
	b _02045EA2
_02045E9E:
	mov r0, #0
	strh r0, [r5]
_02045EA2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_543

	thumb_func_start ScrCmd_545
ScrCmd_545: ; 0x02045EA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl Pokedex_GetSeenFormeNum_Unown
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_545

	thumb_func_start ScrCmd_546
ScrCmd_546: ; 0x02045ED8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r5, r0, #0
	cmp r4, #1
	bls _02045F0A
	bl GF_AssertFail
_02045F0A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066BC0
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_546

	thumb_func_start ScrCmd_550
ScrCmd_550: ; 0x02045F18
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x20
	ldr r0, [r0, #0xc]
	add r2, sp, #0
	bl LoadHallOfFame
	ldr r1, [sp]
	add r4, r0, #0
	cmp r1, #0
	bne _02045F50
	mov r1, #0
	strh r1, [r5]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02045F50:
	cmp r1, #1
	bne _02045F66
	mov r1, #0
	bl Sav2_HOF_TranslateRecordIdx
	strh r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02045F66:
	cmp r1, #2
	bne _02045F76
	mov r1, #0
	strh r1, [r5]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02045F76:
	mov r0, #0
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_550

	thumb_func_start ScrCmd_551
ScrCmd_551: ; 0x02045F80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r5, #0
	add r1, #0x80
	add r4, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	add r2, r6, #0
	bl sub_0203E5D0
	str r0, [r4]
	ldr r1, _02045FC0 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02045FC0: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_551

	thumb_func_start ScrCmd_552
ScrCmd_552: ; 0x02045FC4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02046004
	bl GF_AssertFail
_02046004:
	ldr r0, [r4]
	bl sub_0203E5C8
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #7
	bne _02046016
	mov r0, #0xff
	strh r0, [r6]
_02046016:
	ldr r0, [r4]
	bl sub_0203E5F8
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #1
	bne _02046028
	mov r0, #1
	b _0204602A
_02046028:
	mov r0, #0
_0204602A:
	strh r0, [r5]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_552

	thumb_func_start ScrCmd_553
ScrCmd_553: ; 0x02046038
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	cmp r4, #0x64
	bls _0204605A
	mov r4, #0x64
_0204605A:
	bl LCRandom
	mov r1, #0x65
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	bgt _02046070
	mov r0, #1
	b _02046072
_02046070:
	mov r0, #0
_02046072:
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_553

	thumb_func_start ScrCmd_560
ScrCmd_560: ; 0x02046078
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	cmp r5, #5
	bhi _020460FE
	add r2, r5, r5
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_020460B6: ; jump table
	.short _020460C2 - _020460B6 - 2 ; case 0
	.short _020460CC - _020460B6 - 2 ; case 1
	.short _020460D6 - _020460B6 - 2 ; case 2
	.short _020460E0 - _020460B6 - 2 ; case 3
	.short _020460EA - _020460B6 - 2 ; case 4
	.short _020460F4 - _020460B6 - 2 ; case 5
_020460C2:
	mov r2, #0
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460CC:
	mov r2, #1
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460D6:
	mov r2, #2
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460E0:
	mov r2, #3
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460EA:
	mov r2, #4
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460F4:
	mov r2, #5
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460FE:
	bl GF_AssertFail
_02046102:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_560

	thumb_func_start ScrCmd_564
ScrCmd_564: ; 0x02046108
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_564

	thumb_func_start ScrCmd_565
ScrCmd_565: ; 0x02046130
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C6F4
	bl sub_0202C2F8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_565

	thumb_func_start ScrCmd_568
ScrCmd_568: ; 0x0204615C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	ldr r1, _0204619C ; =0x0000012A
	cmp r4, r1
	blo _02046196
	add r1, #0xf
	cmp r4, r1
	bhi _02046196
	mov r1, #1
	strh r1, [r0]
_02046196:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0204619C: .word 0x0000012A
	thumb_func_end ScrCmd_568

	thumb_func_start ScrCmd_571
ScrCmd_571: ; 0x020461A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r7, r0, #0
	mov r0, #0x20
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xca
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r5, r0, #0
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	bl BufferECWord
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	bl BufferECWord
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	bl BufferECWord
	add r0, r4, #0
	mov r1, #3
	add r2, r7, #0
	bl BufferECWord
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	mov r3, #0x20
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [sp]
	ldr r1, [sp]
	add r0, r7, #0
	bl StringCompare
	cmp r0, #0
	bne _0204626C
	mov r0, #1
	b _0204626E
_0204626C:
	mov r0, #0
_0204626E:
	strh r0, [r6]
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp]
	bl String_dtor
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_571

	thumb_func_start ScrCmd_573
ScrCmd_573: ; 0x02046290
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_get
	mov r1, #1
	bl sub_02028DD0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_573

	thumb_func_start ScrCmd_576
ScrCmd_576: ; 0x020462A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl sub_0205A6AC
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_576

	thumb_func_start ScrCmd_577
ScrCmd_577: ; 0x020462D8
	push {r3, lr}
	bl sub_0203A880
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_577

	thumb_func_start ScrCmd_578
ScrCmd_578: ; 0x020462E4
	push {r3, lr}
	bl sub_0203A914
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_578

	thumb_func_start ScrCmd_579
ScrCmd_579: ; 0x020462F0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203B9DC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_579

	thumb_func_start ScrCmd_582
ScrCmd_582: ; 0x02046300
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetSpecialSpawnWarpPtr
	str r4, [r0]
	str r6, [r0, #8]
	mov r1, #0
	str r7, [r0, #0xc]
	mvn r1, r1
	str r1, [r0, #4]
	mov r1, #1
	str r1, [r0, #0x10]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_582

	thumb_func_start ScrCmd_583
ScrCmd_583: ; 0x02046360
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r2, [r5, #8]
	add r1, r0, #0
	add r0, r2, #1
	str r0, [r5, #8]
	add r5, #0x80
	ldr r0, [r5]
	ldrb r4, [r2]
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r5, r0, #0
	bne _02046390
	bl GF_AssertFail
_02046390:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F6AC
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_583

	thumb_func_start ScrCmd_GetTrcardStars
ScrCmd_GetTrcardStars: ; 0x0204639C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020691E8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetTrcardStars

	thumb_func_start ScrCmd_593
ScrCmd_593: ; 0x020463C4
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x29
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_02027500
	cmp r0, #0
	bne _020463EE
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	bl ov01_021F41C0
	str r0, [r4]
	bl ov01_021F412C
_020463EE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_593

	thumb_func_start ScrCmd_594
ScrCmd_594: ; 0x020463F4
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x29
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_02027500
	cmp r0, #0
	bne _0204641A
	ldr r0, [r4]
	bl ov01_021F41A4
	ldr r0, [r4]
	bl ov01_021F421C
_0204641A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_594

	thumb_func_start ScrCmd_595
ScrCmd_595: ; 0x02046420
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl sub_02067A80
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_595

	thumb_func_start ScrCmd_627
ScrCmd_627: ; 0x02046438
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r6, [r1]
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r6, #0
	add r0, #0xfb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r4, [r7]
	cmp r0, #1
	bhi _0204647C
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	ldr r0, [r0]
	b _0204647E
_0204647C:
	mov r0, #0
_0204647E:
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r4, #0
	add r0, #0x20
	strb r6, [r0]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _020464D8 ; =_02108584
	ldr r0, [r0, #0xc]
	add r2, r4, #0
	str r0, [r4, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	str r0, [r4, #0x18]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x94
	ldr r0, [r0]
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xb0
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x74]
	bl sub_02050624
	ldr r1, _020464DC ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020464D8: .word _02108584
_020464DC: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_627

	thumb_func_start ScrCmd_631
ScrCmd_631: ; 0x020464E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_0203FAB4
	str r0, [r4]
	ldr r1, _02046550 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02046550: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_631

	thumb_func_start ScrCmd_ScratchOffCard
ScrCmd_ScratchOffCard: ; 0x02046554
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x20
	bl ScratchOffCards_Create
	str r0, [r4]
	ldr r1, _02046580 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02046580: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_ScratchOffCard

	thumb_func_start ScrCmd_ScratchOffCardEnd
ScrCmd_ScratchOffCardEnd: ; 0x02046584
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_ScratchOffCardEnd

	thumb_func_start ScrCmd_GetScratchOffPrize
ScrCmd_GetScratchOffPrize: ; 0x020465A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r1, [r0]
	lsl r0, r4, #1
	add r1, r1, r0
	ldrh r0, [r1, #8]
	strh r0, [r6]
	ldrh r0, [r1, #0xe]
	strh r0, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetScratchOffPrize

	thumb_func_start ScrCmd_662
ScrCmd_662: ; 0x020465FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _02046666
	mov r0, #1
	strh r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0203FC14
	ldr r1, _02046670 ; =ScrNative_WaitApplication
	add r0, r5, #0
	bl SetupNativeScript
	b _0204666A
_02046666:
	mov r0, #0
	strh r0, [r4]
_0204666A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02046670: .word ScrNative_WaitApplication
	thumb_func_end ScrCmd_662

	thumb_func_start ScrCmd_663
ScrCmd_663: ; 0x02046674
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _020466A2
	ldrh r1, [r4]
	ldr r0, [r5, #0x74]
	bl sub_02056D00
_020466A2:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_663

	thumb_func_start ScrCmd_667
ScrCmd_667: ; 0x020466A8
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	ldr r1, _020466DC ; =gMain
	ldr r2, [r1, #0x44]
	mov r1, #1
	tst r2, r1
	beq _020466CA
	strh r1, [r0]
_020466CA:
	ldr r1, _020466DC ; =gMain
	ldr r2, [r1, #0x44]
	mov r1, #2
	tst r1, r2
	beq _020466D8
	mov r1, #1
	strh r1, [r0]
_020466D8:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020466DC: .word gMain
	thumb_func_end ScrCmd_667

	thumb_func_start ScrCmd_673
ScrCmd_673: ; 0x020466E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0
	strh r1, [r0]
	strh r1, [r7]
	strh r1, [r6]
	strh r1, [r4]
	ldr r0, [sp]
	strh r1, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020467A8
	lsr r1, r0, #1
	mov r2, #1
	and r1, r2
	cmp r1, #1
	bne _02046772
	ldr r1, [sp, #4]
	strh r2, [r1]
_02046772:
	lsr r2, r0, #2
	mov r1, #1
	and r2, r1
	cmp r2, #1
	bne _0204677E
	strh r1, [r7]
_0204677E:
	lsr r2, r0, #3
	mov r1, #1
	and r2, r1
	cmp r2, #1
	bne _0204678A
	strh r1, [r6]
_0204678A:
	lsr r2, r0, #4
	mov r1, #1
	and r2, r1
	cmp r2, #1
	bne _02046796
	strh r1, [r4]
_02046796:
	lsr r1, r0, #5
	mov r0, #1
	and r1, r0
	cmp r1, #1
	bne _020467A2
	strh r0, [r5]
_020467A2:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_673

	thumb_func_start sub_020467A8
sub_020467A8: ; 0x020467A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r6, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	bl GetPartyCount
	add r7, r0, #0
	add r4, r6, #0
	cmp r7, #0
	ble _020467FE
_020467C2:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _020467F8
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020467F8
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_020467F8:
	add r4, r4, #1
	cmp r4, r7
	blt _020467C2
_020467FE:
	ldr r0, [sp]
	bl Sav2_DayCare_get
	add r7, r0, #0
	mov r4, #0
_02046808:
	add r0, r7, #0
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetBoxMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _02046842
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02046842
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_02046842:
	add r4, r4, #1
	cmp r4, #2
	blt _02046808
	ldr r0, [sp]
	bl GetStoragePCPointer
	str r0, [sp, #4]
	mov r7, #0
_02046852:
	mov r5, #0
_02046854:
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r5, #0
	bl PCStorage_GetMonByIndexPair
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetBoxMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _0204688C
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0204688C
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_0204688C:
	add r5, r5, #1
	cmp r5, #0x1e
	blt _02046854
	add r7, r7, #1
	cmp r7, #0x12
	blo _02046852
	mov r0, #0x20
	bl AllocMonZeroed
	add r5, r0, #0
	bl Mon_GetBoxMon
	add r4, r0, #0
	ldr r0, [sp]
	bl Sav2_Pokewalker_get
	add r1, r4, #0
	bl sub_020326DC
	cmp r0, #0
	beq _020468E4
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _020468E4
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _020468E4
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_020468E4:
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020468F0: .word 0x000001DF
	thumb_func_end sub_020467A8

	thumb_func_start ScrCmd_680
ScrCmd_680: ; 0x020468F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_AddSpecial
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_680

	thumb_func_start ScrCmd_682
ScrCmd_682: ; 0x02046914
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r6, r0, #0
	mov r0, #0xb
	bl GF_ExpHeap_FndGetTotalFreeSize
	add r4, r0, #0
	mov r0, #4
	bl GF_ExpHeap_FndGetTotalFreeSize
	add r7, r0, #0
	mov r0, #0x20
	bl GF_ExpHeap_FndGetTotalFreeSize
	add r5, r0, #0
	cmp r6, #0
	bne _0204694E
	ldr r0, _0204696C ; =_021D415C
	str r4, [r0, #8]
	str r7, [r0, #4]
	str r5, [r0, #0xc]
	b _02046966
_0204694E:
	ldr r0, _0204696C ; =_021D415C
	ldr r0, [r0, #8]
	cmp r4, r0
	beq _0204695A
	bl GF_AssertFail
_0204695A:
	ldr r0, _0204696C ; =_021D415C
	ldr r0, [r0, #0xc]
	cmp r5, r0
	beq _02046966
	bl GF_AssertFail
_02046966:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204696C: .word _021D415C
	thumb_func_end ScrCmd_682

	thumb_func_start ScrCmd_691
ScrCmd_691: ; 0x02046970
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl GF_RTC_DateTimeToSec
	add r2, r5, #0
	add r2, #0xb4
	add r5, #0xb8
	ldr r3, [r2]
	ldr r2, [r5]
	sub r3, r0, r3
	sbc r1, r2
	mov r2, #0
	mov r0, #0x78
	sub r0, r3, r0
	sbc r1, r2
	blt _020469AA
	mov r0, #1
	b _020469AC
_020469AA:
	mov r0, #0
_020469AC:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_691

	thumb_func_start ScrCmd_696
ScrCmd_696: ; 0x020469B4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	add r1, r5, #0
	bl Party_UpdateAllGiratina_DistortionWorld
	ldr r0, [sp]
	bl GetPartyCount
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _02046A18
_020469F0:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _02046A12
	ldr r0, [r6, #0xc]
	bl Sav2_Pokedex_get
	add r1, r4, #0
	bl Pokedex_SetMonCaughtFlag
_02046A12:
	add r5, r5, #1
	cmp r5, r7
	blt _020469F0
_02046A18:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_696

	thumb_func_start ScrCmd_698
ScrCmd_698: ; 0x02046A1C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0
	strh r0, [r6]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	cmp r4, #4
	blo _02046A6E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02046A6E:
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02046A88
	add r0, r7, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02046A8C
_02046A88:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02046A8C:
	add r0, r7, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	add r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	ldr r1, [sp]
	cmp r1, r0
	bne _02046AB0
	mov r2, #1
	b _02046AB2
_02046AB0:
	mov r2, #0
_02046AB2:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0208E9E0
	cmp r0, #0
	bne _02046AC2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02046AC2:
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r4, #3
	bhi _02046B12
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02046ADC: ; jump table
	.short _02046AE4 - _02046ADC - 2 ; case 0
	.short _02046AFE - _02046ADC - 2 ; case 1
	.short _02046AFE - _02046ADC - 2 ; case 2
	.short _02046B0A - _02046ADC - 2 ; case 3
_02046AE4:
	cmp r0, #0xac
	beq _02046AEE
	sub r0, #0x19
	cmp r0, #1
	bhi _02046B12
_02046AEE:
	add r0, r7, #0
	bl MonIsShiny
	cmp r0, #0
	beq _02046B12
	mov r0, #1
	strh r0, [r6]
	b _02046B12
_02046AFE:
	ldr r1, _02046B18 ; =0x000001ED
	cmp r0, r1
	bne _02046B12
	mov r0, #1
	strh r0, [r6]
	b _02046B12
_02046B0A:
	cmp r0, #0xfb
	bne _02046B12
	mov r0, #1
	strh r0, [r6]
_02046B12:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02046B18: .word 0x000001ED
	thumb_func_end ScrCmd_698

	thumb_func_start ScrCmd_596
ScrCmd_596: ; 0x02046B1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	mov r1, #0xfd
	bl GetMapObjectByID
	bl ov01_022055DC
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_596

	thumb_func_start ScrCmd_597
ScrCmd_597: ; 0x02046B48
	push {r4, lr}
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0xfd
	ldr r0, [r4, #0x3c]
	bl GetMapObjectByID
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl ov01_02203AB4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_597

	thumb_func_start ScrCmd_598
ScrCmd_598: ; 0x02046B64
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	cmp r0, #1
	bne _02046B88
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02069D68
	add r1, r0, #0
	b _02046BA6
_02046B88:
	cmp r0, #2
	bne _02046B9E
	add r0, r4, #0
	bl sub_02069D68
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r1, r0, #0
	b _02046BA6
_02046B9E:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02046BA6:
	ldr r2, [r5, #0x74]
	add r0, r6, #0
	bl ov02_0224E0BC
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_598

	thumb_func_start ScrCmd_599
ScrCmd_599: ; 0x02046BB4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_02205AEC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_599

	thumb_func_start ScrCmd_600
ScrCmd_600: ; 0x02046BC4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_02205D68
	cmp r0, #0
	beq _02046BD6
	mov r0, #1
	pop {r3, pc}
_02046BD6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_600

	thumb_func_start ScrCmd_601
ScrCmd_601: ; 0x02046BDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046CAC
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	bl ov01_022055DC
	cmp r0, #0
	beq _02046C9C
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205CA1C
	bl sub_0205C6DC
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205CA1C
	bl PlayerAvatar_GetFacingDirection
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	bl MapObject_GetNextX
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02060F0C
	lsl r5, r0, #1
	ldr r0, [sp, #0xc]
	bl MapObject_GetNextHeight
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	bl MapObject_GetNextY
	add r7, r0, #0
	add r0, r4, #0
	bl sub_02060F18
	lsl r4, r0, #1
	ldr r0, [sp, #4]
	add r1, r6, r5
	add r0, #0x80
	ldr r0, [r0]
	add r2, r7, r4
	bl sub_02054918
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x18
	bl MapObject_GetPositionVec
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, sp, #0x18
	add r0, #0x80
	ldr r0, [r0]
	add r2, r6, r5
	add r3, r7, r4
	bl sub_020549A8
	cmp r0, #0
	bne _02046C98
	ldr r0, [sp, #0x14]
	bl sub_0205B778
	cmp r0, #0
	bne _02046C98
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r1, r6, r5
	add r3, r7, r4
	bl sub_02060BFC
	cmp r0, #0
	beq _02046C9C
_02046C98:
	mov r0, #0
	str r0, [sp, #8]
_02046C9C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02046CAC
	ldr r0, [sp, #4]
	bl ScrCmd_FacePlayer
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02046CAC:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_601

	thumb_func_start ScrCmd_602
ScrCmd_602: ; 0x02046CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046CEA
	cmp r4, #0
	beq _02046CDE
	add r5, #0x80
	ldr r0, [r5]
	bl sub_02069D68
	bl sub_0205F6FC
	b _02046CEA
_02046CDE:
	add r5, #0x80
	ldr r0, [r5]
	bl sub_02069D68
	bl sub_0205F708
_02046CEA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_602

	thumb_func_start ScrCmd_603
ScrCmd_603: ; 0x02046CF0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046D08
	ldr r1, _02046D0C ; =sub_02046D40
	add r0, r4, #0
	bl SetupNativeScript
_02046D08:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02046D0C: .word sub_02046D40
	thumb_func_end ScrCmd_603

	thumb_func_start ScrCmd_604
ScrCmd_604: ; 0x02046D10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046D3A
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r1, r4, #0
	bl sub_0205FC94
_02046D3A:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_604

	thumb_func_start sub_02046D40
sub_02046D40: ; 0x02046D40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	bl sub_02062198
	cmp r0, #0
	beq _02046D56
	mov r0, #1
	pop {r3, pc}
_02046D56:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02046D40

	thumb_func_start ScrCmd_605
ScrCmd_605: ; 0x02046D5C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldrb r4, [r1]
	bl sub_02069F88
	cmp r0, #0
	beq _02046DA2
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C6DC
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r1, r0, #0
	add r0, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov01_02205720
_02046DA2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_605

	thumb_func_start ScrCmd_606
ScrCmd_606: ; 0x02046DA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046DF4
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	add r4, r0, #0
	bl sub_02069F7C
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	bl sub_02069FF4
	cmp r0, #0
	beq _02046DF4
	add r0, r4, #0
	mov r1, #1
	bl sub_02069E84
	add r0, r4, #0
	mov r1, #1
	bl sub_02069DEC
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #1
	bl ov01_02205790
_02046DF4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_606

	thumb_func_start ScrCmd_607
ScrCmd_607: ; 0x02046DF8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046E32
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	bl sub_02069F7C
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	bl sub_02069FF4
	cmp r0, #0
	beq _02046E32
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #1
	bl ov01_02205790
_02046E32:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_607

	thumb_func_start ScrCmd_608
ScrCmd_608: ; 0x02046E38
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046E58
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	bl ov01_02205784
_02046E58:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_608

	thumb_func_start ScrCmd_609
ScrCmd_609: ; 0x02046E5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046E7C
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	bl sub_020659CC
_02046E7C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_609

	thumb_func_start ScrCmd_610
ScrCmd_610: ; 0x02046E80
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x18
	bl ov01_021EACBC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_610

	thumb_func_start ScrCmd_Pokeathlon
ScrCmd_Pokeathlon: ; 0x02046E9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r6, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, [sp, #0x10]
	lsl r3, r7, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x14]
	add r5, #0x80
	str r1, [sp, #4]
	ldr r1, [sp, #0x18]
	add r2, r4, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5]
	add r1, r6, #0
	lsr r3, r3, #0x18
	bl sub_02095DF4
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_Pokeathlon

	thumb_func_start ScrCmd_GetFriendSprite
ScrCmd_GetFriendSprite: ; 0x02046F34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0 ; MALE
	beq _02046F62
	mov r0, #SPRITE_HERO
	b _02046F64
_02046F62:
	mov r0, #SPRITE_HEROINE
_02046F64:
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetFriendSprite

	thumb_func_start ScrCmd_RegisterPokegearCard
ScrCmd_RegisterPokegearCard: ; 0x02046F6C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl SaveData_GSPlayerMisc_get
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _02046FA2
	cmp r1, #1
	beq _02046F92
	cmp r1, #2
	beq _02046F9A
	b _02046FA2
_02046F92:
	mov r1, #1
	bl Pokegear_RegisterCard
	b _02046FA8
_02046F9A:
	mov r1, #2
	bl Pokegear_RegisterCard
	b _02046FA8
_02046FA2:
	mov r1, #0
	bl Pokegear_RegisterCard
_02046FA8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_RegisterPokegearCard

	thumb_func_start ScrCmd_804
ScrCmd_804: ; 0x02046FAC
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SaveData_GSPlayerMisc_get
	ldrb r1, [r4]
	bl sub_0202EE58
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_804

	thumb_func_start ScrCmd_RegisterGearNumber
ScrCmd_RegisterGearNumber: ; 0x02046FC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl SaveData_GSPlayerMisc_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #0x4b
	bhs _02046FF8
	add r0, r4, #0
	bl RegisterPhoneNumberInPokeGear
_02046FF8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_RegisterGearNumber

	thumb_func_start ScrCmd_CheckRegisteredPhoneNumber
ScrCmd_CheckRegisteredPhoneNumber: ; 0x02046FFC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl SaveData_GSPlayerMisc_get
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	cmp r5, #0x4b
	bhs _02047056
	add r0, r6, #0
	add r1, r5, #0
	bl GSPlayerMisc_IsGearNumberRegistered
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0xff
	bne _02047050
	mov r0, #0
	strh r0, [r4]
	b _0204705A
_02047050:
	mov r0, #1
	strh r0, [r4]
	b _0204705A
_02047056:
	mov r0, #0
	strh r0, [r4]
_0204705A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CheckRegisteredPhoneNumber

	thumb_func_start ScrCmd_SetPhoneCall
ScrCmd_SetPhoneCall: ; 0x02047060
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02092DEC
	bl sub_02092DF4
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r5, #0x80
	add r1, r0, #0
	add r1, #0xd2
	ldrb r2, [r1]
	mov r1, #0x80
	add r0, #0xd2
	orr r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	bl sub_02092DEC
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	lsl r1, r7, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	mov r2, #0xff
	mov r3, #0
	bl ov02_02251EB8
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_SetPhoneCall

	thumb_func_start ScrCmd_RunPhoneCall
ScrCmd_RunPhoneCall: ; 0x020470F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl PhoneUI_new
	str r0, [r4]
	ldr r1, _0204711C ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204711C: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_RunPhoneCall

	thumb_func_start ScrCmd_LoadPhoneDat
ScrCmd_LoadPhoneDat: ; 0x02047120
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02092DEC
	bl sub_02092E10
	add r1, r0, #0
	add r0, r6, #0
	mov r2, #0x20
	bl LoadPhoneBookEntryI
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_LoadPhoneDat

	thumb_func_start ScrCmd_GetPhoneContactMsgIds
ScrCmd_GetPhoneContactMsgIds: ; 0x02047168
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #8
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02092DEC
	bl sub_02092E10
	add r5, r0, #0
	ldrb r0, [r5]
	bl GetPhoneMessageGmm
	ldr r1, [sp]
	strh r0, [r1]
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _020471CE
	mov r0, #0
	strh r0, [r4]
	mov r0, #1 ; error hang?
	pop {r3, r4, r5, r6, r7, pc}
_020471CE:
	cmp r6, #4
	bls _020471D4
	mov r6, #0
_020471D4:
	ldrh r0, [r7]
	bl ScriptNumToTrainerNum
	add r1, r6, #1
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	mov r1, #0xb9
	lsl r1, r1, #2
	cmp r0, r1
	blo _020471EC
	strh r5, [r4]
	b _02047208
_020471EC:
	ldrh r0, [r7]
	bl ScriptNumToTrainerNum
	bl TrainerNumIsDouble
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02047200
	strh r5, [r4]
	b _02047208
_02047200:
	ldrh r0, [r7]
	bl ScriptNoToDoublePartnerNo
	strh r5, [r4]
_02047208:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_GetPhoneContactMsgIds

	thumb_func_start ScrCmd_462
ScrCmd_462: ; 0x0204720C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_GetPhoneRematches
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	bl PhoneRematches_SetSeeking
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_462

	thumb_func_start ScrCmd_GetPhoneContactRandomGiftBerry
ScrCmd_GetPhoneContactRandomGiftBerry: ; 0x0204723C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02092DEC
	bl sub_02092E10
	ldrh r0, [r0, #8]
	cmp r0, #0x95
	bne _02047274
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r1, #0x95
	strh r1, [r4]
	b _02047276
_02047274:
	strh r0, [r4]
_02047276:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GetPhoneContactRandomGiftBerry

	thumb_func_start ScrCmd_GetPhoneContactGiftItem
ScrCmd_GetPhoneContactGiftItem: ; 0x0204727C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02092DEC
	bl sub_02092E10
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_GetPhoneRematches
	ldrb r1, [r4]
	add r5, r0, #0
	bl PhoneRematches_GiftItemIdGet
	strh r0, [r6]
	ldrb r1, [r4]
	add r0, r5, #0
	mov r2, #0
	bl PhoneRematches_GiftItemIdSet
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_GetPhoneContactGiftItem

	thumb_func_start ScrCmd_148
ScrCmd_148: ; 0x020472C4
	push {r3, r4, r5, lr}
	ldr r1, [r0, #8]
	add r5, r1, #1
	str r5, [r0, #8]
	ldrb r4, [r1]
	add r1, r5, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02092DEC
	ldrb r2, [r5]
	add r1, r4, #0
	bl sub_02092E14
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_148

	thumb_func_start ScrCmd_149
ScrCmd_149: ; 0x020472E8
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SaveData_GetPhoneRematches
	ldrb r1, [r4]
	bl sub_0202F050
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_149

	thumb_func_start ScrCmd_CameronPhoto
ScrCmd_CameronPhoto: ; 0x02047304
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl FieldSys_TakePhoto
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CameronPhoto

	thumb_func_start ScrCmd_616
ScrCmd_616: ; 0x0204731C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PhotoAlbum_get
	bl PhotoAlbum_GetNumSaved
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_616

	thumb_func_start ScrCmd_617
ScrCmd_617: ; 0x02047348
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0206A860
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_617

	thumb_func_start ScrCmd_621
ScrCmd_621: ; 0x02047358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r0, #0x80
	ldr r4, [r0]
	ldr r5, _020473D4 ; =_020FACDC
	add r3, sp, #4
	mov r2, #4
_02047366:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02047366
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x73
	bl FlagGet
	cmp r0, #0
	beq _0204738E
	mov r7, #0
	b _020473A8
_0204738E:
	add r0, r4, #0
	mov r1, #0x99
	bl FlagGet
	cmp r0, #0
	beq _0204739E
	mov r7, #1
	b _020473A8
_0204739E:
	cmp r5, #0
	ble _020473A6
	mov r7, #2
	b _020473A8
_020473A6:
	mov r7, #3
_020473A8:
	mov r6, #0
	cmp r7, #0
	ble _020473CC
	add r5, sp, #4
_020473B0:
	ldr r0, [r4, #0x54]
	mov r1, #0x8d
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r2, r5, #0
	mov r3, #0
	bl ov01_021F3C0C
	add r6, r6, #1
	add r5, #0xc
	cmp r6, r7
	blt _020473B0
_020473CC:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020473D4: .word _020FACDC
	thumb_func_end ScrCmd_621

	thumb_func_start ScrCmd_622
ScrCmd_622: ; 0x020473D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	cmp r0, #0
	beq _0204740C
	bl sub_0205F2A8
	b _0204740E
_0204740C:
	mov r0, #0
_0204740E:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_622

	thumb_func_start ScrCmd_711
ScrCmd_711: ; 0x02047414
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_0224EF80
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_711

	thumb_func_start ScrCmd_712
ScrCmd_712: ; 0x02047424
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0204747E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204744C: ; jump table
	.short _0204747E - _0204744C - 2 ; case 0
	.short _02047454 - _0204744C - 2 ; case 1
	.short _02047462 - _0204744C - 2 ; case 2
	.short _02047470 - _0204744C - 2 ; case 3
_02047454:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EEE4
	str r0, [r4]
	b _0204748A
_02047462:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EF40
	str r0, [r4]
	b _0204748A
_02047470:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EFA0
	str r0, [r4]
	b _0204748A
_0204747E:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EEA0
	str r0, [r4]
_0204748A:
	ldr r1, _02047498 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02047498: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_712

	thumb_func_start ScrCmd_AlphPuzzle
ScrCmd_AlphPuzzle: ; 0x0204749C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r1, [r1]
	cmp r1, #4
	bls _020474BA
	mov r1, #0
_020474BA:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl Fsys_CreateApplication_AlphPuzzle
	str r0, [r4]
	ldr r1, _020474D4 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020474D4: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_AlphPuzzle

	thumb_func_start ScrCmd_722
ScrCmd_722: ; 0x020474D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r7, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020977CC
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_722

	thumb_func_start ScrCmd_723
ScrCmd_723: ; 0x02047518
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r7, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020979A8
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_723

	thumb_func_start ScrCmd_Cinematic
ScrCmd_Cinematic: ; 0x02047558
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02097BE0
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_Cinematic

	thumb_func_start ScrCmd_727
ScrCmd_727: ; 0x02047570
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_727

	thumb_func_start ScrCmd_728
ScrCmd_728: ; 0x0204759C
	push {r3, lr}
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r0, #8]
	add r0, #0x80
	ldrb r2, [r3]
	ldr r0, [r0]
	bl ov01_022060B8
	cmp r0, #0
	beq _020475BC
	mov r0, #1
	pop {r3, pc}
_020475BC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_728

	thumb_func_start ScrCmd_729
ScrCmd_729: ; 0x020475C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02069F88
	cmp r0, #0
	beq _020475E6
	mov r0, #1
	b _020475E8
_020475E6:
	mov r0, #0
_020475E8:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_729

	thumb_func_start ScrCmd_730
ScrCmd_730: ; 0x020475F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	bne _0204761A
	mov r0, #1
	strh r0, [r4]
	b _02047630
_0204761A:
	add r5, #0x80
	ldr r0, [r5]
	bl ov01_022057C4
	cmp r0, #0
	beq _0204762C
	mov r0, #1
	strh r0, [r4]
	b _02047630
_0204762C:
	mov r0, #0
	strh r0, [r4]
_02047630:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_730

	thumb_func_start ScrCmd_731
ScrCmd_731: ; 0x02047634
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022508B4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_731

	thumb_func_start ScrCmd_732
ScrCmd_732: ; 0x02047644
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r1, [r0]
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	ldrsb r1, [r2, r1]
	bl sub_0206A1F4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_732

	thumb_func_start ScrCmd_733
ScrCmd_733: ; 0x02047664
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	bl ov02_02250780
	cmp r0, #0
	beq _02047694
	mov r0, #1
	b _02047696
_02047694:
	mov r0, #0
_02047696:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_733

	thumb_func_start ScrCmd_734
ScrCmd_734: ; 0x0204769C
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov02_022507B4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_734

	thumb_func_start ScrCmd_TouchscreenMenuHide
ScrCmd_TouchscreenMenuHide: ; 0x020476B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ov01_021F6B00
	cmp r0, #3
	bne _020476CA
	mov r0, #0
	pop {r3, r4, r5, pc}
_020476CA:
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov01_021F6A9C
	ldr r1, _020476E4 ; =sub_020476E8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #3
	str r0, [r4, #0x1c]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020476E4: .word sub_020476E8
	thumb_func_end ScrCmd_TouchscreenMenuHide

	thumb_func_start sub_020476E8
sub_020476E8: ; 0x020476E8
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r0, #0x80
	ldr r1, [r1, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r5, #3
	bne _02047716
	cmp r0, #1
	bne _02047716
	mov r0, #1
	pop {r3, r4, r5, pc}
_02047716:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020476E8

	thumb_func_start ScrCmd_TouchscreenMenuShow
ScrCmd_TouchscreenMenuShow: ; 0x0204771C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6A9C
	ldr r1, _02047740 ; =sub_02047744
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #0
	str r0, [r4, #0x1c]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02047740: .word sub_02047744
	thumb_func_end ScrCmd_TouchscreenMenuShow

	thumb_func_start sub_02047744
sub_02047744: ; 0x02047744
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r0, #0x80
	ldr r1, [r1, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r5, #0
	bne _02047772
	cmp r0, #1
	bne _02047772
	mov r0, #1
	pop {r3, r4, r5, pc}
_02047772:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02047744

	thumb_func_start ScrCmd_815
ScrCmd_815: ; 0x02047778
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0203E33C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_815

	thumb_func_start ScrCmd_GetMenuChoice
ScrCmd_GetMenuChoice: ; 0x02047790
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	mov r1, #3
	add r3, r4, #0
	str r0, [r4, #0x64]
	add r0, r5, #0
	add r2, r1, #0
	add r3, #0x68
	bl ov01_021F6ABC
	ldr r1, _020477BC ; =sub_020477C0
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020477BC: .word sub_020477C0
	thumb_func_end ScrCmd_GetMenuChoice

	thumb_func_start sub_020477C0
sub_020477C0: ; 0x020477C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r1, [r5, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ov01_021F6B00
	add r7, r0, #0
	add r0, r4, #0
	bl ov01_021F6AEC
	cmp r7, #3
	bne _020477F4
	cmp r0, #6
	bne _020477F4
	ldr r0, [r5, #0x68]
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020477F4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020477C0

	thumb_func_start ScrCmd_MenuInitStdGmm
ScrCmd_MenuInitStdGmm: ; 0x020477F8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F6B20
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_MenuInitStdGmm

	thumb_func_start ScrCmd_MenuInit
ScrCmd_MenuInit: ; 0x02047814
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F6B20
	add r1, r0, #0
	ldr r2, [r4, #0x78]
	add r0, r4, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_MenuInit

	thumb_func_start ScrCmd_MenuItemAdd
ScrCmd_MenuItemAdd: ; 0x02047830
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F6B20
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	add r2, r7, #0
	bl MoveTutorMenu_SetListItem
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_MenuItemAdd

	thumb_func_start ScrCmd_MenuExec
ScrCmd_MenuExec: ; 0x02047888
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ov01_021F6B20
	ldr r1, [r5, #0x64]
	add r6, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r3, r0, #0
	add r0, r4, #0
	mov r1, #3
	mov r2, #7
	bl ov01_021F6ABC
	ldr r1, _020478C8 ; =sub_02047908
	ldr r2, [r6]
	add r0, r4, #0
	bl ov01_021F6B34
	ldr r1, _020478CC ; =sub_020478D0
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_020478C8: .word sub_02047908
_020478CC: .word sub_020478D0
	thumb_func_end ScrCmd_MenuExec

	thumb_func_start sub_020478D0
sub_020478D0: ; 0x020478D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ov01_021F6B20
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	ldr r0, _02047904 ; =0x0000EEEE
	cmp r1, r0
	bne _020478F8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020478F8:
	ldr r0, [r4]
	bl ov01_021EDF00
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02047904: .word 0x0000EEEE
	thumb_func_end sub_020478D0

	thumb_func_start sub_02047908
sub_02047908: ; 0x02047908
	push {r3, lr}
	bl ov01_021EEF9C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047908

	thumb_func_start sub_02047914
sub_02047914: ; 0x02047914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetMoney
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SaveData_GetPhoneRematches
	mov r1, #0
	add r2, r1, #0
	bl MomSavingsBalanceAction
	cmp r6, #0
	beq _0204793E
	cmp r6, #1
	beq _0204794A
	b _02047956
_0204793E:
	ldr r1, _02047960 ; =999999
	sub r7, r1, r0
	cmp r4, r7
	bhi _0204795A
	add r7, r4, #0
	b _0204795A
_0204794A:
	ldr r1, _02047960 ; =999999
	sub r7, r1, r4
	cmp r0, r7
	bhi _0204795A
	add r7, r0, #0
	b _0204795A
_02047956:
	bl GF_AssertFail
_0204795A:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02047960: .word 999999
	thumb_func_end sub_02047914

	thumb_func_start ScrCmd_BankTransaction
ScrCmd_BankTransaction: ; 0x02047964
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4]
	add r4, r0, #0
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4]
	add r0, r5, #0
	str r6, [r4, #4]
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_02047914
	ldr r1, [r4]
	str r0, [r1]
	mov r1, #0
	ldr r0, [r4]
	mvn r1, r1
	str r1, [r0, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, [r4]
	mov r1, #5
	bl ov01_021F6A9C
	ldr r1, _020479D0 ; =sub_020479D4
	add r0, r5, #0
	str r7, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020479D0: .word sub_020479D4
	thumb_func_end ScrCmd_BankTransaction

	thumb_func_start sub_020479D4
sub_020479D4: ; 0x020479D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	str r0, [sp]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r7, r0, #0
	ldr r0, [sp]
	ldr r4, [r0]
	ldr r0, [r4]
	ldr r6, [r0, #4]
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _02047A0A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02047A0A:
	cmp r6, #0
	bne _02047A14
	mov r0, #1
	strh r0, [r7]
	b _02047A6A
_02047A14:
	add r5, #0x80
	ldr r0, [r5]
	ldr r5, [r0, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02047A26
	cmp r0, #1
	beq _02047A44
	b _02047A62
_02047A26:
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r6, #0
	bl PlayerProfile_SubMoney
	add r0, r5, #0
	bl SaveData_GetPhoneRematches
	ldr r2, [r4]
	mov r1, #2
	ldr r2, [r2, #4]
	bl MomSavingsBalanceAction
	b _02047A66
_02047A44:
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r6, #0
	bl PlayerProfile_AddMoney
	add r0, r5, #0
	bl SaveData_GetPhoneRematches
	ldr r2, [r4]
	mov r1, #3
	ldr r2, [r2, #4]
	bl MomSavingsBalanceAction
	b _02047A66
_02047A62:
	bl GF_AssertFail
_02047A66:
	mov r0, #0
	strh r0, [r7]
_02047A6A:
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, [sp]
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020479D4

	thumb_func_start ScrCmd_BankOrWalletIsFull
ScrCmd_BankOrWalletIsFull: ; 0x02047A7C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	cmp r6, #0
	bne _02047AC2
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_GetPhoneRematches
	mov r1, #0
	add r2, r1, #0
	bl MomSavingsBalanceAction
	ldr r1, _02047AE4 ; =999999
	cmp r0, r1
	bne _02047ABC
	mov r0, #1
	strh r0, [r4]
	b _02047AE0
_02047ABC:
	mov r0, #0
	strh r0, [r4]
	b _02047AE0
_02047AC2:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetMoney
	ldr r1, _02047AE4 ; =999999
	cmp r0, r1
	bne _02047ADC
	mov r0, #1
	strh r0, [r4]
	b _02047AE0
_02047ADC:
	mov r0, #0
	strh r0, [r4]
_02047AE0:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02047AE4: .word 999999
	thumb_func_end ScrCmd_BankOrWalletIsFull

	thumb_func_start ScrCmd_753
ScrCmd_753: ; 0x02047AE8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	lsl r1, r4, #0x18
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl ov01_02204C44
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_753

	thumb_func_start ScrCmd_754
ScrCmd_754: ; 0x02047B38
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl ov01_02204ED8
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_754

	thumb_func_start ScrCmd_755
ScrCmd_755: ; 0x02047B5C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250A60
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_755

	thumb_func_start ScrCmd_756
ScrCmd_756: ; 0x02047B6C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250AC8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_756

	thumb_func_start ScrCmd_757
ScrCmd_757: ; 0x02047B7C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250AE8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_757

	thumb_func_start ScrCmd_758
ScrCmd_758: ; 0x02047B8C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x18
	add r4, #0x80
	lsr r1, r0, #0x18
	ldr r0, [r4]
	bl ov02_02250AFC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_758

	thumb_func_start ScrCmd_759
ScrCmd_759: ; 0x02047BA4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250B80
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_759

	thumb_func_start ScrCmd_760
ScrCmd_760: ; 0x02047BB4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250B30
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_760

	thumb_func_start ScrCmd_761
ScrCmd_761: ; 0x02047BC4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x18
	add r4, #0x80
	lsr r1, r0, #0x18
	ldr r0, [r4]
	bl ov02_02251424
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_761

	thumb_func_start ScrCmd_762
ScrCmd_762: ; 0x02047BDC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x18
	add r4, #0x80
	lsr r1, r0, #0x18
	ldr r0, [r4]
	bl ov02_022514C8
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_762

	thumb_func_start ScrCmd_763
ScrCmd_763: ; 0x02047BF4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251554
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_763

	thumb_func_start ScrCmd_764
ScrCmd_764: ; 0x02047C04
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022515A4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_764

	thumb_func_start ScrCmd_765
ScrCmd_765: ; 0x02047C14
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022518E0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_765

	thumb_func_start ScrCmd_766
ScrCmd_766: ; 0x02047C24
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251B14
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_766

	thumb_func_start ScrCmd_767
ScrCmd_767: ; 0x02047C34
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251CF0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_767

	thumb_func_start ScrCmd_768
ScrCmd_768: ; 0x02047C44
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251DC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_768

	thumb_func_start ScrCmd_769
ScrCmd_769: ; 0x02047C54
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251DE8
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_769

	thumb_func_start ScrCmd_783
ScrCmd_783: ; 0x02047C64
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202ED34
	ldrb r1, [r4]
	bl sub_0202ED58
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_783

	; Loads an overlay containing additional script
	; commands or data
	thumb_func_start ScrCmd_ScriptOverlayCmd
ScrCmd_ScriptOverlayCmd: ; 0x02047C80
	push {r3, lr}
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #8]
	ldrb r0, [r3]
	cmp r2, #5
	blo _02047C98
	mov r0, #0
	pop {r3, pc}
_02047C98:
	cmp r0, #0
	bne _02047CAA
	ldr r0, _02047CB8 ; =_020FACB0
	lsl r1, r2, #2
	ldr r0, [r0, r1]
	mov r1, #2
	bl HandleLoadOverlay
	b _02047CB4
_02047CAA:
	ldr r0, _02047CB8 ; =_020FACB0
	lsl r1, r2, #2
	ldr r0, [r0, r1]
	bl UnloadOverlayByID
_02047CB4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02047CB8: .word _020FACB0
	thumb_func_end ScrCmd_ScriptOverlayCmd

	thumb_func_start ScrCmd_CheckBankBalance
ScrCmd_CheckBankBalance: ; 0x02047CBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_GetPhoneRematches
	mov r1, #0
	add r2, r1, #0
	bl MomSavingsBalanceAction
	cmp r0, r6
	blo _02047CF4
	mov r0, #1
	b _02047CF6
_02047CF4:
	mov r0, #0
_02047CF6:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_CheckBankBalance

	thumb_func_start ScrCmd_BufferRulesetName
ScrCmd_BufferRulesetName: ; 0x02047CFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r5, #0x80
	ldr r0, [r5]
	ldr r1, [r1]
	add r2, r4, #0
	bl ov03_022566D0
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_BufferRulesetName

	thumb_func_start ScrCmd_799
ScrCmd_799: ; 0x02047D24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r5, #0x80
	ldrh r2, [r4]
	ldr r0, [r5]
	ldr r1, [r1]
	bl ov03_022566D0
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_799

	thumb_func_start ScrCmd_800
ScrCmd_800: ; 0x02047D58
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	add r4, #0x80
	ldrh r1, [r1]
	ldr r0, [r4]
	bl ov03_02256710
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_800

	thumb_func_start ScrCmd_801
ScrCmd_801: ; 0x02047D7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	add r5, #0x80
	ldrh r1, [r1]
	ldr r0, [r5]
	bl ov01_021EEF68
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_801

	thumb_func_start ScrCmd_802
ScrCmd_802: ; 0x02047DB0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl ov01_021EEF88
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_802

	thumb_func_start ScrCmd_803
ScrCmd_803: ; 0x02047DC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	add r5, #0x80
	ldrh r2, [r4]
	ldr r0, [r5]
	ldr r1, [r1]
	bl ov03_02256A2C
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_803

	thumb_func_start ScrCmd_805
ScrCmd_805: ; 0x02047E14
	push {r3, lr}
	mov r0, #0x4b
	bl sub_02004B24
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_805

	thumb_func_start ScrCmd_806
ScrCmd_806: ; 0x02047E20
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl ov02_022523B4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_806

	thumb_func_start ScrCmd_810
ScrCmd_810: ; 0x02047E30
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02252534
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_810

	thumb_func_start ScrCmd_814
ScrCmd_814: ; 0x02047E40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066A1C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_814

	thumb_func_start ScrCmd_UnownCircle
ScrCmd_UnownCircle: ; 0x02047E54
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022529FC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_UnownCircle

	thumb_func_start ScrCmd_817
ScrCmd_817: ; 0x02047E64
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov02_02252EE4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_817

	thumb_func_start ScrCmd_818
ScrCmd_818: ; 0x02047E7C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0206DCC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_818

	thumb_func_start ScrCmd_819
ScrCmd_819: ; 0x02047E8C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov04_02256ED8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_819

	thumb_func_start ScrCmd_820
ScrCmd_820: ; 0x02047E9C
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov04_02256F00
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_820

	thumb_func_start ScrCmd_822
ScrCmd_822: ; 0x02047EB4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov03_02258910
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_822

	thumb_func_start ScrCmd_823
ScrCmd_823: ; 0x02047EC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	mov r0, #4
	bl PlayerProfile_new
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_SafariZone_get
	add r1, r4, #0
	bl sub_0202F844
	ldrh r1, [r6]
	ldr r0, [r7]
	add r2, r4, #0
	bl BufferPlayersName
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_823

	thumb_func_start ScrCmd_824
ScrCmd_824: ; 0x02047F14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_SafariZone_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0202F890
	add r0, r5, #0
	bl sub_0202F888
	cmp r0, #0
	beq _02047F4A
	mov r0, #1
	b _02047F4C
_02047F4A:
	mov r0, #0
_02047F4C:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_824

	thumb_func_start ScrCmd_829
ScrCmd_829: ; 0x02047F54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl ov01_02206268
	cmp r0, #0
	beq _02047F7A
	mov r0, #1
	b _02047F7C
_02047F7A:
	mov r0, #0
_02047F7C:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_829

	thumb_func_start ScrCmd_830
ScrCmd_830: ; 0x02047F84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov02_02253134
	cmp r0, #1
	bne _02047FAC
	mov r0, #1
	b _02047FAE
_02047FAC:
	mov r0, #0
_02047FAE:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_830

	thumb_func_start ScrCmd_831
ScrCmd_831: ; 0x02047FB4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl ov02_0225316C
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_831

	thumb_func_start ScrCmd_832
ScrCmd_832: ; 0x02047FD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov02_02253188
	cmp r0, #1
	bne _02047FFC
	mov r0, #1
	b _02047FFE
_02047FFC:
	mov r0, #0
_02047FFE:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_832

	thumb_func_start ScrCmd_833
ScrCmd_833: ; 0x02048004
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov02_022531B4
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_833

	thumb_func_start ScrCmd_837
ScrCmd_837: ; 0x0204802C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_020291A4
	cmp r0, #0
	beq _02048056
	mov r0, #1
	b _02048058
_02048056:
	mov r0, #0
_02048058:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_837
