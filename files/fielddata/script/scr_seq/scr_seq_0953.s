#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0953.h"
#include "msgdata/msg/msg_0040.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0953_000
	ScrDef scr_seq_0953_001
	ScrDef scr_seq_0953_002
	ScrDef scr_seq_0953_003
	ScrDef scr_seq_0953_004
	ScrDef scr_seq_0953_005
	ScrDef scr_seq_0953_006
	ScrDef scr_seq_0953_007
	ScrDef scr_seq_0953_008
	ScrDef scr_seq_0953_009
	ScrDef scr_seq_0953_010
	ScrDef scr_seq_0953_011
	ScrDef scr_seq_0953_012
	ScrDef scr_seq_0953_013
	ScrDef scr_seq_0953_014
	ScrDef scr_seq_0953_015
	ScrDef scr_seq_0953_016
	ScrDef scr_seq_0953_017
	ScrDef scr_seq_0953_018
	ScrDef scr_seq_0953_019
	ScrDef scr_seq_0953_020
	ScrDef scr_seq_0953_021
	ScrDef scr_seq_0953_022
	ScrDef scr_seq_0953_023
	ScrDef scr_seq_0953_024
	ScrDef scr_seq_0953_025
	ScrDef scr_seq_0953_026
	ScrDef scr_seq_0953_027
	ScrDef scr_seq_0953_028
	ScrDef scr_seq_0953_029
	ScrDef scr_seq_0953_030
	ScrDef scr_seq_0953_031
	ScrDef scr_seq_0953_032
	ScrDef scr_seq_0953_033
	ScrDef scr_seq_0953_034
	ScrDef scr_seq_0953_035
	ScrDef scr_seq_0953_036
	ScrDef scr_seq_0953_037
	ScrDef scr_seq_0953_038
	ScrDef scr_seq_0953_039
	ScrDef scr_seq_0953_040
	ScrDef scr_seq_0953_041
	ScrDef scr_seq_0953_042
	ScrDef scr_seq_0953_043
	ScrDef scr_seq_0953_044
	ScrDef scr_seq_0953_045
	ScrDef scr_seq_0953_046
	ScrDef scr_seq_0953_047
	ScrDef scr_seq_0953_048
	ScrDef scr_seq_0953_049
	ScrDef scr_seq_0953_050
	ScrDef scr_seq_0953_051
	ScrDef scr_seq_0953_052
	ScrDef scr_seq_0953_053
	ScrDef scr_seq_0953_054
	ScrDef scr_seq_0953_055
	ScrDef scr_seq_0953_056
	ScrDef scr_seq_0953_057
	ScrDef scr_seq_0953_058
	ScrDef scr_seq_0953_059
	ScrDef scr_seq_0953_060
	ScrDef scr_seq_0953_061
	ScrDef scr_seq_0953_062
	ScrDef scr_seq_0953_063
	ScrDef scr_seq_0953_064
	ScrDef scr_seq_0953_065
	ScrDef scr_seq_0953_066
	ScrDef scr_seq_0953_067
	ScrDef scr_seq_0953_068
	ScrDef scr_seq_0953_069
	ScrDef scr_seq_0953_070
	ScrDef scr_seq_0953_071
	ScrDef scr_seq_0953_072
	ScrDef scr_seq_0953_073
	ScrDef scr_seq_0953_074
	ScrDef scr_seq_0953_075
	ScrDef scr_seq_0953_076
	ScrDef scr_seq_0953_077
	ScrDef scr_seq_0953_078
	ScrDef scr_seq_0953_079
	ScrDef scr_seq_0953_080
	ScrDef scr_seq_0953_081
	ScrDef scr_seq_0953_082
	ScrDef scr_seq_0953_083
	ScrDef scr_seq_0953_084
	ScrDef scr_seq_0953_085
	ScrDef scr_seq_0953_086
	ScrDef scr_seq_0953_087
	ScrDef scr_seq_0953_088
	ScrDef scr_seq_0953_089
	ScrDef scr_seq_0953_090
	ScrDef scr_seq_0953_091
	ScrDef scr_seq_0953_092
	ScrDef scr_seq_0953_093
	ScrDef scr_seq_0953_094
	ScrDef scr_seq_0953_095
	ScrDef scr_seq_0953_096
	ScrDef scr_seq_0953_097
	ScrDef scr_seq_0953_098
	ScrDef scr_seq_0953_099
	ScrDef scr_seq_0953_100
	ScrDef scr_seq_0953_101
	ScrDef scr_seq_0953_102
	ScrDef scr_seq_0953_103
	ScrDef scr_seq_0953_104
	ScrDef scr_seq_0953_105
	ScrDef scr_seq_0953_106
	ScrDef scr_seq_0953_107
	ScrDef scr_seq_0953_108
	ScrDef scr_seq_0953_109
	ScrDef scr_seq_0953_110
	ScrDef scr_seq_0953_111
	ScrDef scr_seq_0953_112
	ScrDef scr_seq_0953_113
	ScrDef scr_seq_0953_114
	ScrDef scr_seq_0953_115
	ScrDef scr_seq_0953_116
	ScrDef scr_seq_0953_117
	ScrDef scr_seq_0953_118
	ScrDef scr_seq_0953_119
	ScrDef scr_seq_0953_120
	ScrDef scr_seq_0953_121
	ScrDef scr_seq_0953_122
	ScrDef scr_seq_0953_123
	ScrDef scr_seq_0953_124
	ScrDef scr_seq_0953_125
	ScrDef scr_seq_0953_126
	ScrDef scr_seq_0953_127
	ScrDef scr_seq_0953_128
	ScrDef scr_seq_0953_129
	ScrDef scr_seq_0953_130
	ScrDef scr_seq_0953_131
	ScrDef scr_seq_0953_132
	ScrDef scr_seq_0953_133
	ScrDef scr_seq_0953_134
	ScrDef scr_seq_0953_135
	ScrDef scr_seq_0953_136
	ScrDef scr_seq_0953_137
	ScrDef scr_seq_0953_138
	ScrDef scr_seq_0953_139
	ScrDef scr_seq_0953_140
	ScrDef scr_seq_0953_141
	ScrDef scr_seq_0953_142
	ScrDef scr_seq_0953_143
	ScrDef scr_seq_0953_144
	ScrDef scr_seq_0953_145
	ScrDef scr_seq_0953_146
	ScrDef scr_seq_0953_147
	ScrDef scr_seq_0953_148
	ScrDef scr_seq_0953_149
	ScrDef scr_seq_0953_150
	ScrDef scr_seq_0953_151
	ScrDef scr_seq_0953_152
	ScrDef scr_seq_0953_153
	ScrDef scr_seq_0953_154
	ScrDef scr_seq_0953_155
	ScrDef scr_seq_0953_156
	ScrDef scr_seq_0953_157
	ScrDef scr_seq_0953_158
	ScrDef scr_seq_0953_159
	ScrDef scr_seq_0953_160
	ScrDef scr_seq_0953_161
	ScrDef scr_seq_0953_162
	ScrDef scr_seq_0953_163
	ScrDef scr_seq_0953_164
	ScrDef scr_seq_0953_165
	ScrDef scr_seq_0953_166
	ScrDef scr_seq_0953_167
	ScrDef scr_seq_0953_168
	ScrDef scr_seq_0953_169
	ScrDef scr_seq_0953_170
	ScrDef scr_seq_0953_171
	ScrDef scr_seq_0953_172
	ScrDef scr_seq_0953_173
	ScrDef scr_seq_0953_174
	ScrDef scr_seq_0953_175
	ScrDef scr_seq_0953_176
	ScrDef scr_seq_0953_177
	ScrDef scr_seq_0953_178
	ScrDef scr_seq_0953_179
	ScrDef scr_seq_0953_180
	ScrDef scr_seq_0953_181
	ScrDef scr_seq_0953_182
	ScrDef scr_seq_0953_183
	ScrDef scr_seq_0953_184
	ScrDef scr_seq_0953_185
	ScrDef scr_seq_0953_186
	ScrDef scr_seq_0953_187
	ScrDef scr_seq_0953_188
	ScrDef scr_seq_0953_189
	ScrDef scr_seq_0953_190
	ScrDef scr_seq_0953_191
	ScrDef scr_seq_0953_192
	ScrDef scr_seq_0953_193
	ScrDef scr_seq_0953_194
	ScrDef scr_seq_0953_195
	ScrDef scr_seq_0953_196
	ScrDef scr_seq_0953_197
	ScrDef scr_seq_0953_198
	ScrDef scr_seq_0953_199
	ScrDef scr_seq_0953_200
	ScrDef scr_seq_0953_201
	ScrDef scr_seq_0953_202
	ScrDef scr_seq_0953_203
	ScrDef scr_seq_0953_204
	ScrDef scr_seq_0953_205
	ScrDef scr_seq_0953_206
	ScrDef scr_seq_0953_207
	ScrDef scr_seq_0953_208
	ScrDef scr_seq_0953_209
	ScrDef scr_seq_0953_210
	ScrDef scr_seq_0953_211
	ScrDef scr_seq_0953_212
	ScrDef scr_seq_0953_213
	ScrDef scr_seq_0953_214
	ScrDef scr_seq_0953_215
	ScrDef scr_seq_0953_216
	ScrDef scr_seq_0953_217
	ScrDef scr_seq_0953_218
	ScrDef scr_seq_0953_219
	ScrDef scr_seq_0953_220
	ScrDef scr_seq_0953_221
	ScrDef scr_seq_0953_222
	ScrDef scr_seq_0953_223
	ScrDef scr_seq_0953_224
	ScrDef scr_seq_0953_225
	ScrDef scr_seq_0953_226
	ScrDef scr_seq_0953_227
	ScrDef scr_seq_0953_228
	ScrDef scr_seq_0953_229
	ScrDef scr_seq_0953_230
	ScrDef scr_seq_0953_231
	ScrDef scr_seq_0953_232
	ScrDef scr_seq_0953_233
	ScrDef scr_seq_0953_234
	ScrDef scr_seq_0953_235
	ScrDef scr_seq_0953_236
	ScrDef scr_seq_0953_237
	ScrDef scr_seq_0953_238
	ScrDef scr_seq_0953_239
	ScrDef scr_seq_0953_240
	ScrDef scr_seq_0953_241
	ScrDef scr_seq_0953_242
	ScrDef scr_seq_0953_243
	ScrDef scr_seq_0953_244
	ScrDef scr_seq_0953_245
	ScrDef scr_seq_0953_246
	ScrDef scr_seq_0953_247
	ScrDef scr_seq_0953_248
	ScrDef scr_seq_0953_249
	ScrDef scr_seq_0953_250
	ScrDef scr_seq_0953_251
	ScrDef scr_seq_0953_252
	ScrDef scr_seq_0953_253
	ScrDef scr_seq_0953_254
	ScrDef scr_seq_0953_255
	ScrDef scr_seq_0953_256
	ScrDef scr_seq_0953_257
	ScrDef scr_seq_0953_258
	ScrDef scr_seq_0953_259
	ScrDef scr_seq_0953_260
	ScrDef scr_seq_0953_261
	ScrDef scr_seq_0953_262
	ScrDef scr_seq_0953_263
	ScrDef scr_seq_0953_264
	ScrDef scr_seq_0953_265
	ScrDef scr_seq_0953_266
	ScrDef scr_seq_0953_267
	ScrDef scr_seq_0953_268
	ScrDef scr_seq_0953_269
	ScrDef scr_seq_0953_270
	ScrDef scr_seq_0953_271
	ScrDef scr_seq_0953_272
	ScrDef scr_seq_0953_273
	ScrDef scr_seq_0953_274
	ScrDef scr_seq_0953_275
	ScrDef scr_seq_0953_276
	ScrDef scr_seq_0953_277
	ScrDef scr_seq_0953_278
	ScrDef scr_seq_0953_279
	ScrDef scr_seq_0953_280
	ScrDef scr_seq_0953_281
	ScrDef scr_seq_0953_282
	ScrDef scr_seq_0953_283
	ScrDef scr_seq_0953_284
	ScrDef scr_seq_0953_285
	ScrDef scr_seq_0953_286
	ScrDef scr_seq_0953_287
	ScrDef scr_seq_0953_288
	ScrDef scr_seq_0953_289
	ScrDef scr_seq_0953_290
	ScrDef scr_seq_0953_291
	ScrDef scr_seq_0953_292
	ScrDef scr_seq_0953_293
	ScrDef scr_seq_0953_294
	ScrDef scr_seq_0953_295
	ScrDef scr_seq_0953_296
	ScrDef scr_seq_0953_297
	ScrDef scr_seq_0953_298
	ScrDef scr_seq_0953_299
	ScrDef scr_seq_0953_300
	ScrDef scr_seq_0953_301
	ScrDef scr_seq_0953_302
	ScrDef scr_seq_0953_303
	ScrDef scr_seq_0953_304
	ScrDef scr_seq_0953_305
	ScrDef scr_seq_0953_306
	ScrDef scr_seq_0953_307
	ScrDef scr_seq_0953_308
	ScrDef scr_seq_0953_309
	ScrDef scr_seq_0953_310
	ScrDef scr_seq_0953_311
	ScrDef scr_seq_0953_312
	ScrDef scr_seq_0953_313
	ScrDef scr_seq_0953_314
	ScrDef scr_seq_0953_315
	ScrDef scr_seq_0953_316
	ScrDef scr_seq_0953_317
	ScrDef scr_seq_0953_318
	ScrDef scr_seq_0953_319
	ScrDef scr_seq_0953_320
	ScrDef scr_seq_0953_321
	ScrDef scr_seq_0953_322
	ScrDef scr_seq_0953_323
	ScrDef scr_seq_0953_324
	ScrDef scr_seq_0953_325
	ScrDef scr_seq_0953_326
	ScrDef scr_seq_0953_327
	ScrDef scr_seq_0953_328
	ScrDef scr_seq_0953_329
	ScrDef scr_seq_0953_330
	ScrDef scr_seq_0953_331
	ScrDef scr_seq_0953_332
	ScrDef scr_seq_0953_333
	ScrDef scr_seq_0953_334
	ScrDef scr_seq_0953_335
	ScrDef scr_seq_0953_336
	ScrDef scr_seq_0953_337
	ScrDef scr_seq_0953_338
	ScrDef scr_seq_0953_339
	ScrDef scr_seq_0953_340
	ScrDef scr_seq_0953_341
	ScrDef scr_seq_0953_342
	ScrDef scr_seq_0953_343
	ScrDef scr_seq_0953_344
	ScrDef scr_seq_0953_345
	ScrDef scr_seq_0953_346
	ScrDef scr_seq_0953_347
	ScrDef scr_seq_0953_348
	ScrDef scr_seq_0953_349
	ScrDef scr_seq_0953_350
	ScrDef scr_seq_0953_351
	ScrDef scr_seq_0953_352
	ScrDef scr_seq_0953_353
	ScrDef scr_seq_0953_354
	ScrDef scr_seq_0953_355
	ScrDef scr_seq_0953_356
	ScrDef scr_seq_0953_357
	ScrDef scr_seq_0953_358
	ScrDef scr_seq_0953_359
	ScrDef scr_seq_0953_360
	ScrDef scr_seq_0953_361
	ScrDef scr_seq_0953_362
	ScrDef scr_seq_0953_363
	ScrDef scr_seq_0953_364
	ScrDef scr_seq_0953_365
	ScrDef scr_seq_0953_366
	ScrDef scr_seq_0953_367
	ScrDef scr_seq_0953_368
	ScrDef scr_seq_0953_369
	ScrDef scr_seq_0953_370
	ScrDef scr_seq_0953_371
	ScrDef scr_seq_0953_372
	ScrDef scr_seq_0953_373
	ScrDef scr_seq_0953_374
	ScrDef scr_seq_0953_375
	ScrDef scr_seq_0953_376
	ScrDef scr_seq_0953_377
	ScrDef scr_seq_0953_378
	ScrDef scr_seq_0953_379
	ScrDef scr_seq_0953_380
	ScrDef scr_seq_0953_381
	ScrDef scr_seq_0953_382
	ScrDef scr_seq_0953_383
	ScrDef scr_seq_0953_384
	ScrDef scr_seq_0953_385
	ScrDef scr_seq_0953_386
	ScrDef scr_seq_0953_387
	ScrDef scr_seq_0953_388
	ScrDef scr_seq_0953_389
	ScrDef scr_seq_0953_390
	ScrDef scr_seq_0953_391
	ScrDef scr_seq_0953_392
	ScrDef scr_seq_0953_393
	ScrDef scr_seq_0953_394
	ScrDef scr_seq_0953_395
	ScrDef scr_seq_0953_396
	ScrDef scr_seq_0953_397
	ScrDef scr_seq_0953_398
	ScrDef scr_seq_0953_399
	ScrDef scr_seq_0953_400
	ScrDef scr_seq_0953_401
	ScrDef scr_seq_0953_402
	ScrDef scr_seq_0953_403
	ScrDef scr_seq_0953_404
	ScrDef scr_seq_0953_405
	ScrDef scr_seq_0953_406
	ScrDef scr_seq_0953_407
	ScrDef scr_seq_0953_408
	ScrDef scr_seq_0953_409
	ScrDef scr_seq_0953_410
	ScrDef scr_seq_0953_411
	ScrDef scr_seq_0953_412
	ScrDef scr_seq_0953_413
	ScrDef scr_seq_0953_414
	ScrDef scr_seq_0953_415
	ScrDef scr_seq_0953_416
	ScrDef scr_seq_0953_417
	ScrDef scr_seq_0953_418
	ScrDef scr_seq_0953_419
	ScrDef scr_seq_0953_420
	ScrDef scr_seq_0953_421
	ScrDef scr_seq_0953_422
	ScrDef scr_seq_0953_423
	ScrDef scr_seq_0953_424
	ScrDef scr_seq_0953_425
	ScrDef scr_seq_0953_426
	ScrDef scr_seq_0953_427
	ScrDef scr_seq_0953_428
	ScrDef scr_seq_0953_429
	ScrDef scr_seq_0953_430
	ScrDef scr_seq_0953_431
	ScrDef scr_seq_0953_432
	ScrDef scr_seq_0953_433
	ScrDef scr_seq_0953_434
	ScrDef scr_seq_0953_435
	ScrDef scr_seq_0953_436
	ScrDef scr_seq_0953_437
	ScrDef scr_seq_0953_438
	ScrDef scr_seq_0953_439
	ScrDef scr_seq_0953_440
	ScrDef scr_seq_0953_441
	ScrDef scr_seq_0953_442
	ScrDef scr_seq_0953_443
	ScrDef scr_seq_0953_444
	ScrDef scr_seq_0953_445
	ScrDef scr_seq_0953_446
	ScrDef scr_seq_0953_447
	ScrDef scr_seq_0953_448
	ScrDef scr_seq_0953_449
	ScrDef scr_seq_0953_450
	ScrDef scr_seq_0953_451
	ScrDef scr_seq_0953_452
	ScrDef scr_seq_0953_453
	ScrDef scr_seq_0953_454
	ScrDef scr_seq_0953_455
	ScrDef scr_seq_0953_456
	ScrDef scr_seq_0953_457
	ScrDef scr_seq_0953_458
	ScrDef scr_seq_0953_459
	ScrDef scr_seq_0953_460
	ScrDef scr_seq_0953_461
	ScrDef scr_seq_0953_462
	ScrDef scr_seq_0953_463
	ScrDef scr_seq_0953_464
	ScrDef scr_seq_0953_465
	ScrDef scr_seq_0953_466
	ScrDef scr_seq_0953_467
	ScrDef scr_seq_0953_468
	ScrDef scr_seq_0953_469
	ScrDef scr_seq_0953_470
	ScrDef scr_seq_0953_471
	ScrDef scr_seq_0953_472
	ScrDef scr_seq_0953_473
	ScrDef scr_seq_0953_474
	ScrDef scr_seq_0953_475
	ScrDef scr_seq_0953_476
	ScrDef scr_seq_0953_477
	ScrDef scr_seq_0953_478
	ScrDef scr_seq_0953_479
	ScrDef scr_seq_0953_480
	ScrDef scr_seq_0953_481
	ScrDef scr_seq_0953_482
	ScrDef scr_seq_0953_483
	ScrDef scr_seq_0953_484
	ScrDef scr_seq_0953_485
	ScrDef scr_seq_0953_486
	ScrDef scr_seq_0953_487
	ScrDef scr_seq_0953_488
	ScrDef scr_seq_0953_489
	ScrDef scr_seq_0953_490
	ScrDef scr_seq_0953_491
	ScrDef scr_seq_0953_492
	ScrDef scr_seq_0953_493
	ScrDef scr_seq_0953_494
	ScrDef scr_seq_0953_495
	ScrDef scr_seq_0953_496
	ScrDef scr_seq_0953_497
	ScrDef scr_seq_0953_498
	ScrDef scr_seq_0953_499
	ScrDef scr_seq_0953_500
	ScrDef scr_seq_0953_501
	ScrDef scr_seq_0953_502
	ScrDef scr_seq_0953_503
	ScrDef scr_seq_0953_504
	ScrDef scr_seq_0953_505
	ScrDef scr_seq_0953_506
	ScrDef scr_seq_0953_507
	ScrDef scr_seq_0953_508
	ScrDef scr_seq_0953_509
	ScrDef scr_seq_0953_510
	ScrDef scr_seq_0953_511
	ScrDef scr_seq_0953_512
	ScrDef scr_seq_0953_513
	ScrDef scr_seq_0953_514
	ScrDef scr_seq_0953_515
	ScrDef scr_seq_0953_516
	ScrDef scr_seq_0953_517
	ScrDef scr_seq_0953_518
	ScrDef scr_seq_0953_519
	ScrDef scr_seq_0953_520
	ScrDef scr_seq_0953_521
	ScrDef scr_seq_0953_522
	ScrDef scr_seq_0953_523
	ScrDef scr_seq_0953_524
	ScrDef scr_seq_0953_525
	ScrDef scr_seq_0953_526
	ScrDef scr_seq_0953_527
	ScrDef scr_seq_0953_528
	ScrDef scr_seq_0953_529
	ScrDef scr_seq_0953_530
	ScrDef scr_seq_0953_531
	ScrDef scr_seq_0953_532
	ScrDef scr_seq_0953_533
	ScrDef scr_seq_0953_534
	ScrDef scr_seq_0953_535
	ScrDef scr_seq_0953_536
	ScrDef scr_seq_0953_537
	ScrDef scr_seq_0953_538
	ScrDef scr_seq_0953_539
	ScrDef scr_seq_0953_540
	ScrDef scr_seq_0953_541
	ScrDef scr_seq_0953_542
	ScrDef scr_seq_0953_543
	ScrDef scr_seq_0953_544
	ScrDef scr_seq_0953_545
	ScrDef scr_seq_0953_546
	ScrDef scr_seq_0953_547
	ScrDef scr_seq_0953_548
	ScrDef scr_seq_0953_549
	ScrDef scr_seq_0953_550
	ScrDef scr_seq_0953_551
	ScrDef scr_seq_0953_552
	ScrDef scr_seq_0953_553
	ScrDef scr_seq_0953_554
	ScrDef scr_seq_0953_555
	ScrDef scr_seq_0953_556
	ScrDef scr_seq_0953_557
	ScrDef scr_seq_0953_558
	ScrDef scr_seq_0953_559
	ScrDef scr_seq_0953_560
	ScrDef scr_seq_0953_561
	ScrDef scr_seq_0953_562
	ScrDef scr_seq_0953_563
	ScrDef scr_seq_0953_564
	ScrDef scr_seq_0953_565
	ScrDef scr_seq_0953_566
	ScrDef scr_seq_0953_567
	ScrDef scr_seq_0953_568
	ScrDef scr_seq_0953_569
	ScrDef scr_seq_0953_570
	ScrDef scr_seq_0953_571
	ScrDef scr_seq_0953_572
	ScrDef scr_seq_0953_573
	ScrDef scr_seq_0953_574
	ScrDef scr_seq_0953_575
	ScrDef scr_seq_0953_576
	ScrDef scr_seq_0953_577
	ScrDef scr_seq_0953_578
	ScrDef scr_seq_0953_579
	ScrDef scr_seq_0953_580
	ScrDef scr_seq_0953_581
	ScrDef scr_seq_0953_582
	ScrDef scr_seq_0953_583
	ScrDef scr_seq_0953_584
	ScrDef scr_seq_0953_585
	ScrDef scr_seq_0953_586
	ScrDef scr_seq_0953_587
	ScrDef scr_seq_0953_588
	ScrDef scr_seq_0953_589
	ScrDef scr_seq_0953_590
	ScrDef scr_seq_0953_591
	ScrDef scr_seq_0953_592
	ScrDef scr_seq_0953_593
	ScrDef scr_seq_0953_594
	ScrDef scr_seq_0953_595
	ScrDef scr_seq_0953_596
	ScrDef scr_seq_0953_597
	ScrDef scr_seq_0953_598
	ScrDef scr_seq_0953_599
	ScrDef scr_seq_0953_600
	ScrDef scr_seq_0953_601
	ScrDef scr_seq_0953_602
	ScrDef scr_seq_0953_603
	ScrDef scr_seq_0953_604
	ScrDef scr_seq_0953_605
	ScrDef scr_seq_0953_606
	ScrDef scr_seq_0953_607
	ScrDef scr_seq_0953_608
	ScrDef scr_seq_0953_609
	ScrDef scr_seq_0953_610
	ScrDef scr_seq_0953_611
	ScrDef scr_seq_0953_612
	ScrDef scr_seq_0953_613
	ScrDef scr_seq_0953_614
	ScrDef scr_seq_0953_615
	ScrDef scr_seq_0953_616
	ScrDef scr_seq_0953_617
	ScrDef scr_seq_0953_618
	ScrDef scr_seq_0953_619
	ScrDef scr_seq_0953_620
	ScrDef scr_seq_0953_621
	ScrDef scr_seq_0953_622
	ScrDef scr_seq_0953_623
	ScrDef scr_seq_0953_624
	ScrDef scr_seq_0953_625
	ScrDef scr_seq_0953_626
	ScrDef scr_seq_0953_627
	ScrDef scr_seq_0953_628
	ScrDef scr_seq_0953_629
	ScrDef scr_seq_0953_630
	ScrDef scr_seq_0953_631
	ScrDef scr_seq_0953_632
	ScrDef scr_seq_0953_633
	ScrDef scr_seq_0953_634
	ScrDef scr_seq_0953_635
	ScrDef scr_seq_0953_636
	ScrDef scr_seq_0953_637
	ScrDef scr_seq_0953_638
	ScrDef scr_seq_0953_639
	ScrDef scr_seq_0953_640
	ScrDef scr_seq_0953_641
	ScrDef scr_seq_0953_642
	ScrDef scr_seq_0953_643
	ScrDef scr_seq_0953_644
	ScrDef scr_seq_0953_645
	ScrDef scr_seq_0953_646
	ScrDef scr_seq_0953_647
	ScrDef scr_seq_0953_648
	ScrDef scr_seq_0953_649
	ScrDef scr_seq_0953_650
	ScrDef scr_seq_0953_651
	ScrDef scr_seq_0953_652
	ScrDef scr_seq_0953_653
	ScrDef scr_seq_0953_654
	ScrDef scr_seq_0953_655
	ScrDef scr_seq_0953_656
	ScrDef scr_seq_0953_657
	ScrDef scr_seq_0953_658
	ScrDef scr_seq_0953_659
	ScrDef scr_seq_0953_660
	ScrDef scr_seq_0953_661
	ScrDef scr_seq_0953_662
	ScrDef scr_seq_0953_663
	ScrDef scr_seq_0953_664
	ScrDef scr_seq_0953_665
	ScrDef scr_seq_0953_666
	ScrDef scr_seq_0953_667
	ScrDef scr_seq_0953_668
	ScrDef scr_seq_0953_669
	ScrDef scr_seq_0953_670
	ScrDef scr_seq_0953_671
	ScrDef scr_seq_0953_672
	ScrDef scr_seq_0953_673
	ScrDef scr_seq_0953_674
	ScrDef scr_seq_0953_675
	ScrDef scr_seq_0953_676
	ScrDef scr_seq_0953_677
	ScrDef scr_seq_0953_678
	ScrDef scr_seq_0953_679
	ScrDef scr_seq_0953_680
	ScrDef scr_seq_0953_681
	ScrDef scr_seq_0953_682
	ScrDef scr_seq_0953_683
	ScrDef scr_seq_0953_684
	ScrDef scr_seq_0953_685
	ScrDef scr_seq_0953_686
	ScrDef scr_seq_0953_687
	ScrDef scr_seq_0953_688
	ScrDef scr_seq_0953_689
	ScrDef scr_seq_0953_690
	ScrDef scr_seq_0953_691
	ScrDef scr_seq_0953_692
	ScrDef scr_seq_0953_693
	ScrDef scr_seq_0953_694
	ScrDef scr_seq_0953_695
	ScrDef scr_seq_0953_696
	ScrDef scr_seq_0953_697
	ScrDef scr_seq_0953_698
	ScrDef scr_seq_0953_699
	ScrDef scr_seq_0953_700
	ScrDef scr_seq_0953_701
	ScrDef scr_seq_0953_702
	ScrDef scr_seq_0953_703
	ScrDef scr_seq_0953_704
	ScrDef scr_seq_0953_705
	ScrDef scr_seq_0953_706
	ScrDef scr_seq_0953_707
	ScrDef scr_seq_0953_708
	ScrDef scr_seq_0953_709
	ScrDef scr_seq_0953_710
	ScrDef scr_seq_0953_711
	ScrDef scr_seq_0953_712
	ScrDef scr_seq_0953_713
	ScrDef scr_seq_0953_714
	ScrDef scr_seq_0953_715
	ScrDef scr_seq_0953_716
	ScrDef scr_seq_0953_717
	ScrDef scr_seq_0953_718
	ScrDef scr_seq_0953_719
	ScrDef scr_seq_0953_720
	ScrDef scr_seq_0953_721
	ScrDef scr_seq_0953_722
	ScrDef scr_seq_0953_723
	ScrDef scr_seq_0953_724
	ScrDef scr_seq_0953_725
	ScrDef scr_seq_0953_726
	ScrDef scr_seq_0953_727
	ScrDef scr_seq_0953_728
	ScrDef scr_seq_0953_729
	ScrDef scr_seq_0953_730
	ScrDef scr_seq_0953_731
	ScrDef scr_seq_0953_732
	ScrDef scr_seq_0953_733
	ScrDef scr_seq_0953_734
	ScrDef scr_seq_0953_735
	ScrDef scr_seq_0953_736
	ScrDef scr_seq_0953_737
	ScrDef scr_seq_0953_738
	ScrDef scr_seq_0953_739
	ScrDefEnd

