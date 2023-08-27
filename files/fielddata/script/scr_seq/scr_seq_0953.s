#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0953.h"
#include "msgdata/msg/msg_0040.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0953_000
	scrdef scr_seq_0953_001
	scrdef scr_seq_0953_002
	scrdef scr_seq_0953_003
	scrdef scr_seq_0953_004
	scrdef scr_seq_0953_005
	scrdef scr_seq_0953_006
	scrdef scr_seq_0953_007
	scrdef scr_seq_0953_008
	scrdef scr_seq_0953_009
	scrdef scr_seq_0953_010
	scrdef scr_seq_0953_011
	scrdef scr_seq_0953_012
	scrdef scr_seq_0953_013
	scrdef scr_seq_0953_014
	scrdef scr_seq_0953_015
	scrdef scr_seq_0953_016
	scrdef scr_seq_0953_017
	scrdef scr_seq_0953_018
	scrdef scr_seq_0953_019
	scrdef scr_seq_0953_020
	scrdef scr_seq_0953_021
	scrdef scr_seq_0953_022
	scrdef scr_seq_0953_023
	scrdef scr_seq_0953_024
	scrdef scr_seq_0953_025
	scrdef scr_seq_0953_026
	scrdef scr_seq_0953_027
	scrdef scr_seq_0953_028
	scrdef scr_seq_0953_029
	scrdef scr_seq_0953_030
	scrdef scr_seq_0953_031
	scrdef scr_seq_0953_032
	scrdef scr_seq_0953_033
	scrdef scr_seq_0953_034
	scrdef scr_seq_0953_035
	scrdef scr_seq_0953_036
	scrdef scr_seq_0953_037
	scrdef scr_seq_0953_038
	scrdef scr_seq_0953_039
	scrdef scr_seq_0953_040
	scrdef scr_seq_0953_041
	scrdef scr_seq_0953_042
	scrdef scr_seq_0953_043
	scrdef scr_seq_0953_044
	scrdef scr_seq_0953_045
	scrdef scr_seq_0953_046
	scrdef scr_seq_0953_047
	scrdef scr_seq_0953_048
	scrdef scr_seq_0953_049
	scrdef scr_seq_0953_050
	scrdef scr_seq_0953_051
	scrdef scr_seq_0953_052
	scrdef scr_seq_0953_053
	scrdef scr_seq_0953_054
	scrdef scr_seq_0953_055
	scrdef scr_seq_0953_056
	scrdef scr_seq_0953_057
	scrdef scr_seq_0953_058
	scrdef scr_seq_0953_059
	scrdef scr_seq_0953_060
	scrdef scr_seq_0953_061
	scrdef scr_seq_0953_062
	scrdef scr_seq_0953_063
	scrdef scr_seq_0953_064
	scrdef scr_seq_0953_065
	scrdef scr_seq_0953_066
	scrdef scr_seq_0953_067
	scrdef scr_seq_0953_068
	scrdef scr_seq_0953_069
	scrdef scr_seq_0953_070
	scrdef scr_seq_0953_071
	scrdef scr_seq_0953_072
	scrdef scr_seq_0953_073
	scrdef scr_seq_0953_074
	scrdef scr_seq_0953_075
	scrdef scr_seq_0953_076
	scrdef scr_seq_0953_077
	scrdef scr_seq_0953_078
	scrdef scr_seq_0953_079
	scrdef scr_seq_0953_080
	scrdef scr_seq_0953_081
	scrdef scr_seq_0953_082
	scrdef scr_seq_0953_083
	scrdef scr_seq_0953_084
	scrdef scr_seq_0953_085
	scrdef scr_seq_0953_086
	scrdef scr_seq_0953_087
	scrdef scr_seq_0953_088
	scrdef scr_seq_0953_089
	scrdef scr_seq_0953_090
	scrdef scr_seq_0953_091
	scrdef scr_seq_0953_092
	scrdef scr_seq_0953_093
	scrdef scr_seq_0953_094
	scrdef scr_seq_0953_095
	scrdef scr_seq_0953_096
	scrdef scr_seq_0953_097
	scrdef scr_seq_0953_098
	scrdef scr_seq_0953_099
	scrdef scr_seq_0953_100
	scrdef scr_seq_0953_101
	scrdef scr_seq_0953_102
	scrdef scr_seq_0953_103
	scrdef scr_seq_0953_104
	scrdef scr_seq_0953_105
	scrdef scr_seq_0953_106
	scrdef scr_seq_0953_107
	scrdef scr_seq_0953_108
	scrdef scr_seq_0953_109
	scrdef scr_seq_0953_110
	scrdef scr_seq_0953_111
	scrdef scr_seq_0953_112
	scrdef scr_seq_0953_113
	scrdef scr_seq_0953_114
	scrdef scr_seq_0953_115
	scrdef scr_seq_0953_116
	scrdef scr_seq_0953_117
	scrdef scr_seq_0953_118
	scrdef scr_seq_0953_119
	scrdef scr_seq_0953_120
	scrdef scr_seq_0953_121
	scrdef scr_seq_0953_122
	scrdef scr_seq_0953_123
	scrdef scr_seq_0953_124
	scrdef scr_seq_0953_125
	scrdef scr_seq_0953_126
	scrdef scr_seq_0953_127
	scrdef scr_seq_0953_128
	scrdef scr_seq_0953_129
	scrdef scr_seq_0953_130
	scrdef scr_seq_0953_131
	scrdef scr_seq_0953_132
	scrdef scr_seq_0953_133
	scrdef scr_seq_0953_134
	scrdef scr_seq_0953_135
	scrdef scr_seq_0953_136
	scrdef scr_seq_0953_137
	scrdef scr_seq_0953_138
	scrdef scr_seq_0953_139
	scrdef scr_seq_0953_140
	scrdef scr_seq_0953_141
	scrdef scr_seq_0953_142
	scrdef scr_seq_0953_143
	scrdef scr_seq_0953_144
	scrdef scr_seq_0953_145
	scrdef scr_seq_0953_146
	scrdef scr_seq_0953_147
	scrdef scr_seq_0953_148
	scrdef scr_seq_0953_149
	scrdef scr_seq_0953_150
	scrdef scr_seq_0953_151
	scrdef scr_seq_0953_152
	scrdef scr_seq_0953_153
	scrdef scr_seq_0953_154
	scrdef scr_seq_0953_155
	scrdef scr_seq_0953_156
	scrdef scr_seq_0953_157
	scrdef scr_seq_0953_158
	scrdef scr_seq_0953_159
	scrdef scr_seq_0953_160
	scrdef scr_seq_0953_161
	scrdef scr_seq_0953_162
	scrdef scr_seq_0953_163
	scrdef scr_seq_0953_164
	scrdef scr_seq_0953_165
	scrdef scr_seq_0953_166
	scrdef scr_seq_0953_167
	scrdef scr_seq_0953_168
	scrdef scr_seq_0953_169
	scrdef scr_seq_0953_170
	scrdef scr_seq_0953_171
	scrdef scr_seq_0953_172
	scrdef scr_seq_0953_173
	scrdef scr_seq_0953_174
	scrdef scr_seq_0953_175
	scrdef scr_seq_0953_176
	scrdef scr_seq_0953_177
	scrdef scr_seq_0953_178
	scrdef scr_seq_0953_179
	scrdef scr_seq_0953_180
	scrdef scr_seq_0953_181
	scrdef scr_seq_0953_182
	scrdef scr_seq_0953_183
	scrdef scr_seq_0953_184
	scrdef scr_seq_0953_185
	scrdef scr_seq_0953_186
	scrdef scr_seq_0953_187
	scrdef scr_seq_0953_188
	scrdef scr_seq_0953_189
	scrdef scr_seq_0953_190
	scrdef scr_seq_0953_191
	scrdef scr_seq_0953_192
	scrdef scr_seq_0953_193
	scrdef scr_seq_0953_194
	scrdef scr_seq_0953_195
	scrdef scr_seq_0953_196
	scrdef scr_seq_0953_197
	scrdef scr_seq_0953_198
	scrdef scr_seq_0953_199
	scrdef scr_seq_0953_200
	scrdef scr_seq_0953_201
	scrdef scr_seq_0953_202
	scrdef scr_seq_0953_203
	scrdef scr_seq_0953_204
	scrdef scr_seq_0953_205
	scrdef scr_seq_0953_206
	scrdef scr_seq_0953_207
	scrdef scr_seq_0953_208
	scrdef scr_seq_0953_209
	scrdef scr_seq_0953_210
	scrdef scr_seq_0953_211
	scrdef scr_seq_0953_212
	scrdef scr_seq_0953_213
	scrdef scr_seq_0953_214
	scrdef scr_seq_0953_215
	scrdef scr_seq_0953_216
	scrdef scr_seq_0953_217
	scrdef scr_seq_0953_218
	scrdef scr_seq_0953_219
	scrdef scr_seq_0953_220
	scrdef scr_seq_0953_221
	scrdef scr_seq_0953_222
	scrdef scr_seq_0953_223
	scrdef scr_seq_0953_224
	scrdef scr_seq_0953_225
	scrdef scr_seq_0953_226
	scrdef scr_seq_0953_227
	scrdef scr_seq_0953_228
	scrdef scr_seq_0953_229
	scrdef scr_seq_0953_230
	scrdef scr_seq_0953_231
	scrdef scr_seq_0953_232
	scrdef scr_seq_0953_233
	scrdef scr_seq_0953_234
	scrdef scr_seq_0953_235
	scrdef scr_seq_0953_236
	scrdef scr_seq_0953_237
	scrdef scr_seq_0953_238
	scrdef scr_seq_0953_239
	scrdef scr_seq_0953_240
	scrdef scr_seq_0953_241
	scrdef scr_seq_0953_242
	scrdef scr_seq_0953_243
	scrdef scr_seq_0953_244
	scrdef scr_seq_0953_245
	scrdef scr_seq_0953_246
	scrdef scr_seq_0953_247
	scrdef scr_seq_0953_248
	scrdef scr_seq_0953_249
	scrdef scr_seq_0953_250
	scrdef scr_seq_0953_251
	scrdef scr_seq_0953_252
	scrdef scr_seq_0953_253
	scrdef scr_seq_0953_254
	scrdef scr_seq_0953_255
	scrdef scr_seq_0953_256
	scrdef scr_seq_0953_257
	scrdef scr_seq_0953_258
	scrdef scr_seq_0953_259
	scrdef scr_seq_0953_260
	scrdef scr_seq_0953_261
	scrdef scr_seq_0953_262
	scrdef scr_seq_0953_263
	scrdef scr_seq_0953_264
	scrdef scr_seq_0953_265
	scrdef scr_seq_0953_266
	scrdef scr_seq_0953_267
	scrdef scr_seq_0953_268
	scrdef scr_seq_0953_269
	scrdef scr_seq_0953_270
	scrdef scr_seq_0953_271
	scrdef scr_seq_0953_272
	scrdef scr_seq_0953_273
	scrdef scr_seq_0953_274
	scrdef scr_seq_0953_275
	scrdef scr_seq_0953_276
	scrdef scr_seq_0953_277
	scrdef scr_seq_0953_278
	scrdef scr_seq_0953_279
	scrdef scr_seq_0953_280
	scrdef scr_seq_0953_281
	scrdef scr_seq_0953_282
	scrdef scr_seq_0953_283
	scrdef scr_seq_0953_284
	scrdef scr_seq_0953_285
	scrdef scr_seq_0953_286
	scrdef scr_seq_0953_287
	scrdef scr_seq_0953_288
	scrdef scr_seq_0953_289
	scrdef scr_seq_0953_290
	scrdef scr_seq_0953_291
	scrdef scr_seq_0953_292
	scrdef scr_seq_0953_293
	scrdef scr_seq_0953_294
	scrdef scr_seq_0953_295
	scrdef scr_seq_0953_296
	scrdef scr_seq_0953_297
	scrdef scr_seq_0953_298
	scrdef scr_seq_0953_299
	scrdef scr_seq_0953_300
	scrdef scr_seq_0953_301
	scrdef scr_seq_0953_302
	scrdef scr_seq_0953_303
	scrdef scr_seq_0953_304
	scrdef scr_seq_0953_305
	scrdef scr_seq_0953_306
	scrdef scr_seq_0953_307
	scrdef scr_seq_0953_308
	scrdef scr_seq_0953_309
	scrdef scr_seq_0953_310
	scrdef scr_seq_0953_311
	scrdef scr_seq_0953_312
	scrdef scr_seq_0953_313
	scrdef scr_seq_0953_314
	scrdef scr_seq_0953_315
	scrdef scr_seq_0953_316
	scrdef scr_seq_0953_317
	scrdef scr_seq_0953_318
	scrdef scr_seq_0953_319
	scrdef scr_seq_0953_320
	scrdef scr_seq_0953_321
	scrdef scr_seq_0953_322
	scrdef scr_seq_0953_323
	scrdef scr_seq_0953_324
	scrdef scr_seq_0953_325
	scrdef scr_seq_0953_326
	scrdef scr_seq_0953_327
	scrdef scr_seq_0953_328
	scrdef scr_seq_0953_329
	scrdef scr_seq_0953_330
	scrdef scr_seq_0953_331
	scrdef scr_seq_0953_332
	scrdef scr_seq_0953_333
	scrdef scr_seq_0953_334
	scrdef scr_seq_0953_335
	scrdef scr_seq_0953_336
	scrdef scr_seq_0953_337
	scrdef scr_seq_0953_338
	scrdef scr_seq_0953_339
	scrdef scr_seq_0953_340
	scrdef scr_seq_0953_341
	scrdef scr_seq_0953_342
	scrdef scr_seq_0953_343
	scrdef scr_seq_0953_344
	scrdef scr_seq_0953_345
	scrdef scr_seq_0953_346
	scrdef scr_seq_0953_347
	scrdef scr_seq_0953_348
	scrdef scr_seq_0953_349
	scrdef scr_seq_0953_350
	scrdef scr_seq_0953_351
	scrdef scr_seq_0953_352
	scrdef scr_seq_0953_353
	scrdef scr_seq_0953_354
	scrdef scr_seq_0953_355
	scrdef scr_seq_0953_356
	scrdef scr_seq_0953_357
	scrdef scr_seq_0953_358
	scrdef scr_seq_0953_359
	scrdef scr_seq_0953_360
	scrdef scr_seq_0953_361
	scrdef scr_seq_0953_362
	scrdef scr_seq_0953_363
	scrdef scr_seq_0953_364
	scrdef scr_seq_0953_365
	scrdef scr_seq_0953_366
	scrdef scr_seq_0953_367
	scrdef scr_seq_0953_368
	scrdef scr_seq_0953_369
	scrdef scr_seq_0953_370
	scrdef scr_seq_0953_371
	scrdef scr_seq_0953_372
	scrdef scr_seq_0953_373
	scrdef scr_seq_0953_374
	scrdef scr_seq_0953_375
	scrdef scr_seq_0953_376
	scrdef scr_seq_0953_377
	scrdef scr_seq_0953_378
	scrdef scr_seq_0953_379
	scrdef scr_seq_0953_380
	scrdef scr_seq_0953_381
	scrdef scr_seq_0953_382
	scrdef scr_seq_0953_383
	scrdef scr_seq_0953_384
	scrdef scr_seq_0953_385
	scrdef scr_seq_0953_386
	scrdef scr_seq_0953_387
	scrdef scr_seq_0953_388
	scrdef scr_seq_0953_389
	scrdef scr_seq_0953_390
	scrdef scr_seq_0953_391
	scrdef scr_seq_0953_392
	scrdef scr_seq_0953_393
	scrdef scr_seq_0953_394
	scrdef scr_seq_0953_395
	scrdef scr_seq_0953_396
	scrdef scr_seq_0953_397
	scrdef scr_seq_0953_398
	scrdef scr_seq_0953_399
	scrdef scr_seq_0953_400
	scrdef scr_seq_0953_401
	scrdef scr_seq_0953_402
	scrdef scr_seq_0953_403
	scrdef scr_seq_0953_404
	scrdef scr_seq_0953_405
	scrdef scr_seq_0953_406
	scrdef scr_seq_0953_407
	scrdef scr_seq_0953_408
	scrdef scr_seq_0953_409
	scrdef scr_seq_0953_410
	scrdef scr_seq_0953_411
	scrdef scr_seq_0953_412
	scrdef scr_seq_0953_413
	scrdef scr_seq_0953_414
	scrdef scr_seq_0953_415
	scrdef scr_seq_0953_416
	scrdef scr_seq_0953_417
	scrdef scr_seq_0953_418
	scrdef scr_seq_0953_419
	scrdef scr_seq_0953_420
	scrdef scr_seq_0953_421
	scrdef scr_seq_0953_422
	scrdef scr_seq_0953_423
	scrdef scr_seq_0953_424
	scrdef scr_seq_0953_425
	scrdef scr_seq_0953_426
	scrdef scr_seq_0953_427
	scrdef scr_seq_0953_428
	scrdef scr_seq_0953_429
	scrdef scr_seq_0953_430
	scrdef scr_seq_0953_431
	scrdef scr_seq_0953_432
	scrdef scr_seq_0953_433
	scrdef scr_seq_0953_434
	scrdef scr_seq_0953_435
	scrdef scr_seq_0953_436
	scrdef scr_seq_0953_437
	scrdef scr_seq_0953_438
	scrdef scr_seq_0953_439
	scrdef scr_seq_0953_440
	scrdef scr_seq_0953_441
	scrdef scr_seq_0953_442
	scrdef scr_seq_0953_443
	scrdef scr_seq_0953_444
	scrdef scr_seq_0953_445
	scrdef scr_seq_0953_446
	scrdef scr_seq_0953_447
	scrdef scr_seq_0953_448
	scrdef scr_seq_0953_449
	scrdef scr_seq_0953_450
	scrdef scr_seq_0953_451
	scrdef scr_seq_0953_452
	scrdef scr_seq_0953_453
	scrdef scr_seq_0953_454
	scrdef scr_seq_0953_455
	scrdef scr_seq_0953_456
	scrdef scr_seq_0953_457
	scrdef scr_seq_0953_458
	scrdef scr_seq_0953_459
	scrdef scr_seq_0953_460
	scrdef scr_seq_0953_461
	scrdef scr_seq_0953_462
	scrdef scr_seq_0953_463
	scrdef scr_seq_0953_464
	scrdef scr_seq_0953_465
	scrdef scr_seq_0953_466
	scrdef scr_seq_0953_467
	scrdef scr_seq_0953_468
	scrdef scr_seq_0953_469
	scrdef scr_seq_0953_470
	scrdef scr_seq_0953_471
	scrdef scr_seq_0953_472
	scrdef scr_seq_0953_473
	scrdef scr_seq_0953_474
	scrdef scr_seq_0953_475
	scrdef scr_seq_0953_476
	scrdef scr_seq_0953_477
	scrdef scr_seq_0953_478
	scrdef scr_seq_0953_479
	scrdef scr_seq_0953_480
	scrdef scr_seq_0953_481
	scrdef scr_seq_0953_482
	scrdef scr_seq_0953_483
	scrdef scr_seq_0953_484
	scrdef scr_seq_0953_485
	scrdef scr_seq_0953_486
	scrdef scr_seq_0953_487
	scrdef scr_seq_0953_488
	scrdef scr_seq_0953_489
	scrdef scr_seq_0953_490
	scrdef scr_seq_0953_491
	scrdef scr_seq_0953_492
	scrdef scr_seq_0953_493
	scrdef scr_seq_0953_494
	scrdef scr_seq_0953_495
	scrdef scr_seq_0953_496
	scrdef scr_seq_0953_497
	scrdef scr_seq_0953_498
	scrdef scr_seq_0953_499
	scrdef scr_seq_0953_500
	scrdef scr_seq_0953_501
	scrdef scr_seq_0953_502
	scrdef scr_seq_0953_503
	scrdef scr_seq_0953_504
	scrdef scr_seq_0953_505
	scrdef scr_seq_0953_506
	scrdef scr_seq_0953_507
	scrdef scr_seq_0953_508
	scrdef scr_seq_0953_509
	scrdef scr_seq_0953_510
	scrdef scr_seq_0953_511
	scrdef scr_seq_0953_512
	scrdef scr_seq_0953_513
	scrdef scr_seq_0953_514
	scrdef scr_seq_0953_515
	scrdef scr_seq_0953_516
	scrdef scr_seq_0953_517
	scrdef scr_seq_0953_518
	scrdef scr_seq_0953_519
	scrdef scr_seq_0953_520
	scrdef scr_seq_0953_521
	scrdef scr_seq_0953_522
	scrdef scr_seq_0953_523
	scrdef scr_seq_0953_524
	scrdef scr_seq_0953_525
	scrdef scr_seq_0953_526
	scrdef scr_seq_0953_527
	scrdef scr_seq_0953_528
	scrdef scr_seq_0953_529
	scrdef scr_seq_0953_530
	scrdef scr_seq_0953_531
	scrdef scr_seq_0953_532
	scrdef scr_seq_0953_533
	scrdef scr_seq_0953_534
	scrdef scr_seq_0953_535
	scrdef scr_seq_0953_536
	scrdef scr_seq_0953_537
	scrdef scr_seq_0953_538
	scrdef scr_seq_0953_539
	scrdef scr_seq_0953_540
	scrdef scr_seq_0953_541
	scrdef scr_seq_0953_542
	scrdef scr_seq_0953_543
	scrdef scr_seq_0953_544
	scrdef scr_seq_0953_545
	scrdef scr_seq_0953_546
	scrdef scr_seq_0953_547
	scrdef scr_seq_0953_548
	scrdef scr_seq_0953_549
	scrdef scr_seq_0953_550
	scrdef scr_seq_0953_551
	scrdef scr_seq_0953_552
	scrdef scr_seq_0953_553
	scrdef scr_seq_0953_554
	scrdef scr_seq_0953_555
	scrdef scr_seq_0953_556
	scrdef scr_seq_0953_557
	scrdef scr_seq_0953_558
	scrdef scr_seq_0953_559
	scrdef scr_seq_0953_560
	scrdef scr_seq_0953_561
	scrdef scr_seq_0953_562
	scrdef scr_seq_0953_563
	scrdef scr_seq_0953_564
	scrdef scr_seq_0953_565
	scrdef scr_seq_0953_566
	scrdef scr_seq_0953_567
	scrdef scr_seq_0953_568
	scrdef scr_seq_0953_569
	scrdef scr_seq_0953_570
	scrdef scr_seq_0953_571
	scrdef scr_seq_0953_572
	scrdef scr_seq_0953_573
	scrdef scr_seq_0953_574
	scrdef scr_seq_0953_575
	scrdef scr_seq_0953_576
	scrdef scr_seq_0953_577
	scrdef scr_seq_0953_578
	scrdef scr_seq_0953_579
	scrdef scr_seq_0953_580
	scrdef scr_seq_0953_581
	scrdef scr_seq_0953_582
	scrdef scr_seq_0953_583
	scrdef scr_seq_0953_584
	scrdef scr_seq_0953_585
	scrdef scr_seq_0953_586
	scrdef scr_seq_0953_587
	scrdef scr_seq_0953_588
	scrdef scr_seq_0953_589
	scrdef scr_seq_0953_590
	scrdef scr_seq_0953_591
	scrdef scr_seq_0953_592
	scrdef scr_seq_0953_593
	scrdef scr_seq_0953_594
	scrdef scr_seq_0953_595
	scrdef scr_seq_0953_596
	scrdef scr_seq_0953_597
	scrdef scr_seq_0953_598
	scrdef scr_seq_0953_599
	scrdef scr_seq_0953_600
	scrdef scr_seq_0953_601
	scrdef scr_seq_0953_602
	scrdef scr_seq_0953_603
	scrdef scr_seq_0953_604
	scrdef scr_seq_0953_605
	scrdef scr_seq_0953_606
	scrdef scr_seq_0953_607
	scrdef scr_seq_0953_608
	scrdef scr_seq_0953_609
	scrdef scr_seq_0953_610
	scrdef scr_seq_0953_611
	scrdef scr_seq_0953_612
	scrdef scr_seq_0953_613
	scrdef scr_seq_0953_614
	scrdef scr_seq_0953_615
	scrdef scr_seq_0953_616
	scrdef scr_seq_0953_617
	scrdef scr_seq_0953_618
	scrdef scr_seq_0953_619
	scrdef scr_seq_0953_620
	scrdef scr_seq_0953_621
	scrdef scr_seq_0953_622
	scrdef scr_seq_0953_623
	scrdef scr_seq_0953_624
	scrdef scr_seq_0953_625
	scrdef scr_seq_0953_626
	scrdef scr_seq_0953_627
	scrdef scr_seq_0953_628
	scrdef scr_seq_0953_629
	scrdef scr_seq_0953_630
	scrdef scr_seq_0953_631
	scrdef scr_seq_0953_632
	scrdef scr_seq_0953_633
	scrdef scr_seq_0953_634
	scrdef scr_seq_0953_635
	scrdef scr_seq_0953_636
	scrdef scr_seq_0953_637
	scrdef scr_seq_0953_638
	scrdef scr_seq_0953_639
	scrdef scr_seq_0953_640
	scrdef scr_seq_0953_641
	scrdef scr_seq_0953_642
	scrdef scr_seq_0953_643
	scrdef scr_seq_0953_644
	scrdef scr_seq_0953_645
	scrdef scr_seq_0953_646
	scrdef scr_seq_0953_647
	scrdef scr_seq_0953_648
	scrdef scr_seq_0953_649
	scrdef scr_seq_0953_650
	scrdef scr_seq_0953_651
	scrdef scr_seq_0953_652
	scrdef scr_seq_0953_653
	scrdef scr_seq_0953_654
	scrdef scr_seq_0953_655
	scrdef scr_seq_0953_656
	scrdef scr_seq_0953_657
	scrdef scr_seq_0953_658
	scrdef scr_seq_0953_659
	scrdef scr_seq_0953_660
	scrdef scr_seq_0953_661
	scrdef scr_seq_0953_662
	scrdef scr_seq_0953_663
	scrdef scr_seq_0953_664
	scrdef scr_seq_0953_665
	scrdef scr_seq_0953_666
	scrdef scr_seq_0953_667
	scrdef scr_seq_0953_668
	scrdef scr_seq_0953_669
	scrdef scr_seq_0953_670
	scrdef scr_seq_0953_671
	scrdef scr_seq_0953_672
	scrdef scr_seq_0953_673
	scrdef scr_seq_0953_674
	scrdef scr_seq_0953_675
	scrdef scr_seq_0953_676
	scrdef scr_seq_0953_677
	scrdef scr_seq_0953_678
	scrdef scr_seq_0953_679
	scrdef scr_seq_0953_680
	scrdef scr_seq_0953_681
	scrdef scr_seq_0953_682
	scrdef scr_seq_0953_683
	scrdef scr_seq_0953_684
	scrdef scr_seq_0953_685
	scrdef scr_seq_0953_686
	scrdef scr_seq_0953_687
	scrdef scr_seq_0953_688
	scrdef scr_seq_0953_689
	scrdef scr_seq_0953_690
	scrdef scr_seq_0953_691
	scrdef scr_seq_0953_692
	scrdef scr_seq_0953_693
	scrdef scr_seq_0953_694
	scrdef scr_seq_0953_695
	scrdef scr_seq_0953_696
	scrdef scr_seq_0953_697
	scrdef scr_seq_0953_698
	scrdef scr_seq_0953_699
	scrdef scr_seq_0953_700
	scrdef scr_seq_0953_701
	scrdef scr_seq_0953_702
	scrdef scr_seq_0953_703
	scrdef scr_seq_0953_704
	scrdef scr_seq_0953_705
	scrdef scr_seq_0953_706
	scrdef scr_seq_0953_707
	scrdef scr_seq_0953_708
	scrdef scr_seq_0953_709
	scrdef scr_seq_0953_710
	scrdef scr_seq_0953_711
	scrdef scr_seq_0953_712
	scrdef scr_seq_0953_713
	scrdef scr_seq_0953_714
	scrdef scr_seq_0953_715
	scrdef scr_seq_0953_716
	scrdef scr_seq_0953_717
	scrdef scr_seq_0953_718
	scrdef scr_seq_0953_719
	scrdef scr_seq_0953_720
	scrdef scr_seq_0953_721
	scrdef scr_seq_0953_722
	scrdef scr_seq_0953_723
	scrdef scr_seq_0953_724
	scrdef scr_seq_0953_725
	scrdef scr_seq_0953_726
	scrdef scr_seq_0953_727
	scrdef scr_seq_0953_728
	scrdef scr_seq_0953_729
	scrdef scr_seq_0953_730
	scrdef scr_seq_0953_731
	scrdef scr_seq_0953_732
	scrdef scr_seq_0953_733
	scrdef scr_seq_0953_734
	scrdef scr_seq_0953_735
	scrdef scr_seq_0953_736
	scrdef scr_seq_0953_737
	scrdef scr_seq_0953_738
	scrdef scr_seq_0953_739
	scrdef_end

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
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_trainer_num VAR_SPECIAL_x8004
	load_phone_dat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	scrcmd_574 VAR_SPECIAL_x8001, VAR_SPECIAL_LAST_TALKED
	compare VAR_SPECIAL_x8001, 51
	call_if_eq _0E57
	compare VAR_SPECIAL_x8001, 52
	call_if_eq _0E57
	compare VAR_SPECIAL_x8001, 53
	call_if_eq _0E57
	compare VAR_SPECIAL_x8001, 54
	call_if_eq _0E57
	goto_if_defeated VAR_SPECIAL_x8004, _0C9C
	trainer_is_double_battle VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0C13
	party_check_for_double VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0E3B
	goto _0C13
	.byte 0x02, 0x00
