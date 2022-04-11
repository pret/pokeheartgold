#include "constants/sprites.h"
#include "constants/species.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FAC94
	.public _020FACB0
	.public _020FACC4
	.public _020FACDC

	.rodata

	.public _020FACB0
	.balign 4, 0
_020FACB0:
	.word FS_OVERLAY_ID(OVY_20)
	.word FS_OVERLAY_ID(bug_contest)
	.word FS_OVERLAY_ID(OVY_21)
	.word FS_OVERLAY_ID(OVY_22)
	.word FS_OVERLAY_ID(OVY_25)
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
	.word ScrCmd_Nop                                     ; 000
	.word ScrCmd_Dummy                                   ; 001
	.word ScrCmd_End                                     ; 002
	.word ScrCmd_Wait                                    ; 003
	.word ScrCmd_LoadByte                                ; 004
	.word ScrCmd_LoadWord                                ; 005
	.word ScrCmd_LoadByteFromAddr                        ; 006
	.word ScrCmd_WriteByteToAddr                         ; 007
	.word ScrCmd_SetPtrByte                              ; 008
	.word ScrCmd_CopyLocal                               ; 009
	.word ScrCmd_CopyByte                                ; 010
	.word ScrCmd_CompareLocalToLocal                     ; 011
	.word ScrCmd_CompareLocalToValue                     ; 012
	.word ScrCmd_CompareLocalToAddr                      ; 013
	.word ScrCmd_CompareAddrToLocal                      ; 014
	.word ScrCmd_CompareAddrToValue                      ; 015
	.word ScrCmd_CompareAddrToAddr                       ; 016
	.word ScrCmd_CompareVarToValue                       ; 017
	.word ScrCmd_CompareVarToVar                         ; 018
	.word ScrCmd_RunScript                               ; 019
	.word ScrCmd_CallStd                                 ; 020
	.word ScrCmd_RestartCurrentScript                    ; 021
	.word ScrCmd_GoTo                                    ; 022
	.word ScrCmd_ObjectGoTo                              ; 023
	.word ScrCmd_BgGoTo                                  ; 024
	.word ScrCmd_DirectionGoTo                           ; 025
	.word ScrCmd_Call                                    ; 026
	.word ScrCmd_Return                                  ; 027
	.word ScrCmd_GoToIf                                  ; 028
	.word ScrCmd_CallIf                                  ; 029
	.word ScrCmd_SetFlag                                 ; 030
	.word ScrCmd_ClearFlag                               ; 031
	.word ScrCmd_CheckFlag                               ; 032
	.word ScrCmd_SetFlagVar                              ; 033
	.word ScrCmd_ClearFlagVar                            ; 034
	.word ScrCmd_CheckFlagVar                            ; 035
	.word ScrCmd_SetTrainerFlag                          ; 036
	.word ScrCmd_ClearTrainerFlag                        ; 037
	.word ScrCmd_CheckTrainerFlag                        ; 038
	.word ScrCmd_AddVar                                  ; 039
	.word ScrCmd_SubVar                                  ; 040
	.word ScrCmd_SetVar                                  ; 041
	.word ScrCmd_CopyVar                                 ; 042
	.word ScrCmd_SetOrCopyVar                            ; 043
	.word ScrCmd_NonNPCMsg                               ; 044
	.word ScrCmd_NPCMsg                                  ; 045
	.word ScrCmd_NonNpcMsgVar                            ; 046
	.word ScrCmd_NpcMsgVar                               ; 047
	.word ScrCmd_048                                     ; 048
	.word ScrCmd_WaitButton                              ; 049
	.word ScrCmd_WaitButtonOrWalkAway                    ; 050
	.word ScrCmd_WaitButtonOrDpad                        ; 051
	.word ScrCmd_OpenMsg                                 ; 052
	.word ScrCmd_CloseMsg                                ; 053
	.word ScrCmd_HoldMsg                                 ; 054
	.word ScrCmd_DirectionSignpost                       ; 055
	.word ScrCmd_055                                     ; 056
	.word ScrCmd_057                                     ; 057
	.word ScrCmd_058                                     ; 058
	.word ScrCmd_TrainerTips                             ; 059
	.word ScrCmd_060                                     ; 060
	.word ScrCmd_061                                     ; 061
	.word ScrCmd_062                                     ; 062
	.word ScrCmd_YesNo                                     ; 063
	.word ScrCmd_064                                     ; 064
	.word ScrCmd_065                                     ; 065
	.word ScrCmd_066                                     ; 066
	.word ScrCmd_067                                     ; 067
	.word ScrCmd_068                                     ; 068
	.word ScrCmd_069                                     ; 069
	.word ScrCmd_070                                     ; 070
	.word ScrCmd_071                                     ; 071
	.word ScrCmd_072                                     ; 072
	.word ScrCmd_PlaySE                                  ; 073
	.word ScrCmd_StopSE                                  ; 074
	.word ScrCmd_WaitSE                                  ; 075
	.word ScrCmd_PlayCry                                 ; 076
	.word ScrCmd_WaitCry                                 ; 077
	.word ScrCmd_PlayFanfare                             ; 078
	.word ScrCmd_WaitFanfare                             ; 079
	.word ScrCmd_PlayBGM                                 ; 080
	.word ScrCmd_081                                     ; 081
	.word ScrCmd_ResetBGM                                ; 082
	.word ScrCmd_083                                     ; 083
	.word ScrCmd_FadeOutBGM                              ; 084
	.word ScrCmd_085                                     ; 085
	.word ScrCmd_086                                     ; 086
	.word ScrCmd_TempBGM                                 ; 087
	.word ScrCmd_088                                     ; 088
	.word ScrCmd_ChatotHasCry                            ; 089
	.word ScrCmd_ChatotStartRecording                    ; 090
	.word ScrCmd_ChatotStopRecording                     ; 091
	.word ScrCmd_ChatotSaveRecording                     ; 092
	.word ScrCmd_093                                     ; 093
	.word ScrCmd_ApplyMovement                           ; 094
	.word ScrCmd_WaitMovement                            ; 095
	.word ScrCmd_LockAll                                 ; 096
	.word ScrCmd_ReleaseAll                              ; 097
	.word ScrCmd_098                                     ; 098
	.word ScrCmd_099                                     ; 099
	.word ScrCmd_ShowPerson                              ; 100
	.word ScrCmd_HidePerson                              ; 101
	.word ScrCmd_102                                     ; 102
	.word ScrCmd_103                                     ; 103
	.word ScrCmd_FacePlayer                              ; 104
	.word ScrCmd_GetPlayerCoords                         ; 105
	.word ScrCmd_GetPersonCoords                         ; 106
	.word ScrCmd_107                                     ; 107
	.word ScrCmd_108                                     ; 108
	.word ScrCmd_109                                     ; 109
	.word ScrCmd_AddMoney                                ; 110
	.word ScrCmd_SubMoneyImmediate                       ; 111
	.word ScrCmd_HasEnoughMoneyImmediate                 ; 112
	.word ScrCmd_ShowMoneyBox                            ; 113
	.word ScrCmd_HideMoneyBox                            ; 114
	.word ScrCmd_UpdateMoneyBox                          ; 115
	.word ScrCmd_116                                     ; 116
	.word ScrCmd_117                                     ; 117
	.word ScrCmd_118                                     ; 118
	.word ScrCmd_GetCoinAmount                           ; 119
	.word ScrCmd_GiveCoins                               ; 120
	.word ScrCmd_TakeCoins                               ; 121
	.word ScrCmd_GiveAthletePoints                       ; 122
	.word ScrCmd_TakeAthletePoints                       ; 123
	.word ScrCmd_CheckAthletePoints                      ; 124
	.word ScrCmd_GiveItem                                ; 125
	.word ScrCmd_TakeItem                                ; 126
	.word ScrCmd_HasSpaceForItem                         ; 127
	.word ScrCmd_HasItem                                 ; 128
	.word ScrCmd_ItemIsTMOrHM                            ; 129
	.word ScrCmd_GetItemPocket                           ; 130
	.word ScrCmd_SetStarterChoice                        ; 131
	.word ScrCmd_GenderMsgbox                            ; 132
	.word ScrCmd_GetSealQuantity                         ; 133
	.word ScrCmd_GiveOrTakeSeal                          ; 134
	.word ScrCmd_GiveRandomSeal                          ; 135
	.word ScrCmd_136                                     ; 136
	.word ScrCmd_GiveMon                                 ; 137
	.word ScrCmd_GiveEgg                                 ; 138
	.word ScrCmd_SetMonMove                              ; 139
	.word ScrCmd_MonHasMove                              ; 140
	.word ScrCmd_GetPartySlotWithMove                    ; 141
	.word ScrCmd_GetPhoneBookRematch                     ; 142
	.word ScrCmd_NameRival                               ; 143
	.word ScrCmd_GetFriendSprite                         ; 144
	.word ScrCmd_RegisterPokegearCard                    ; 145
	.word ScrCmd_RegisterGearNumber                      ; 146
	.word ScrCmd_CheckRegisteredPhoneNumber              ; 147
	.word ScrCmd_148                                     ; 148
	.word ScrCmd_149                                     ; 149
	.word ScrCmd_150                                     ; 150
	.word ScrCmd_151                                     ; 151
	.word ScrCmd_152                                     ; 152
	.word ScrCmd_153                                     ; 153
	.word ScrCmd_154                                     ; 154
	.word ScrCmd_155                                     ; 155
	.word ScrCmd_156                                     ; 156
	.word ScrCmd_TownMap                                 ; 157
	.word ScrCmd_158                                     ; 158
	.word ScrCmd_159                                     ; 159
	.word ScrCmd_160                                     ; 160
	.word ScrCmd_161                                     ; 161
	.word ScrCmd_162                                     ; 162
	.word ScrCmd_HOF_Credits                             ; 163
	.word ScrCmd_164                                     ; 164
	.word ScrCmd_165                                     ; 165
	.word ScrCmd_166                                     ; 166
	.word ScrCmd_ChooseStarter                           ; 167
	.word ScrCmd_GetTrainerPathToPlayer                  ; 168
	.word ScrCmd_TrainerStepTowardsPlayer                ; 169
	.word ScrCmd_GetTrainerEyeType                       ; 170
	.word ScrCmd_GetEyeTrainerNum                        ; 171
	.word ScrCmd_NamePlayer                                     ; 172
	.word ScrCmd_NicknameInput                           ; 173
	.word ScrCmd_FadeScreen                              ; 174
	.word ScrCmd_WaitFade                                ; 175
	.word ScrCmd_Warp                                    ; 176
	.word ScrCmd_RockClimb                               ; 177
	.word ScrCmd_Surf                                    ; 178
	.word ScrCmd_Waterfall                               ; 179
	.word ScrCmd_180                                     ; 180
	.word ScrCmd_FlashEffect                                     ; 181
	.word ScrCmd_Whirlpool                                     ; 182
	.word ScrCmd_183                                     ; 183
	.word ScrCmd_PlayerOnBikeCheck                       ; 184
	.word ScrCmd_PlayerOnBikeSet                         ; 185
	.word ScrCmd_186                                     ; 186
	.word ScrCmd_GetPlayerState                          ; 187
	.word ScrCmd_SetAvatarBits                           ; 188
	.word ScrCmd_UpdateAvatarState                       ; 189
	.word ScrCmd_BufferPlayersName                       ; 190
	.word ScrCmd_BufferRivalsName                        ; 191
	.word ScrCmd_BufferFriendsName                       ; 192
	.word ScrCmd_BufferMonSpeciesName                    ; 193
	.word ScrCmd_BufferItemName                          ; 194
	.word ScrCmd_BufferPocketName                        ; 195
	.word ScrCmd_BufferTMHMMoveName                      ; 196
	.word ScrCmd_BufferMoveName                          ; 197
	.word ScrCmd_BufferInt                               ; 198
	.word ScrCmd_BufferPartyMonNick                      ; 199
	.word ScrCmd_BufferTrainerClassName                  ; 200
	.word ScrCmd_BufferPlayerUnionAvatarClassName        ; 201
	.word ScrCmd_BufferSpeciesName                       ; 202
	.word ScrCmd_BufferStarterSpeciesName                ; 203
	.word ScrCmd_BufferDPPtRivalStarterSpeciesName       ; 204
	.word ScrCmd_BufferDPPtFriendStarterSpeciesName      ; 205
	.word ScrCmd_GetStarterChoice                        ; 206
	.word ScrCmd_BufferDecorationName                    ; 207
	.word ScrCmd_208                                     ; 208
	.word ScrCmd_209                                     ; 209
	.word ScrCmd_BufferMapSecName                        ; 210
	.word ScrCmd_211                                     ; 211
	.word ScrCmd_GetTrainerNum                           ; 212
	.word ScrCmd_TrainerBattle                           ; 213
	.word ScrCmd_TrainerMessage                          ; 214
	.word ScrCmd_GetTrainerMsgParams                     ; 215
	.word ScrCmd_GetRematchMsgParams                     ; 216
	.word ScrCmd_TrainerIsDoubleBattle                   ; 217
	.word ScrCmd_EncounterMusic                          ; 218
	.word ScrCmd_WhiteOut                                ; 219
	.word ScrCmd_CheckBattleWon                          ; 220
	.word ScrCmd_221                                     ; 221
	.word ScrCmd_PartyCheckForDouble                     ; 222
	.word ScrCmd_223                                     ; 223
	.word ScrCmd_224                                     ; 224
	.word ScrCmd_225                                     ; 225
	.word ScrCmd_226                                     ; 226
	.word ScrCmd_227                                     ; 227
	.word ScrCmd_228                                     ; 228
	.word ScrCmd_229                                     ; 229
	.word ScrCmd_230                                     ; 230
	.word ScrCmd_231                                     ; 231
	.word ScrCmd_232                                     ; 232
	.word ScrCmd_233                                     ; 233
	.word ScrCmd_234                                     ; 234
	.word ScrCmd_235                                     ; 235
	.word ScrCmd_236                                     ; 236
	.word ScrCmd_237                                     ; 237
	.word ScrCmd_PartyHasPokerus                         ; 238
	.word ScrCmd_MonGetGender                            ; 239
	.word ScrCmd_SetDynamicWarp                          ; 240
	.word ScrCmd_GetDynamicWarpFloorNo                   ; 241
	.word ScrCmd_ElevatorCurFloorBox                     ; 242
	.word ScrCmd_CountJohtoDexSeen                       ; 243
	.word ScrCmd_CountJohtoDexOwned                      ; 244
	.word ScrCmd_CountNationalDexSeen                    ; 245
	.word ScrCmd_CountNationalDexOwned                   ; 246
	.word ScrCmd_247                                     ; 247
	.word ScrCmd_GetDexEvalResult                        ; 248
	.word ScrCmd_RocketTrapBattle                                     ; 249
	.word ScrCmd_250                                     ; 250
	.word ScrCmd_CatchingTutorial                        ; 251
	.word ScrCmd_252                                     ; 252
	.word ScrCmd_GetSaveFileState                        ; 253
	.word ScrCmd_SaveGameNormal                          ; 254
	.word ScrCmd_255                                     ; 255
	.word ScrCmd_256                                     ; 256
	.word ScrCmd_257                                     ; 257
	.word ScrCmd_258                                     ; 258
	.word ScrCmd_259                                     ; 259
	.word ScrCmd_260                                     ; 260
	.word ScrCmd_261                                     ; 261
	.word ScrCmd_262                                     ; 262
	.word ScrCmd_263                                     ; 263
	.word ScrCmd_264                                     ; 264
	.word ScrCmd_265                                     ; 265
	.word ScrCmd_266                                     ; 266
	.word ScrCmd_267                                     ; 267
	.word ScrCmd_268                                     ; 268
	.word ScrCmd_269                                     ; 269
	.word ScrCmd_270                                     ; 270
	.word ScrCmd_271                                     ; 271
	.word ScrCmd_272                                     ; 272
	.word ScrCmd_273                                     ; 273
	.word ScrCmd_274                                     ; 274
	.word ScrCmd_MartBuy                                 ; 275
	.word ScrCmd_SpecialMartBuy                          ; 276
	.word ScrCmd_DecorationMart                          ; 277
	.word ScrCmd_SealMart                                ; 278
	.word ScrCmd_OverworldWhiteOut                       ; 279
	.word ScrCmd_SetSpawn                                ; 280
	.word ScrCmd_GetPlayerGender                         ; 281
	.word ScrCmd_HealParty                               ; 282
	.word ScrCmd_283                                     ; 283
	.word ScrCmd_284                                     ; 284
	.word ScrCmd_285                                     ; 285
	.word ScrCmd_286                                     ; 286
	.word ScrCmd_287                                     ; 287
	.word ScrCmd_288                                     ; 288
	.word ScrCmd_289                                     ; 289
	.word ScrCmd_CheckPokedex                            ; 290
	.word ScrCmd_GivePokedex                             ; 291
	.word ScrCmd_CheckRunningShoes                       ; 292
	.word ScrCmd_GiveRunningShoes                        ; 293
	.word ScrCmd_CheckBadge                              ; 294
	.word ScrCmd_GiveBadge                               ; 295
	.word ScrCmd_CountBadges                             ; 296
	.word ScrCmd_297                                     ; 297
	.word ScrCmd_298                                     ; 298
	.word ScrCmd_CheckEscortMode                         ; 299
	.word ScrCmd_SetEscortMode                           ; 300
	.word ScrCmd_ClearEscortMode                         ; 301
	.word ScrCmd_302                                     ; 302
	.word ScrCmd_303                                     ; 303
	.word ScrCmd_304                                     ; 304
	.word ScrCmd_305                                     ; 305
	.word ScrCmd_306                                     ; 306
	.word ScrCmd_307                                     ; 307
	.word ScrCmd_308                                     ; 308
	.word ScrCmd_309                                     ; 309
	.word ScrCmd_310                                     ; 310
	.word ScrCmd_311                                     ; 311
	.word ScrCmd_BufferDayCareMonNicks                   ; 312
	.word ScrCmd_GetDayCareState                         ; 313
	.word ScrCmd_EcruteakGymInit                         ; 314
	.word ScrCmd_315                                     ; 315
	.word ScrCmd_316                                     ; 316
	.word ScrCmd_317                                     ; 317
	.word ScrCmd_CianwoodGymInit                         ; 318
	.word ScrCmd_CianwoodGymTurnWinch                    ; 319
	.word ScrCmd_VermilionGymInit                        ; 320
	.word ScrCmd_VermilionGymLockAction                  ; 321
	.word ScrCmd_VermilionGymCanCheck                    ; 322
	.word ScrCmd_ResampleVermilionGymCans                ; 323
	.word ScrCmd_VioletGymInit                           ; 324
	.word ScrCmd_VioletGymElevator                                     ; 325
	.word ScrCmd_AzaleaGymInit                           ; 326
	.word ScrCmd_AzaleaGymSpinarak                       ; 327
	.word ScrCmd_AzaleaGymSwitch                         ; 328
	.word ScrCmd_BlackthornGymInit                       ; 329
	.word ScrCmd_FuchsiaGymInit                          ; 330
	.word ScrCmd_ViridianGymInit                         ; 331
	.word ScrCmd_GetPartyCount                           ; 332
	.word ScrCmd_333                                     ; 333
	.word ScrCmd_334                                     ; 334
	.word ScrCmd_335                                     ; 335
	.word ScrCmd_BufferBerryName                         ; 336
	.word ScrCmd_BufferNatureName                        ; 337
	.word ScrCmd_MovePerson                                     ; 338
	.word ScrCmd_MovePersonFacing                              ; 339
	.word ScrCmd_SetObjectMovementType                   ; 340
	.word ScrCmd_SetObjectFacing                                     ; 341
	.word ScrCmd_MoveWarp                                     ; 342
	.word ScrCmd_MoveBgEvent                                     ; 343
	.word ScrCmd_344                                     ; 344
	.word ScrCmd_AddWaitingIcon                                     ; 345
	.word ScrCmd_RemoveWaitingIcon                                     ; 346
	.word ScrCmd_347                                     ; 347
	.word ScrCmd_WaitButtonOrDelay                       ; 348
	.word ScrCmd_PartySelectUI                           ; 349
	.word ScrCmd_350                                     ; 350
	.word ScrCmd_PartySelect                             ; 351
	.word ScrCmd_ChooseMoveUI                            ; 352
	.word ScrCmd_GetMoveSelection                        ; 353
	.word ScrCmd_GetPartyMonSpecies                      ; 354
	.word ScrCmd_PartymonIsMine                          ; 355
	.word ScrCmd_PartyCountNotEgg                        ; 356
	.word ScrCmd_CountAliveMons                          ; 357
	.word ScrCmd_CountAliveMonsAndPC                     ; 358
	.word ScrCmd_PartyCountEgg                           ; 359
	.word ScrCmd_SubMoneyVar                             ; 360
	.word ScrCmd_RetrieveDayCareMon                      ; 361
	.word ScrCmd_GiveLoanMon                             ; 362
	.word ScrCmd_CheckReturnLoanMon                      ; 363
	.word ScrCmd_TakeMon                                 ; 364
	.word ScrCmd_ResetDayCareEgg                         ; 365
	.word ScrCmd_GiveDayCareEgg                          ; 366
	.word ScrCmd_BufferDayCareWithdrawCost               ; 367
	.word ScrCmd_HasEnoughMoneyVar                       ; 368
	.word ScrCmd_EggHatchAnim                            ; 369
	.word ScrCmd_370                                     ; 370
	.word ScrCmd_BufferDayCareMonGrowth                  ; 371
	.word ScrCmd_GetTailDayCareMonSpeciesAndNick         ; 372
	.word ScrCmd_PutMonInDayCare                         ; 373
	.word ScrCmd_374                                     ; 374
	.word ScrCmd_375                                     ; 375
	.word ScrCmd_376                                     ; 376
	.word ScrCmd_377                                     ; 377
	.word ScrCmd_378                                     ; 378
	.word ScrCmd_379                                     ; 379
	.word ScrCmd_Random                                  ; 380
	.word ScrCmd_381                                     ; 381
	.word ScrCmd_MonGetFriendship                        ; 382
	.word ScrCmd_MonAddFriendship                        ; 383
	.word ScrCmd_MonSubtractFriendship                   ; 384
	.word ScrCmd_BufferDayCareMonStats                   ; 385
	.word ScrCmd_GetPlayerFacing                         ; 386
	.word ScrCmd_GetDayCareCompatibility                 ; 387
	.word ScrCmd_CheckDayCareEgg                         ; 388
	.word ScrCmd_PlayerHasSpecies                        ; 389
	.word ScrCmd_SizeRecordCompare                       ; 390
	.word ScrCmd_SizeRecordUpdate                        ; 391
	.word ScrCmd_BufferMonSize                           ; 392
	.word ScrCmd_BufferRecordSize                        ; 393
	.word ScrCmd_394                                     ; 394
	.word ScrCmd_395                                     ; 395
	.word ScrCmd_CountMonMoves                           ; 396
	.word ScrCmd_MonForgetMove                           ; 397
	.word ScrCmd_MonGetMove                              ; 398
	.word ScrCmd_BufferPartyMonMoveName                  ; 399
	.word ScrCmd_StrengthFlagAction                      ; 400
	.word ScrCmd_FlashAction                             ; 401
	.word ScrCmd_DefogAction                             ; 402
	.word ScrCmd_403                                     ; 403
	.word ScrCmd_404                                     ; 404
	.word ScrCmd_405                                     ; 405
	.word ScrCmd_406                                     ; 406
	.word ScrCmd_407                                     ; 407
	.word ScrCmd_408                                     ; 408
	.word ScrCmd_409                                     ; 409
	.word ScrCmd_410                                     ; 410
	.word ScrCmd_411                                     ; 411
	.word ScrCmd_412                                     ; 412
	.word ScrCmd_413                                     ; 413
	.word ScrCmd_414                                     ; 414
	.word ScrCmd_415                                     ; 415
	.word ScrCmd_416                                     ; 416
	.word ScrCmd_417                                     ; 417
	.word ScrCmd_418                                     ; 418
	.word ScrCmd_419                                     ; 419
	.word ScrCmd_420                                     ; 420
	.word ScrCmd_421                                     ; 421
	.word ScrCmd_422                                     ; 422
	.word ScrCmd_CheckJohtoDexComplete                   ; 423
	.word ScrCmd_CheckNationalDexComplete                ; 424
	.word ScrCmd_425                                     ; 425
	.word ScrCmd_KenyaCheck                              ; 426
	.word ScrCmd_427                                     ; 427
	.word ScrCmd_MonGiveMail                             ; 428
	.word ScrCmd_CountFossils                            ; 429
	.word ScrCmd_SetPhoneCall                            ; 430
	.word ScrCmd_RunPhoneCall                            ; 431
	.word ScrCmd_GetFossilPokemon                        ; 432
	.word ScrCmd_GetFossilMinimumAmount                  ; 433
	.word ScrCmd_PartyCountMonsAtOrBelowLevel            ; 434
	.word ScrCmd_SurvivePoisoning                        ; 435
	.word ScrCmd_436                                     ; 436
	.word ScrCmd_DebugWatch                              ; 437
	.word ScrCmd_GetStdMsgNaix                           ; 438
	.word ScrCmd_NonNpcMsgExtern                         ; 439
	.word ScrCmd_MsgboxExtern                            ; 440
	.word ScrCmd_441                                     ; 441
	.word ScrCmd_442                                     ; 442
	.word ScrCmd_443                                     ; 443
	.word ScrCmd_444                                     ; 444
	.word ScrCmd_445                                     ; 445
	.word ScrCmd_446                                     ; 446
	.word ScrCmd_SafariZoneAction                        ; 447
	.word ScrCmd_448                                     ; 448
	.word ScrCmd_449                                     ; 449
	.word ScrCmd_450                                     ; 450
	.word ScrCmd_451                                     ; 451
	.word ScrCmd_452                                     ; 452
	.word ScrCmd_453                                     ; 453
	.word ScrCmd_454                                     ; 454
	.word ScrCmd_455                                     ; 455
	.word ScrCmd_456                                     ; 456
	.word ScrCmd_MonGetNature                            ; 457
	.word ScrCmd_GetPartySlotWithNature                  ; 458
	.word ScrCmd_459                                     ; 459
	.word ScrCmd_LoadPhoneDat                            ; 460
	.word ScrCmd_GetPhoneContactMsgIds                   ; 461
	.word ScrCmd_462                                     ; 462
	.word ScrCmd_EnableMassOutbreaks                     ; 463
	.word ScrCmd_CreateRoamer                            ; 464
	.word ScrCmd_465                                     ; 465
	.word ScrCmd_466                                     ; 466
	.word ScrCmd_MoveRelearnerInit                       ; 467
	.word ScrCmd_MoveTutorInit                           ; 468
	.word ScrCmd_MoveRelearnerGetResult                  ; 469
	.word ScrCmd_LoadNPCTrade                            ; 470
	.word ScrCmd_GetOfferedSpecies                       ; 471
	.word ScrCmd_NPCTradeGetReqSpecies                   ; 472
	.word ScrCmd_NPCTradeExec                            ; 473
	.word ScrCmd_NPCTradeEnd                             ; 474
	.word ScrCmd_475                                     ; 475
	.word ScrCmd_476                                     ; 476
	.word ScrCmd_NatDexFlagAction                        ; 477
	.word ScrCmd_MonGetRibbonCount                       ; 478
	.word ScrCmd_GetPartyRibbonCount                     ; 479
	.word ScrCmd_MonHasRibbon                            ; 480
	.word ScrCmd_GiveRibbon                              ; 481
	.word ScrCmd_BufferRibbonName                        ; 482
	.word ScrCmd_GetEVTotal                              ; 483
	.word ScrCmd_GetWeekday                              ; 484
	.word ScrCmd_485                                     ; 485
	.word ScrCmd_Dummy                                   ; 486
	.word ScrCmd_PokeCenAnim                             ; 487
	.word ScrCmd_ElevatorAnim                            ; 488
	.word ScrCmd_MysteryGift                             ; 489
	.word ScrCmd_NopVar490                               ; 490
	.word ScrCmd_491                                     ; 491
	.word ScrCmd_492                                     ; 492
	.word ScrCmd_PromptEasyChat                          ; 493
	.word ScrCmd_494                                     ; 494
	.word ScrCmd_GetGameVersion                          ; 495
	.word ScrCmd_GetPartyLead                            ; 496
	.word ScrCmd_GetMonTypes                             ; 497
	.word ScrCmd_PrimoPasswordCheck1                     ; 498
	.word ScrCmd_PrimoPasswordCheck2                     ; 499
	.word ScrCmd_500                                     ; 500
	.word ScrCmd_501                                     ; 501
	.word ScrCmd_502                                     ; 502
	.word ScrCmd_LotoIdGet                               ; 503
	.word ScrCmd_LotoIdSearch                            ; 504
	.word ScrCmd_LotoIdSet                               ; 505
	.word ScrCmd_BufferBoxMonNick                        ; 506
	.word ScrCmd_CountPCEmptySpace                       ; 507
	.word ScrCmd_508                                     ; 508
	.word ScrCmd_509                                     ; 509
	.word ScrCmd_510                                     ; 510
	.word ScrCmd_511                                     ; 511
	.word ScrCmd_PlayerMovementSavingSet                 ; 512
	.word ScrCmd_PlayerMovementSavingClear               ; 513
	.word ScrCmd_HallOfFameAnim                          ; 514
	.word ScrCmd_AddSpecialGameStat                      ; 515
	.word ScrCmd_BufferFashionName                       ; 516
	.word ScrCmd_517                                     ; 517
	.word ScrCmd_518                                     ; 518
	.word ScrCmd_519                                     ; 519
	.word ScrCmd_520                                     ; 520
	.word ScrCmd_521                                     ; 521
	.word ScrCmd_522                                     ; 522
	.word ScrCmd_523                                     ; 523
	.word ScrCmd_524                                     ; 524
	.word ScrCmd_525                                     ; 525
	.word ScrCmd_526                                     ; 526
	.word ScrCmd_527                                     ; 527
	.word ScrCmd_528                                     ; 528
	.word ScrCmd_GetPartyLeadAlive                       ; 529
	.word ScrCmd_530                                     ; 530
	.word ScrCmd_BufferBackgroundName                    ; 531
	.word ScrCmd_CheckCoinsImmediate                     ; 532
	.word ScrCmd_CheckGiveCoins                          ; 533
	.word ScrCmd_534                                     ; 534
	.word ScrCmd_MonGetLevel                             ; 535
	.word ScrCmd_536                                     ; 536
	.word ScrCmd_537                                     ; 537
	.word ScrCmd_538                                     ; 538
	.word ScrCmd_539                                     ; 539
	.word ScrCmd_540                                     ; 540
	.word ScrCmd_BufferIntEx                             ; 541
	.word ScrCmd_MonGetContestValue                      ; 542
	.word ScrCmd_543                                     ; 543
	.word ScrCmd_544                                     ; 544
	.word ScrCmd_545                                     ; 545
	.word ScrCmd_546                                     ; 546
	.word ScrCmd_547                                     ; 547
	.word ScrCmd_548                                     ; 548
	.word ScrCmd_549                                     ; 549
	.word ScrCmd_550                                     ; 550
	.word ScrCmd_551                                     ; 551
	.word ScrCmd_552                                     ; 552
	.word ScrCmd_553                                     ; 553
	.word ScrCmd_554                                     ; 554
	.word ScrCmd_555                                     ; 555
	.word ScrCmd_556                                     ; 556
	.word ScrCmd_CheckBattlePoints                       ; 557
	.word ScrCmd_558                                     ; 558
	.word ScrCmd_559                                     ; 559
	.word ScrCmd_560                                     ; 560
	.word ScrCmd_561                                     ; 561
	.word ScrCmd_MultiBattle                             ; 562
	.word ScrCmd_563                                     ; 563
	.word ScrCmd_564                                     ; 564
	.word ScrCmd_565                                     ; 565
	.word ScrCmd_566                                     ; 566
	.word ScrCmd_GetDPPlPrizeItemIdAndCost               ; 567
	.word ScrCmd_568                                     ; 568
	.word ScrCmd_569                                     ; 569
	.word ScrCmd_CheckCoinsVar                           ; 570
	.word ScrCmd_571                                     ; 571
	.word ScrCmd_572                                     ; 572
	.word ScrCmd_573                                     ; 573
	.word ScrCmd_574                                     ; 574
	.word ScrCmd_575                                     ; 575
	.word ScrCmd_576                                     ; 576
	.word ScrCmd_577                                     ; 577
	.word ScrCmd_578                                     ; 578
	.word ScrCmd_579                                     ; 579
	.word ScrCmd_BufferSealName                          ; 580
	.word ScrCmd_LockLastTalked                          ; 581
	.word ScrCmd_582                                     ; 582
	.word ScrCmd_583                                     ; 583
	.word ScrCmd_PartyLegalCheck                         ; 584
	.word ScrCmd_585                                     ; 585
	.word ScrCmd_586                                     ; 586
	.word ScrCmd_587                                     ; 587
	.word ScrCmd_588                                     ; 588
	.word ScrCmd_WildBattle                              ; 589
	.word ScrCmd_GetTrcardStars                          ; 590
	.word ScrCmd_591                                     ; 591
	.word ScrCmd_592                                     ; 592
	.word ScrCmd_ShowSaveStats                           ; 593
	.word ScrCmd_HideSaveStats                           ; 594
	.word ScrCmd_595                                     ; 595
	.word ScrCmd_596                                     ; 596
	.word ScrCmd_597                                     ; 597
	.word ScrCmd_598                                     ; 598
	.word ScrCmd_599                                     ; 599
	.word ScrCmd_600                                     ; 600
	.word ScrCmd_FollowPokeFacePlayer                    ; 601
	.word ScrCmd_602                                     ; 602
	.word ScrCmd_603                                     ; 603
	.word ScrCmd_604                                     ; 604
	.word ScrCmd_605                                     ; 605
	.word ScrCmd_606                                     ; 606
	.word ScrCmd_607                                     ; 607
	.word ScrCmd_608                                     ; 608
	.word ScrCmd_609                                     ; 609
	.word ScrCmd_610                                     ; 610
	.word ScrCmd_Pokeathlon                              ; 611
	.word ScrCmd_GetNpcTradeUnusedFlag                   ; 612
	.word ScrCmd_GetPhoneContactRandomGiftBerry          ; 613
	.word ScrCmd_GetPhoneContactGiftItem                 ; 614
	.word ScrCmd_CameronPhoto                            ; 615
	.word ScrCmd_616                                     ; 616
	.word ScrCmd_617                                     ; 617
	.word ScrCmd_PhotoAlbumIsFull                        ; 618
	.word ScrCmd_RocketCostumeFlagCheck                  ; 619
	.word ScrCmd_RocketCostumeFlagAction                 ; 620
	.word ScrCmd_621                                     ; 621
	.word ScrCmd_622                                     ; 622
	.word ScrCmd_AnimApricornTree                        ; 623
	.word ScrCmd_ApricornTreeGetApricorn                 ; 624
	.word ScrCmd_GiveApricornFromTree                    ; 625
	.word ScrCmd_BufferApricornName                      ; 626
	.word ScrCmd_627                                     ; 627
	.word ScrCmd_628                                     ; 628
	.word ScrCmd_629                                     ; 629
	.word ScrCmd_630                                     ; 630
	.word ScrCmd_631                                     ; 631
	.word ScrCmd_CountPartyMonsOfSpecies                 ; 632
	.word ScrCmd_633                                     ; 633
	.word ScrCmd_634                                     ; 634
	.word ScrCmd_635                                     ; 635
	.word ScrCmd_636                                     ; 636
	.word ScrCmd_637                                     ; 637
	.word ScrCmd_638                                     ; 638
	.word ScrCmd_639                                     ; 639
	.word ScrCmd_640                                     ; 640
	.word ScrCmd_SaveWipeExtraChunks                     ; 641
	.word ScrCmd_642                                     ; 642
	.word ScrCmd_643                                     ; 643
	.word ScrCmd_644                                     ; 644
	.word ScrCmd_645                                     ; 645
	.word ScrCmd_646                                     ; 646
	.word ScrCmd_GetPartySlotWithSpecies                 ; 647
	.word ScrCmd_648                                     ; 648
	.word ScrCmd_ScratchOffCard                          ; 649
	.word ScrCmd_ScratchOffCardEnd                       ; 650
	.word ScrCmd_GetScratchOffPrize                      ; 651
	.word ScrCmd_652                                     ; 652
	.word ScrCmd_MoveTutorChooseMove                     ; 653
	.word ScrCmd_TutorMoveTeachInSlot                    ; 654
	.word ScrCmd_TutorMoveGetPrice                       ; 655
	.word ScrCmd_656                                     ; 656
	.word ScrCmd_StatJudge                               ; 657
	.word ScrCmd_BufferStatName                          ; 658
	.word ScrCmd_SetMonForme                             ; 659
	.word ScrCmd_BufferTrainerName                       ; 660
	.word ScrCmd_661                                     ; 661
	.word ScrCmd_662                                     ; 662
	.word ScrCmd_663                                     ; 663
	.word ScrCmd_664                                     ; 664
	.word ScrCmd_665                                     ; 665
	.word ScrCmd_666                                     ; 666
	.word ScrCmd_667                                     ; 667
	.word ScrCmd_BufferTypeName                          ; 668
	.word ScrCmd_GetItemQuantity                         ; 669
	.word ScrCmd_GetHiddenPowerType                      ; 670
	.word ScrCmd_671                                     ; 671
	.word ScrCmd_672                                     ; 672
	.word ScrCmd_GetOwnedRotomFormes                     ; 673
	.word ScrCmd_CountTranformedRotomsInParty            ; 674
	.word ScrCmd_UpdateRotomForme                        ; 675
	.word ScrCmd_GetPartyMonForme                        ; 676
	.word ScrCmd_677                                     ; 677
	.word ScrCmd_678                                     ; 678
	.word ScrCmd_679                                     ; 679
	.word ScrCmd_AddSpecialGameStat2                     ; 680
	.word ScrCmd_681                                     ; 681
	.word ScrCmd_682                                     ; 682
	.word ScrCmd_683                                     ; 683
	.word ScrCmd_684                                     ; 684
	.word ScrCmd_GetPlayerXYZ                            ; 685
	.word ScrCmd_686                                     ; 686
	.word ScrCmd_687                                     ; 687
	.word ScrCmd_GetPartySlotWithFatefulEncounter        ; 688
	.word ScrCmd_CommSanitizeParty                       ; 689
	.word ScrCmd_DayCareSanitizeMon                      ; 690
	.word ScrCmd_691                                     ; 691
	.word ScrCmd_BufferBattleHallStreak                  ; 692
	.word ScrCmd_BattleHallCountUsedSpecies              ; 693
	.word ScrCmd_BattleHallGetTotalStreak                ; 694
	.word ScrCmd_695                                     ; 695
	.word ScrCmd_696                                     ; 696
	.word ScrCmd_697                                     ; 697
	.word ScrCmd_FollowerPokeIsEventTrigger              ; 698
	.word ScrCmd_699                                     ; 699
	.word ScrCmd_700                                     ; 700
	.word ScrCmd_MonHasItem                              ; 701
	.word ScrCmd_702                                     ; 702
	.word ScrCmd_703                                     ; 703
	.word ScrCmd_704                                     ; 704
	.word ScrCmd_705                                     ; 705
	.word ScrCmd_706                                     ; 706
	.word ScrCmd_707                                     ; 707
	.word ScrCmd_708                                     ; 708
	.word ScrCmd_709                                     ; 709
	.word ScrCmd_710                                     ; 710
	.word ScrCmd_FollowPokeInteract                      ; 711
	.word ScrCmd_712                                     ; 712
	.word ScrCmd_AlphPuzzle                              ; 713
	.word ScrCmd_714                                     ; 714
	.word ScrCmd_UpdateDayCareMonObjects                 ; 715
	.word ScrCmd_716                                     ; 716
	.word ScrCmd_717                                     ; 717
	.word ScrCmd_718                                     ; 718
	.word ScrCmd_719                                     ; 719
	.word ScrCmd_720                                     ; 720
	.word ScrCmd_721                                     ; 721
	.word ScrCmd_722                                     ; 722
	.word ScrCmd_723                                     ; 723
	.word ScrCmd_724                                     ; 724
	.word ScrCmd_725                                     ; 725
	.word ScrCmd_726                                     ; 726
	.word ScrCmd_727                                     ; 727
	.word ScrCmd_728                                     ; 728
	.word ScrCmd_729                                     ; 729
	.word ScrCmd_730                                     ; 730
	.word ScrCmd_731                                     ; 731
	.word ScrCmd_732                                     ; 732
	.word ScrCmd_733                                     ; 733
	.word ScrCmd_734                                     ; 734
	.word ScrCmd_735                                     ; 735
	.word ScrCmd_736                                     ; 736
	.word ScrCmd_737                                     ; 737
	.word ScrCmd_738                                     ; 738
	.word ScrCmd_739                                     ; 739
	.word ScrCmd_740                                     ; 740
	.word ScrCmd_741                                     ; 741
	.word ScrCmd_742                                     ; 742
	.word ScrCmd_743                                     ; 743
	.word ScrCmd_744                                     ; 744
	.word ScrCmd_BufferPokeathlonCourseName              ; 745
	.word ScrCmd_TouchscreenMenuHide                     ; 746
	.word ScrCmd_TouchscreenMenuShow                     ; 747
	.word ScrCmd_GetMenuChoice                           ; 748
	.word ScrCmd_MenuInitStdGmm                          ; 749
	.word ScrCmd_MenuInit                                ; 750
	.word ScrCmd_MenuItemAdd                             ; 751
	.word ScrCmd_MenuExec                                ; 752
	.word ScrCmd_753                                     ; 753
	.word ScrCmd_754                                     ; 754
	.word ScrCmd_755                                     ; 755
	.word ScrCmd_756                                     ; 756
	.word ScrCmd_757                                     ; 757
	.word ScrCmd_758                                     ; 758
	.word ScrCmd_759                                     ; 759
	.word ScrCmd_760                                     ; 760
	.word ScrCmd_761                                     ; 761
	.word ScrCmd_762                                     ; 762
	.word ScrCmd_763                                     ; 763
	.word ScrCmd_764                                     ; 764
	.word ScrCmd_765                                     ; 765
	.word ScrCmd_766                                     ; 766
	.word ScrCmd_767                                     ; 767
	.word ScrCmd_768                                     ; 768
	.word ScrCmd_769                                     ; 769
	.word ScrCmd_770                                     ; 770
	.word ScrCmd_771                                     ; 771
	.word ScrCmd_772                                     ; 772
	.word ScrCmd_Cinematic                               ; 773
	.word ScrCmd_774                                     ; 774
	.word ScrCmd_775                                     ; 775
	.word ScrCmd_GiveTogepiEgg                           ; 776
	.word ScrCmd_777                                     ; 777
	.word ScrCmd_GiveSpikyEarPichu                       ; 778
	.word ScrCmd_RadioMusicIsPlaying                     ; 779
	.word ScrCmd_CasinoGame                              ; 780
	.word ScrCmd_KenyaCheckPartyOrMailbox                ; 781
	.word ScrCmd_MartSell                                ; 782
	.word ScrCmd_SetFollowPokeInhibitState               ; 783
	.word ScrCmd_ScriptOverlayCmd                        ; 784
	.word ScrCmd_BugContestAction                        ; 785
	.word ScrCmd_BufferBugContestWinner                  ; 786
	.word ScrCmd_JudgeBugContest                         ; 787
	.word ScrCmd_BufferBugContestMonNick                 ; 788
	.word ScrCmd_BugContestGetTimeLeft                   ; 789
	.word ScrCmd_IsBugContestantRegistered               ; 790
	.word ScrCmd_791                                     ; 791
	.word ScrCmd_792                                     ; 792
	.word ScrCmd_BankTransaction                         ; 793
	.word ScrCmd_CheckBankBalance                        ; 794
	.word ScrCmd_795                                     ; 795
	.word ScrCmd_796                                     ; 796
	.word ScrCmd_797                                     ; 797
	.word ScrCmd_BufferRulesetName                       ; 798
	.word ScrCmd_799                                     ; 799
	.word ScrCmd_800                                     ; 800
	.word ScrCmd_801                                     ; 801
	.word ScrCmd_802                                     ; 802
	.word ScrCmd_803                                     ; 803
	.word ScrCmd_804                                     ; 804
	.word ScrCmd_805                                     ; 805
	.word ScrCmd_806                                     ; 806
	.word ScrCmd_807                                     ; 807
	.word ScrCmd_808                                     ; 808
	.word ScrCmd_809                                     ; 809
	.word ScrCmd_810                                     ; 810
	.word ScrCmd_811                                     ; 811
	.word ScrCmd_812                                     ; 812
	.word ScrCmd_MomGiftCheck                            ; 813
	.word ScrCmd_814                                     ; 814
	.word ScrCmd_815                                     ; 815
	.word ScrCmd_UnownCircle                             ; 816
	.word ScrCmd_817                                     ; 817
	.word ScrCmd_MystriStageGymmickInit                  ; 818
	.word ScrCmd_819                                     ; 819
	.word ScrCmd_820                                     ; 820
	.word ScrCmd_GetBuenasPassword                       ; 821
	.word ScrCmd_822                                     ; 822
	.word ScrCmd_823                                     ; 823
	.word ScrCmd_824                                     ; 824
	.word ScrCmd_825                                     ; 825
	.word ScrCmd_826                                     ; 826
	.word ScrCmd_GetPartymonForme                        ; 827
	.word ScrCmd_MonAddContestValue                      ; 828
	.word ScrCmd_829                                     ; 829
	.word ScrCmd_830                                     ; 830
	.word ScrCmd_831                                     ; 831
	.word ScrCmd_832                                     ; 832
	.word ScrCmd_833                                     ; 833
	.word ScrCmd_834                                     ; 834
	.word ScrCmd_835                                     ; 835
	.word ScrCmd_836                                     ; 836
	.word ScrCmd_837                                     ; 837
	.word ScrCmd_BankOrWalletIsFull                      ; 838
	.word ScrCmd_839                                     ; 839
	.word ScrCmd_840                                     ; 840
	.word ScrCmd_841                                     ; 841
	.word ScrCmd_842                                     ; 842
	.word ScrCmd_BufferItemNameIndef                     ; 843
	.word ScrCmd_BufferItemNamePlural                    ; 844
	.word ScrCmd_BufferPartyMonSpeciesNameIndef          ; 845
	.word ScrCmd_BufferSpeciesNameIndef                  ; 846
	.word ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef ; 847
	.word ScrCmd_BufferFashionNameIndef                  ; 848
	.word ScrCmd_BufferTrainerClassNameIndef             ; 849
	.word ScrCmd_BufferSealNamePlural                    ; 850
	.word ScrCmd_Capitalize                              ; 851
	.word ScrCmd_BufferDeptStoreFloorNo                  ; 852