scr_seq_0953_000:
scr_seq_0953_001:
scr_seq_0953_002:
scr_seq_0953_003:
scr_seq_0953_004:
scr_seq_0953_005:
scr_seq_0953_006:
scr_seq_0953_007:
scr_seq_0953_008:
scr_seq_0953_009:
scr_seq_0953_010:
scr_seq_0953_011:
scr_seq_0953_012:
scr_seq_0953_013:
scr_seq_0953_014:
scr_seq_0953_015:
scr_seq_0953_016:
scr_seq_0953_017:
scr_seq_0953_018:
scr_seq_0953_019:
scr_seq_0953_020:
scr_seq_0953_021:
scr_seq_0953_022:
scr_seq_0953_023:
scr_seq_0953_024:
scr_seq_0953_025:
scr_seq_0953_026:
scr_seq_0953_027:
scr_seq_0953_028:
scr_seq_0953_029:
scr_seq_0953_030:
scr_seq_0953_031:
scr_seq_0953_032:
scr_seq_0953_033:
scr_seq_0953_034:
scr_seq_0953_035:
scr_seq_0953_036:
scr_seq_0953_037:
scr_seq_0953_038:
scr_seq_0953_039:
scr_seq_0953_040:
scr_seq_0953_041:
scr_seq_0953_042:
scr_seq_0953_043:
scr_seq_0953_044:
scr_seq_0953_045:
scr_seq_0953_046:
scr_seq_0953_047:
scr_seq_0953_048:
scr_seq_0953_049:
scr_seq_0953_050:
scr_seq_0953_051:
scr_seq_0953_052:
scr_seq_0953_053:
scr_seq_0953_054:
scr_seq_0953_055:
scr_seq_0953_056:
scr_seq_0953_057:
scr_seq_0953_058:
scr_seq_0953_059:
scr_seq_0953_060:
scr_seq_0953_061:
scr_seq_0953_062:
scr_seq_0953_063:
scr_seq_0953_064:
scr_seq_0953_065:
scr_seq_0953_066:
scr_seq_0953_067:
scr_seq_0953_068:
scr_seq_0953_069:
scr_seq_0953_070:
scr_seq_0953_071:
scr_seq_0953_072:
scr_seq_0953_073:
scr_seq_0953_074:
scr_seq_0953_075:
scr_seq_0953_076:
scr_seq_0953_077:
scr_seq_0953_078:
scr_seq_0953_079:
scr_seq_0953_080:
scr_seq_0953_081:
scr_seq_0953_082:
scr_seq_0953_083:
scr_seq_0953_084:
scr_seq_0953_085:
scr_seq_0953_086:
scr_seq_0953_087:
scr_seq_0953_088:
scr_seq_0953_089:
scr_seq_0953_090:
scr_seq_0953_091:
scr_seq_0953_092:
scr_seq_0953_093:
scr_seq_0953_094:
scr_seq_0953_095:
scr_seq_0953_096:
scr_seq_0953_097:
scr_seq_0953_098:
scr_seq_0953_099:
scr_seq_0953_100:
scr_seq_0953_101:
scr_seq_0953_102:
scr_seq_0953_103:
scr_seq_0953_104:
scr_seq_0953_105:
scr_seq_0953_106:
scr_seq_0953_107:
scr_seq_0953_108:
scr_seq_0953_109:
scr_seq_0953_110:
scr_seq_0953_111:
scr_seq_0953_112:
scr_seq_0953_113:
scr_seq_0953_114:
scr_seq_0953_115:
scr_seq_0953_116:
scr_seq_0953_117:
scr_seq_0953_118:
scr_seq_0953_119:
scr_seq_0953_120:
scr_seq_0953_121:
scr_seq_0953_122:
scr_seq_0953_123:
scr_seq_0953_124:
scr_seq_0953_125:
scr_seq_0953_126:
scr_seq_0953_127:
scr_seq_0953_128:
scr_seq_0953_129:
scr_seq_0953_130:
scr_seq_0953_131:
scr_seq_0953_132:
scr_seq_0953_133:
scr_seq_0953_134:
scr_seq_0953_135:
scr_seq_0953_136:
scr_seq_0953_137:
scr_seq_0953_138:
scr_seq_0953_139:
scr_seq_0953_140:
scr_seq_0953_141:
scr_seq_0953_142:
scr_seq_0953_143:
scr_seq_0953_144:
scr_seq_0953_145:
scr_seq_0953_146:
scr_seq_0953_147:
scr_seq_0953_148:
scr_seq_0953_149:
scr_seq_0953_150:
scr_seq_0953_151:
scr_seq_0953_152:
scr_seq_0953_153:
scr_seq_0953_154:
scr_seq_0953_155:
scr_seq_0953_156:
scr_seq_0953_157:
scr_seq_0953_158:
scr_seq_0953_159:
scr_seq_0953_160:
scr_seq_0953_161:
scr_seq_0953_162:
scr_seq_0953_163:
scr_seq_0953_164:
scr_seq_0953_165:
scr_seq_0953_166:
scr_seq_0953_167:
scr_seq_0953_168:
scr_seq_0953_169:
scr_seq_0953_170:
scr_seq_0953_171:
scr_seq_0953_172:
scr_seq_0953_173:
scr_seq_0953_174:
scr_seq_0953_175:
scr_seq_0953_176:
scr_seq_0953_177:
scr_seq_0953_178:
scr_seq_0953_179:
scr_seq_0953_180:
scr_seq_0953_181:
scr_seq_0953_182:
scr_seq_0953_183:
scr_seq_0953_184:
scr_seq_0953_185:
scr_seq_0953_186:
scr_seq_0953_187:
scr_seq_0953_188:
scr_seq_0953_189:
scr_seq_0953_190:
scr_seq_0953_191:
scr_seq_0953_192:
scr_seq_0953_193:
scr_seq_0953_194:
scr_seq_0953_195:
scr_seq_0953_196:
scr_seq_0953_197:
scr_seq_0953_198:
scr_seq_0953_199:
scr_seq_0953_200:
scr_seq_0953_201:
scr_seq_0953_202:
scr_seq_0953_203:
scr_seq_0953_204:
scr_seq_0953_205:
scr_seq_0953_206:
scr_seq_0953_207:
scr_seq_0953_208:
scr_seq_0953_209:
scr_seq_0953_210:
scr_seq_0953_211:
scr_seq_0953_212:
scr_seq_0953_213:
scr_seq_0953_214:
scr_seq_0953_215:
scr_seq_0953_216:
scr_seq_0953_217:
scr_seq_0953_218:
scr_seq_0953_219:
scr_seq_0953_220:
scr_seq_0953_221:
scr_seq_0953_222:
scr_seq_0953_223:
scr_seq_0953_224:
scr_seq_0953_225:
scr_seq_0953_226:
scr_seq_0953_227:
scr_seq_0953_228:
scr_seq_0953_229:
scr_seq_0953_230:
scr_seq_0953_231:
scr_seq_0953_232:
scr_seq_0953_233:
scr_seq_0953_234:
scr_seq_0953_235:
scr_seq_0953_236:
scr_seq_0953_237:
scr_seq_0953_238:
scr_seq_0953_239:
scr_seq_0953_240:
scr_seq_0953_241:
scr_seq_0953_242:
scr_seq_0953_243:
scr_seq_0953_244:
scr_seq_0953_245:
scr_seq_0953_246:
scr_seq_0953_247:
scr_seq_0953_248:
scr_seq_0953_249:
scr_seq_0953_250:
scr_seq_0953_251:
scr_seq_0953_252:
scr_seq_0953_253:
scr_seq_0953_254:
scr_seq_0953_255:
scr_seq_0953_256:
scr_seq_0953_257:
scr_seq_0953_258:
scr_seq_0953_259:
scr_seq_0953_260:
scr_seq_0953_261:
scr_seq_0953_262:
scr_seq_0953_263:
scr_seq_0953_264:
scr_seq_0953_265:
scr_seq_0953_266:
scr_seq_0953_267:
scr_seq_0953_268:
scr_seq_0953_269:
scr_seq_0953_270:
scr_seq_0953_271:
scr_seq_0953_272:
scr_seq_0953_273:
scr_seq_0953_274:
scr_seq_0953_275:
scr_seq_0953_276:
scr_seq_0953_277:
scr_seq_0953_278:
scr_seq_0953_279:
scr_seq_0953_280:
scr_seq_0953_281:
scr_seq_0953_282:
scr_seq_0953_283:
scr_seq_0953_284:
scr_seq_0953_285:
scr_seq_0953_286:
scr_seq_0953_287:
scr_seq_0953_288:
scr_seq_0953_289:
scr_seq_0953_290:
scr_seq_0953_291:
scr_seq_0953_292:
scr_seq_0953_293:
scr_seq_0953_294:
scr_seq_0953_295:
scr_seq_0953_296:
scr_seq_0953_297:
scr_seq_0953_298:
scr_seq_0953_299:
scr_seq_0953_300:
scr_seq_0953_301:
scr_seq_0953_302:
scr_seq_0953_303:
scr_seq_0953_304:
scr_seq_0953_305:
scr_seq_0953_306:
scr_seq_0953_307:
scr_seq_0953_308:
scr_seq_0953_309:
scr_seq_0953_310:
scr_seq_0953_311:
scr_seq_0953_312:
scr_seq_0953_313:
scr_seq_0953_314:
scr_seq_0953_315:
scr_seq_0953_316:
scr_seq_0953_317:
scr_seq_0953_318:
scr_seq_0953_319:
scr_seq_0953_320:
scr_seq_0953_321:
scr_seq_0953_322:
scr_seq_0953_323:
scr_seq_0953_324:
scr_seq_0953_325:
scr_seq_0953_326:
scr_seq_0953_327:
scr_seq_0953_328:
scr_seq_0953_329:
scr_seq_0953_330:
scr_seq_0953_331:
scr_seq_0953_332:
scr_seq_0953_333:
scr_seq_0953_334:
scr_seq_0953_335:
scr_seq_0953_336:
scr_seq_0953_337:
scr_seq_0953_338:
scr_seq_0953_339:
scr_seq_0953_340:
scr_seq_0953_341:
scr_seq_0953_342:
scr_seq_0953_343:
scr_seq_0953_344:
scr_seq_0953_345:
scr_seq_0953_346:
scr_seq_0953_347:
scr_seq_0953_348:
scr_seq_0953_349:
scr_seq_0953_350:
scr_seq_0953_351:
scr_seq_0953_352:
scr_seq_0953_353:
scr_seq_0953_354:
scr_seq_0953_355:
scr_seq_0953_356:
scr_seq_0953_357:
scr_seq_0953_358:
scr_seq_0953_359:
scr_seq_0953_360:
scr_seq_0953_361:
scr_seq_0953_362:
scr_seq_0953_363:
scr_seq_0953_364:
scr_seq_0953_365:
scr_seq_0953_366:
scr_seq_0953_367:
scr_seq_0953_368:
scr_seq_0953_369:
scr_seq_0953_370:
scr_seq_0953_371:
scr_seq_0953_372:
scr_seq_0953_373:
scr_seq_0953_374:
scr_seq_0953_375:
scr_seq_0953_376:
scr_seq_0953_377:
scr_seq_0953_378:
scr_seq_0953_379:
scr_seq_0953_380:
scr_seq_0953_381:
scr_seq_0953_382:
scr_seq_0953_383:
scr_seq_0953_384:
scr_seq_0953_385:
scr_seq_0953_386:
scr_seq_0953_387:
scr_seq_0953_388:
scr_seq_0953_389:
scr_seq_0953_390:
scr_seq_0953_391:
scr_seq_0953_392:
scr_seq_0953_393:
scr_seq_0953_394:
scr_seq_0953_395:
scr_seq_0953_396:
scr_seq_0953_397:
scr_seq_0953_398:
scr_seq_0953_399:
scr_seq_0953_400:
scr_seq_0953_401:
scr_seq_0953_402:
scr_seq_0953_403:
scr_seq_0953_404:
scr_seq_0953_405:
scr_seq_0953_406:
scr_seq_0953_407:
scr_seq_0953_408:
scr_seq_0953_409:
scr_seq_0953_410:
scr_seq_0953_411:
scr_seq_0953_412:
scr_seq_0953_413:
scr_seq_0953_414:
scr_seq_0953_415:
scr_seq_0953_416:
scr_seq_0953_417:
scr_seq_0953_418:
scr_seq_0953_419:
scr_seq_0953_420:
scr_seq_0953_421:
scr_seq_0953_422:
scr_seq_0953_423:
scr_seq_0953_424:
scr_seq_0953_425:
scr_seq_0953_426:
scr_seq_0953_427:
scr_seq_0953_428:
scr_seq_0953_429:
scr_seq_0953_430:
scr_seq_0953_431:
scr_seq_0953_432:
scr_seq_0953_433:
scr_seq_0953_434:
scr_seq_0953_435:
scr_seq_0953_436:
scr_seq_0953_437:
scr_seq_0953_438:
scr_seq_0953_439:
scr_seq_0953_440:
scr_seq_0953_441:
scr_seq_0953_442:
scr_seq_0953_443:
scr_seq_0953_444:
scr_seq_0953_445:
scr_seq_0953_446:
scr_seq_0953_447:
scr_seq_0953_448:
scr_seq_0953_449:
scr_seq_0953_450:
scr_seq_0953_451:
scr_seq_0953_452:
scr_seq_0953_453:
scr_seq_0953_454:
scr_seq_0953_455:
scr_seq_0953_456:
scr_seq_0953_457:
scr_seq_0953_458:
scr_seq_0953_459:
scr_seq_0953_460:
scr_seq_0953_461:
scr_seq_0953_462:
scr_seq_0953_463:
scr_seq_0953_464:
scr_seq_0953_465:
scr_seq_0953_466:
scr_seq_0953_467:
scr_seq_0953_468:
scr_seq_0953_469:
scr_seq_0953_470:
scr_seq_0953_471:
scr_seq_0953_472:
scr_seq_0953_473:
scr_seq_0953_474:
scr_seq_0953_475:
scr_seq_0953_476:
scr_seq_0953_477:
scr_seq_0953_478:
scr_seq_0953_479:
scr_seq_0953_480:
scr_seq_0953_481:
scr_seq_0953_482:
scr_seq_0953_483:
scr_seq_0953_484:
scr_seq_0953_485:
scr_seq_0953_486:
scr_seq_0953_487:
scr_seq_0953_488:
scr_seq_0953_489:
scr_seq_0953_490:
scr_seq_0953_491:
scr_seq_0953_492:
scr_seq_0953_493:
scr_seq_0953_494:
scr_seq_0953_495:
scr_seq_0953_496:
scr_seq_0953_497:
scr_seq_0953_498:
scr_seq_0953_499:
scr_seq_0953_500:
scr_seq_0953_501:
scr_seq_0953_502:
scr_seq_0953_503:
scr_seq_0953_504:
scr_seq_0953_505:
scr_seq_0953_506:
scr_seq_0953_507:
scr_seq_0953_508:
scr_seq_0953_509:
scr_seq_0953_510:
scr_seq_0953_511:
scr_seq_0953_512:
scr_seq_0953_513:
scr_seq_0953_514:
scr_seq_0953_515:
scr_seq_0953_516:
scr_seq_0953_517:
scr_seq_0953_518:
scr_seq_0953_519:
scr_seq_0953_520:
scr_seq_0953_521:
scr_seq_0953_522:
scr_seq_0953_523:
scr_seq_0953_524:
scr_seq_0953_525:
scr_seq_0953_526:
scr_seq_0953_527:
scr_seq_0953_528:
scr_seq_0953_529:
scr_seq_0953_530:
scr_seq_0953_531:
scr_seq_0953_532:
scr_seq_0953_533:
scr_seq_0953_534:
scr_seq_0953_535:
scr_seq_0953_536:
scr_seq_0953_537:
scr_seq_0953_538:
scr_seq_0953_539:
scr_seq_0953_540:
scr_seq_0953_541:
scr_seq_0953_542:
scr_seq_0953_543:
scr_seq_0953_544:
scr_seq_0953_545:
scr_seq_0953_546:
scr_seq_0953_547:
scr_seq_0953_548:
scr_seq_0953_549:
scr_seq_0953_550:
scr_seq_0953_551:
scr_seq_0953_552:
scr_seq_0953_553:
scr_seq_0953_554:
scr_seq_0953_555:
scr_seq_0953_556:
scr_seq_0953_557:
scr_seq_0953_558:
scr_seq_0953_559:
scr_seq_0953_560:
scr_seq_0953_561:
scr_seq_0953_562:
scr_seq_0953_563:
scr_seq_0953_564:
scr_seq_0953_565:
scr_seq_0953_566:
scr_seq_0953_567:
scr_seq_0953_568:
scr_seq_0953_569:
scr_seq_0953_570:
scr_seq_0953_571:
scr_seq_0953_572:
scr_seq_0953_573:
scr_seq_0953_574:
scr_seq_0953_575:
scr_seq_0953_576:
scr_seq_0953_577:
scr_seq_0953_578:
scr_seq_0953_579:
scr_seq_0953_580:
scr_seq_0953_581:
scr_seq_0953_582:
scr_seq_0953_583:
scr_seq_0953_584:
scr_seq_0953_585:
scr_seq_0953_586:
scr_seq_0953_587:
scr_seq_0953_588:
scr_seq_0953_589:
scr_seq_0953_590:
scr_seq_0953_591:
scr_seq_0953_592:
scr_seq_0953_593:
scr_seq_0953_594:
scr_seq_0953_595:
scr_seq_0953_596:
scr_seq_0953_597:
scr_seq_0953_598:
scr_seq_0953_599:
scr_seq_0953_600:
scr_seq_0953_601:
scr_seq_0953_602:
scr_seq_0953_603:
scr_seq_0953_604:
scr_seq_0953_605:
scr_seq_0953_606:
scr_seq_0953_607:
scr_seq_0953_608:
scr_seq_0953_609:
scr_seq_0953_610:
scr_seq_0953_611:
scr_seq_0953_612:
scr_seq_0953_613:
scr_seq_0953_614:
scr_seq_0953_615:
scr_seq_0953_616:
scr_seq_0953_617:
scr_seq_0953_618:
scr_seq_0953_619:
scr_seq_0953_620:
scr_seq_0953_621:
scr_seq_0953_622:
scr_seq_0953_623:
scr_seq_0953_624:
scr_seq_0953_625:
scr_seq_0953_626:
scr_seq_0953_627:
scr_seq_0953_628:
scr_seq_0953_629:
scr_seq_0953_630:
scr_seq_0953_631:
scr_seq_0953_632:
scr_seq_0953_633:
scr_seq_0953_634:
scr_seq_0953_635:
scr_seq_0953_636:
scr_seq_0953_637:
scr_seq_0953_638:
scr_seq_0953_639:
scr_seq_0953_640:
scr_seq_0953_641:
scr_seq_0953_642:
scr_seq_0953_643:
scr_seq_0953_644:
scr_seq_0953_645:
scr_seq_0953_646:
scr_seq_0953_647:
scr_seq_0953_648:
scr_seq_0953_649:
scr_seq_0953_650:
scr_seq_0953_651:
scr_seq_0953_652:
scr_seq_0953_653:
scr_seq_0953_654:
scr_seq_0953_655:
scr_seq_0953_656:
scr_seq_0953_657:
scr_seq_0953_658:
scr_seq_0953_659:
scr_seq_0953_660:
scr_seq_0953_661:
scr_seq_0953_662:
scr_seq_0953_663:
scr_seq_0953_664:
scr_seq_0953_665:
scr_seq_0953_666:
scr_seq_0953_667:
scr_seq_0953_668:
scr_seq_0953_669:
scr_seq_0953_670:
scr_seq_0953_671:
scr_seq_0953_672:
scr_seq_0953_673:
scr_seq_0953_674:
scr_seq_0953_675:
scr_seq_0953_676:
scr_seq_0953_677:
scr_seq_0953_678:
scr_seq_0953_679:
scr_seq_0953_680:
scr_seq_0953_681:
scr_seq_0953_682:
scr_seq_0953_683:
scr_seq_0953_684:
scr_seq_0953_685:
scr_seq_0953_686:
scr_seq_0953_687:
scr_seq_0953_688:
scr_seq_0953_689:
scr_seq_0953_690:
scr_seq_0953_691:
scr_seq_0953_692:
scr_seq_0953_693:
scr_seq_0953_694:
scr_seq_0953_695:
scr_seq_0953_696:
scr_seq_0953_697:
scr_seq_0953_698:
scr_seq_0953_699:
scr_seq_0953_700:
scr_seq_0953_701:
scr_seq_0953_702:
scr_seq_0953_703:
scr_seq_0953_704:
scr_seq_0953_705:
scr_seq_0953_706:
scr_seq_0953_707:
scr_seq_0953_708:
scr_seq_0953_709:
scr_seq_0953_710:
scr_seq_0953_711:
scr_seq_0953_712:
scr_seq_0953_713:
scr_seq_0953_714:
scr_seq_0953_715:
scr_seq_0953_716:
scr_seq_0953_717:
scr_seq_0953_718:
scr_seq_0953_719:
scr_seq_0953_720:
scr_seq_0953_721:
scr_seq_0953_722:
scr_seq_0953_723:
scr_seq_0953_724:
scr_seq_0953_725:
scr_seq_0953_726:
scr_seq_0953_727:
scr_seq_0953_728:
scr_seq_0953_729:
scr_seq_0953_730:
scr_seq_0953_731:
scr_seq_0953_732:
scr_seq_0953_733:
scr_seq_0953_734:
scr_seq_0953_735:
scr_seq_0953_736:
scr_seq_0953_737:
scr_seq_0953_738:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetTrainerNum VAR_SPECIAL_x8004
	LoadPhoneDat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	ScrCmd_574 VAR_SPECIAL_x8001, VAR_SPECIAL_LAST_TALKED
	Compare VAR_SPECIAL_x8001, 51
	CallIfEq _0E57
	Compare VAR_SPECIAL_x8001, 52
	CallIfEq _0E57
	Compare VAR_SPECIAL_x8001, 53
	CallIfEq _0E57
	Compare VAR_SPECIAL_x8001, 54
	CallIfEq _0E57
	GoToIfDefeated VAR_SPECIAL_x8004, _0C9C
	TrainerIsDoubleBattle VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0C13
	PartyCheckForDouble VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0E3B
	GoTo _0C13
	End