_0C13:
	encounter_music VAR_SPECIAL_x8004
	openmsg
	get_trainer_msg_params VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	trainer_message VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	goto _0C2F
	.byte 0x02, 0x00
_0C2F:
	closemsg
	scrcmd_454
	trainer_battle VAR_SPECIAL_x8004, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0D99
	copyvar VAR_TEMP_x4012, VAR_SPECIAL_x8004
	get_trainer_num VAR_SPECIAL_x8006
	goto_if_defeated VAR_SPECIAL_x8006, _0C7F
	scrcmd_317 1
	call _0D9F
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _0DCF
	settrainerflag VAR_TEMP_x4012
	releaseall
	end

_0C7F:
	settrainerflag VAR_TEMP_x4012
	scrcmd_462 VAR_TEMP_x4010
	get_phone_contact_random_gift_berry VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0D54
	releaseall
	end

_0C9C:
	compare VAR_TEMP_x4010, 255
	goto_if_eq _0CE0
	get_phone_book_rematch VAR_TEMP_x4010, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0D02
	get_phone_contact_gift_item VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0D54
	call _0D9F
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0CF8
_0CE0:
	openmsg
	get_trainer_msg_params VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	trainer_message VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0CF8:
	call _0DE4
	releaseall
	end

_0D02:
	copyvar VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	trainer_is_double_battle VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0D32
	party_check_for_double VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0E3B
	goto _0D32
	.byte 0x02, 0x00