gScriptCmdTable_end:

	.text

	.public sub_02041770
	.public ScrCmd_AddSpecialGameStat2

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
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r1, r0, #0
	b _02046BA6
_02046B88:
	cmp r0, #2
	bne _02046B9E
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
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

	thumb_func_start ScrCmd_FollowPokeFacePlayer
ScrCmd_FollowPokeFacePlayer: ; 0x02046BDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02046CAC
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl FollowingPokemon_GetMapObject
	bl ov01_022055DC
	cmp r0, #0
	beq _02046C9C
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetPlayerAvatar
	bl PlayerAvatar_GetMapObject
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetPlayerAvatar
	bl PlayerAvatar_GetFacingDirection
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	lsl r5, r0, #1
	ldr r0, [sp, #0xc]
	bl MapObject_GetCurrentHeight
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	lsl r4, r0, #1
	ldr r0, [sp, #4]
	add r1, r6, r5
	add r0, #0x80
	ldr r0, [r0]
	add r2, r7, r4
	bl GetMetatileBehaviorAt
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
	thumb_func_end ScrCmd_FollowPokeFacePlayer

	thumb_func_start ScrCmd_602
ScrCmd_602: ; 0x02046CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02046CEA
	cmp r4, #0
	beq _02046CDE
	add r5, #0x80
	ldr r0, [r5]
	bl FollowingPokemon_GetMapObject
	bl MapObject_PauseMovement
	b _02046CEA
_02046CDE:
	add r5, #0x80
	ldr r0, [r5]
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
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
	bl FollowingPokemon_IsActive
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
	bl FollowingPokemon_IsActive
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
	bl FollowingPokemon_GetMapObject
	bl MapObject_IsMovementPaused
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
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02046DA2
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
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
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02046DF4
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FollowingPokemon_GetMapObject
	add r4, r0, #0
	bl FollowPokeObj_GetSpecies
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	bl GetFollowPokePermissionBySpeciesAndMap
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
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02046E32
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FollowingPokemon_GetMapObject
	bl FollowPokeObj_GetSpecies
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	bl GetFollowPokePermissionBySpeciesAndMap
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
	bl FollowingPokemon_IsActive
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
	bl FollowingPokemon_IsActive
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
	bl Fsys_GetSaveDataPtr
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
	bl Fsys_GetSaveDataPtr
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
	bl Fsys_GetSaveDataPtr
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
	bl Fsys_GetSaveDataPtr
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
	bl Fsys_GetGearPhoneRingManager
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
	bl Fsys_GetGearPhoneRingManager
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
	bl Fsys_GetGearPhoneRingManager
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
	bl Fsys_GetGearPhoneRingManager
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
	bl SaveData_GetMomsSavingsAddr
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
	bl Fsys_GetGearPhoneRingManager
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
	bl Fsys_GetGearPhoneRingManager
	bl sub_02092E10
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_GetMomsSavingsAddr
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
	bl Fsys_GetGearPhoneRingManager
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
	bl SaveData_GetMomsSavingsAddr
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
	bl MapObject_GetFacingDirection
	b _0204740E
_0204740C:
	mov r0, #0
_0204740E:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_622

	thumb_func_start ScrCmd_FollowPokeInteract
ScrCmd_FollowPokeInteract: ; 0x02047414
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl Fsys_FollowPokeInteract
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_FollowPokeInteract

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
	bl FollowingPokemon_IsActive
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
	bl FollowingPokemon_IsActive
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
	bl FsysUnkSub108_AddMonMood
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
	bl SaveData_GetMomsSavingsAddr
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
	bl SaveData_GetMomsSavingsAddr
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
	bl SaveData_GetMomsSavingsAddr
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
	bl SaveData_GetMomsSavingsAddr
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

	thumb_func_start ScrCmd_SetFollowPokeInhibitState
ScrCmd_SetFollowPokeInhibitState: ; 0x02047C64
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_FollowPoke_get
	ldrb r1, [r4]
	bl SavFollowPoke_SetInhibitFlagState
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_SetFollowPokeInhibitState

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
	bl SaveData_GetMomsSavingsAddr
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
	bl SetFlag99A
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

	thumb_func_start ScrCmd_MystriStageGymmickInit
ScrCmd_MystriStageGymmickInit: ; 0x02047E7C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl Fsys_InitMystriStageGymmick
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_MystriStageGymmickInit

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
	bl SafariZone_GetLinkLeaderToProfile
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
	bl SafariZone_DeactivateLinkIfExpired
	add r0, r5, #0
	bl SafariZone_IsCurrentlyLinked
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