_0C13:
	EncounterMusic VAR_SPECIAL_x8004
	OpenMsg
	GetTrainerMsgParams VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	TrainerMessage VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	GoTo _0C2F
	End

_0C2F:
	CloseMsg
	ScrCmd_454
	TrainerBattle VAR_SPECIAL_x8004, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0D99
	CopyVar VAR_TEMP_x4012, VAR_SPECIAL_x8004
	GetTrainerNum VAR_SPECIAL_x8006
	GoToIfDefeated VAR_SPECIAL_x8006, _0C7F
	ScrCmd_317 1
	Call _0D9F
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _0DCF
	SetTrainerFlag VAR_TEMP_x4012
	ReleaseAll
	End

_0C7F:
	SetTrainerFlag VAR_TEMP_x4012
	ScrCmd_462 VAR_TEMP_x4010
	GetPhoneContactRandomGiftBerry VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0D54
	ReleaseAll
	End

_0C9C:
	Compare VAR_TEMP_x4010, 255
	GoToIfEq _0CE0
	GetPhoneBookRematch VAR_TEMP_x4010, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0D02
	GetPhoneContactGiftItem VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0D54
	Call _0D9F
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0CF8
_0CE0:
	OpenMsg
	GetTrainerMsgParams VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	TrainerMessage VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0CF8:
	Call _0DE4
	ReleaseAll
	End