_0D32:
	encounter_music VAR_SPECIAL_x8004
	openmsg
	get_rematch_msg_params VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	trainer_message VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8007
	goto _0C2F
	.byte 0x02, 0x00
_0D54:
	get_phone_contact_msg_ids 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	buffer_players_name 0
	msgbox_extern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0D8F
	callstd std_bag_is_full
	goto _0D93

_0D8F:
	callstd std_obtain_item_verbose
_0D93:
	closemsg
	releaseall
	end

_0D99:
	white_out
	releaseall
	end

_0D9F:
	compare VAR_TEMP_x4010, 255
	goto_if_eq _0DC7
	check_registered_phone_number VAR_TEMP_x4010, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0DC7
	setvar VAR_SPECIAL_RESULT, 1
	return

_0DC7:
	setvar VAR_SPECIAL_RESULT, 0
	return

_0DCF:
	get_phone_contact_msg_ids 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	msgbox_extern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	goto _0DF9
	.byte 0x02, 0x00
_0DE4:
	get_phone_contact_msg_ids 3, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	msgbox_extern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	goto _0DF9
	.byte 0x02, 0x00
_0DF9:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0E28
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0040_00101
	get_phone_contact_msg_ids 1, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	register_gear_number VAR_TEMP_x4010
	goto _0E2F