_0D02:
	CopyVar VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	TrainerIsDoubleBattle VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0D32
	PartyCheckForDouble VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0E3B
	GoTo _0D32
	End

_0D32:
	EncounterMusic VAR_SPECIAL_x8004
	OpenMsg
	GetRematchMsgParams VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	TrainerMessage VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_x8007
	GoTo _0C2F
	End

_0D54:
	GetPhoneContactMsgIds 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferPlayersName 0
	MsgBoxExtern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0D8F
	CallStd std_bag_is_full
	GoTo _0D93

_0D8F:
	CallStd std_obtain_item_verbose
_0D93:
	CloseMsg
	ReleaseAll
	End

_0D99:
	WhiteOut
	ReleaseAll
	End

_0D9F:
	Compare VAR_TEMP_x4010, 255
	GoToIfEq _0DC7
	CheckRegisteredPhoneNumber VAR_TEMP_x4010, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0DC7
	SetVar VAR_SPECIAL_RESULT, 1
	Return

_0DC7:
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_0DCF:
	GetPhoneContactMsgIds 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	MsgBoxExtern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	GoTo _0DF9
	End

_0DE4:
	GetPhoneContactMsgIds 3, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	MsgBoxExtern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	GoTo _0DF9
	End

_0DF9:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0E28
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	NPCMsg msg_0040_00101
	GetPhoneContactMsgIds 1, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	RegisterGearNumber VAR_TEMP_x4010
	GoTo _0E2F