_0E28:
	get_phone_contact_msg_ids 2, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
_0E2F:
	msgbox_extern VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	wait_button_or_walk_away
	closemsg
	return

_0E3B:
	get_trainer_num VAR_SPECIAL_x8004
	openmsg
	get_trainer_msg_params VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	trainer_message VAR_SPECIAL_x8004, VAR_SPECIAL_x8002
	wait_button
	closemsg
	releaseall
	end

_0E57:
	apply_movement VAR_SPECIAL_LAST_TALKED, _0EBC
	wait_movement
	get_player_facing VAR_SPECIAL_x8000
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _0E9B
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _0EA3
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _0EAB
	compare VAR_SPECIAL_x8000, 3
	call_if_eq _0EB3
	return

_0E9B:
	scrcmd_109 VAR_SPECIAL_LAST_TALKED, 15
	return

_0EA3:
	scrcmd_109 VAR_SPECIAL_LAST_TALKED, 14
	return

_0EAB:
	scrcmd_109 VAR_SPECIAL_LAST_TALKED, 17
	return

_0EB3:
	scrcmd_109 VAR_SPECIAL_LAST_TALKED, 16
	return
	.byte 0x00

_0EBC:
	step 101, 1
	step_end
scr_seq_0953_739:
	wait_following_pokemon_movement
	lockall
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0EDD
	release obj_partner_poke