_0E28:
	GetPhoneContactMsgIds 2, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
_0E2F:
	MsgBoxExtern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	WaitButton
	CloseMsg
	Return

_0E3B:
	GetTrainerNum VAR_SPECIAL_x8004
	OpenMsg
	GetTrainerMsgParams VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	TrainerMessage VAR_SPECIAL_x8004, VAR_SPECIAL_x8002
	WaitABPress
	CloseMsg
	ReleaseAll
	End

_0E57:
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _0EBC
	WaitMovement
	GetPlayerFacing VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _0E9B
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _0EA3
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _0EAB
	Compare VAR_SPECIAL_x8000, 3
	CallIfEq _0EB3
	Return

_0E9B:
	ScrCmd_109 VAR_SPECIAL_LAST_TALKED, 15
	Return

_0EA3:
	ScrCmd_109 VAR_SPECIAL_LAST_TALKED, 14
	Return

_0EAB:
	ScrCmd_109 VAR_SPECIAL_LAST_TALKED, 17
	Return

_0EB3:
	ScrCmd_109 VAR_SPECIAL_LAST_TALKED, 16
	Return

	.balign 4, 0
_0EBC:
	RevealTrainer
	EndMovement

scr_seq_0953_739:
	WaitFollowingPokemonMovement
	LockAll
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0EDD
	Release obj_partner_poke
_0EDD:
	GetTrainerEyeType VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0F0A
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0F9C
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _107D
	End

_0F0A:
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	LoadPhoneDat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	EncounterMusic VAR_SPECIAL_x8004
	ScrCmd_315
	GetTrainerPathToPlayer 0
	Call _0F87
	ScrCmd_316
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	OpenMsg
	TrainerMessage VAR_SPECIAL_x8004, 0
	CloseMsg
	TrainerBattle VAR_SPECIAL_x8004, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1176
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	SetTrainerFlag VAR_SPECIAL_x8004
	ScrCmd_317 0
	Call _0D9F
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _0DCF
	ReleaseAll
	End

_0F87:
	TrainerStepTowardsPlayer 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0F87
	Return

_0F9C:
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	LoadPhoneDat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	Compare VAR_TEMP_x4010, 255
	GoToIfNe _0FC7
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	LoadPhoneDat VAR_SPECIAL_RESULT, VAR_TEMP_x4010
_0FC7:
	EncounterMusic VAR_SPECIAL_x8004
	GetTrainerPathToPlayer 0
	GetTrainerPathToPlayer 1
	Call _1055
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	OpenMsg
	TrainerMessage VAR_SPECIAL_x8004, 3
	CloseMsg
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	OpenMsg
	TrainerMessage VAR_SPECIAL_x8005, 7
	CloseMsg
	TrainerBattle VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1176
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	SetTrainerFlag VAR_SPECIAL_x8004
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	SetTrainerFlag VAR_SPECIAL_x8005
	Call _0D9F
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _0DCF
	ReleaseAll
	End