_0EDD:
	get_trainer_eye_type VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0F0A
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F9C
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _107D
	end

_0F0A:
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	load_phone_dat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	encounter_music VAR_SPECIAL_x8004
	scrcmd_315
	get_trainer_path_to_player 0
	call _0F87
	scrcmd_316
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	openmsg
	trainer_message VAR_SPECIAL_x8004, 0
	closemsg
	trainer_battle VAR_SPECIAL_x8004, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1176
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	settrainerflag VAR_SPECIAL_x8004
	scrcmd_317 0
	call _0D9F
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _0DCF
	releaseall
	end

_0F87:
	trainer_step_towards_player 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0F87
	return

_0F9C:
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	load_phone_dat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	compare VAR_TEMP_x4010, 255
	goto_if_ne _0FC7
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	load_phone_dat VAR_SPECIAL_RESULT, VAR_TEMP_x4010
_0FC7:
	encounter_music VAR_SPECIAL_x8004
	get_trainer_path_to_player 0
	get_trainer_path_to_player 1
	call _1055
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	openmsg
	trainer_message VAR_SPECIAL_x8004, 3
	closemsg
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	openmsg
	trainer_message VAR_SPECIAL_x8005, 7
	closemsg
	trainer_battle VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1176
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	settrainerflag VAR_SPECIAL_x8004
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	settrainerflag VAR_SPECIAL_x8005
	call _0D9F
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _0DCF
	releaseall
	end

_1055:
	trainer_step_towards_player 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1055
	trainer_step_towards_player 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1055
	return

_107D:
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	load_phone_dat VAR_SPECIAL_x8004, VAR_TEMP_x4010
	compare VAR_TEMP_x4010, 255
	goto_if_ne _10A8
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	load_phone_dat VAR_SPECIAL_RESULT, VAR_TEMP_x4010
_10A8:
	encounter_music VAR_SPECIAL_x8004
	get_trainer_path_to_player 0
	call _114C
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	openmsg
	trainer_message VAR_SPECIAL_x8004, 0
	closemsg
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	encounter_music VAR_SPECIAL_x8005
	get_trainer_path_to_player 1
	call _1161
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	openmsg
	trainer_message VAR_SPECIAL_x8005, 0
	closemsg
	trainer_battle VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1176
	get_eye_trainer_num 0, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	settrainerflag VAR_SPECIAL_x8004
	get_eye_trainer_num 1, VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	settrainerflag VAR_SPECIAL_x8005
	call _0D9F
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _0DCF
	releaseall
	end

_114C:
	trainer_step_towards_player 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _114C
	return

_1161:
	trainer_step_towards_player 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _1161
	return

_1176:
	white_out
	releaseall
	end
	.balign 4, 0