_1055:
	TrainerStepTowardsPlayer 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1055
	TrainerStepTowardsPlayer 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1055
	Return

_107D:
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	LoadPhoneDat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	Compare VAR_TEMP_x4010, 255
	GoToIfNe _10A8
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	LoadPhoneDat VAR_SPECIAL_RESULT, VAR_TEMP_x4010
_10A8:
	EncounterMusic VAR_SPECIAL_x8004
	GetTrainerPathToPlayer 0
	Call _114C
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	OpenMsg
	TrainerMessage VAR_SPECIAL_x8004, 0
	CloseMsg
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	EncounterMusic VAR_SPECIAL_x8005
	GetTrainerPathToPlayer 1
	Call _1161
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	OpenMsg
	TrainerMessage VAR_SPECIAL_x8005, 0
	CloseMsg
	TrainerBattle VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1176
	GetEyeTrainerNum 0, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	SetTrainerFlag VAR_SPECIAL_x8004
	GetEyeTrainerNum 1, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	SetTrainerFlag VAR_SPECIAL_x8005
	Call _0D9F
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _0DCF
	ReleaseAll
	End

_114C:
	TrainerStepTowardsPlayer 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _114C
	Return

_1161:
	TrainerStepTowardsPlayer 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1161
	Return

_1176:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
