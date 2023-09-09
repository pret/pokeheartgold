#ifndef CONSTANTS_MAPS_ALIAS_H
#define CONSTANTS_MAPS_ALIAS_H

#ifndef POKEHEARTGOLD_CONSTANTS_MAPS_H
#define POKEHEARTGOLD_CONSTANTS_MAPS_H

/*
 * T## = Town
 * W## = Water route
 * R## = Route
 * T##R = Room (?) (same for if you replace T with D, R, etc.)
 * T##GYM = Gym
 * T##PC = pokemon center
 * T##FS = Friendly Shop/Pokemart
 * D = Dungeon (?)
 * P = Port (as in a cargo/ship port)
 */

#define MAP_EVERYWHERE                          0
#define MAP_NOTHING                             1
#define MAP_UNION                               2
#define MAP_UG                                  3
#define MAP_DIRECT2                             4
#define MAP_DIRECT4                             5
#define MAP_D17R1101                            6
#define MAP_D18R0101                            7
#define MAP_D24                                 8
#define MAP_R01                                 9
#define MAP_R02                                10
#define MAP_R03                                11
#define MAP_R04                                12
#define MAP_R05                                13
#define MAP_R06                                14
#define MAP_R07                                15
#define MAP_R08                                16
#define MAP_R09                                17
#define MAP_R10                                18
#define MAP_R11                                19
#define MAP_R12                                20
#define MAP_R13                                21
#define MAP_R14                                22
#define MAP_R15                                23
#define MAP_R16                                24
#define MAP_R17                                25
#define MAP_R18                                26
#define MAP_R22                                27
#define MAP_R24                                28
#define MAP_R25                                29
#define MAP_R26                                30
#define MAP_R27                                31
#define MAP_R28                                32
#define MAP_R29                                33
#define MAP_R30                                34
#define MAP_R31                                35
#define MAP_R32                                36
#define MAP_R33                                37
#define MAP_R34                                38
#define MAP_R35                                39
#define MAP_R36                                40
#define MAP_R37                                41
#define MAP_R38                                42
#define MAP_R39                                43
#define MAP_R42                                44
#define MAP_R43                                45
#define MAP_R44                                46
#define MAP_R45                                47
#define MAP_ROUTE_46                        MAP_R46         // Route 46
#define MAP_PALLET_TOWN                     MAP_T01         // Pallet Town overworld
#define MAP_VIRIDIAN_CITY                   MAP_T02         // Viridian City overworld
#define MAP_PEWTER_CITY                     MAP_T03         // Pewter City overworld
#define MAP_CERULEAN_CITY                   MAP_T04         // Cerulean City overworld
#define MAP_LAVENDER_TOWN                   MAP_T05         // Lavender Town overworld
#define MAP_VERMILLION_CITY                 MAP_T06         // Vermillion City overworld
#define MAP_CELADON_CITY                    MAP_T07         // Celadon City overworld
#define MAP_FUCHSIA_CITY                    MAP_T08         // Fuchsia City overworld
#define MAP_CINNABAR_ISLAND                 MAP_T09         // Cinnabar Island overworld
#define MAP_INDIGO_PLATEAU                  MAP_T10         // Indigo Plateau overworld
#define MAP_SAFFRON_CITY                    MAP_T11         // Saffron City overworld
#define MAP_NEW_BARK_TOWN                   MAP_T20         // New Bark Town overworld
#define MAP_NEW_BARK_LAB_BOTTOM             MAP_T20R0101    // Professor Elm's Lab (Downstairs)
#define MAP_NEW_BARK_LAB_TOP                MAP_T20R0102    // Professor Elm's Lab (Upstairs)
#define MAP_PLAYER_HOUSE_1F                 MAP_T20R0201    // Player's house (Downstairs)
#define MAP_PLAYER_HOUSE_2F                 MAP_T20R0202    // Player's house (Upstairs)
#define MAP_NEW_BARK_HOUSE_3                MAP_T20R0301    // New Bark house 3 (bottom left house)
#define MAP_FRIENDS_HOUSE_1F                MAP_T20R0401    // Ethan/Lyra's house (Downstairs)
#define MAP_CHERRYGROVE_CITY                MAP_T21         // Cherrygrove City overworld
#define MAP_CHERRYGROVE_MART                MAP_T21FS0101   // Cherrygrove City's Pokémart
#define MAP_CHERRYGROVE_POKECENTER_1F       MAP_T21PC0101   // Cherrygrove City's Pokémon Center
#define MAP_CHERRYGROVE_HOUSE_3             MAP_T21R0301    // Cherrygrove house 3 (leftmost house)
#define MAP_GUIDE_GENTS_HOUSE               MAP_T21R0401    // Guide Gent's house (middle house)
#define MAP_CHERRYGROVE_HOUSE_5             MAP_T21R0501    // Cherrygrove house 5 (rightmost house)
#define MAP_VIOLET_CITY                     MAP_T22         // Violet City overworld
#define MAP_AZALEA_TOWN                     MAP_T23         // Azalea Town overworld
#define MAP_CIANWOOD_CITY                   MAP_T24         // Cianwood City overworld
#define MAP_GOLDENROD_CITY                  MAP_T25         // Goldenrod City overworld
#define MAP_OLIVINE_CITY                    MAP_T26         // Olivine City overworld
#define MAP_ECRUTEAK_CITY                   MAP_T27         // Ecruteak City overworld
#define MAP_ECRUTEAK_MART                   MAP_T27FS0101   // Ecruteak City's Pokémart
#define MAP_ECRUTEAK_GYM                    MAP_T27GYM0101  // Ecruteak City's Gym
#define MAP_ECRUTEAK_POKECENTER_1F          MAP_T27PC0101   // Ecruteak City's Pokémon Center
#define MAP_ECRUTEAK_HOUSE_1                MAP_T27R0101    // Ecruteak house 1, has no exit. Removed? Hangs upon enter
#define MAP_ECRUTEAK_BARRIER_STATION        MAP_T27R0201    // Ecruteak City - Barrier Station to Bell Tower
#define MAP_ECRUTEAK_HOUSE_8                MAP_T27R0801    // Ecruteak City - Dowsing Machine house (right of gym) Rename?
#define MAP_ECRUTEAK_HOUSE_4                MAP_T27R0401    // Ecruteak City building 4 (house above gym)
#define MAP_ECRUTEAK_DANCE_THEATER          MAP_T27R0501    // Ecruteak City Dance Theater
#define MAP_MAHOGANY_TOWN                   MAP_T28         // Mahogany Town overworld
#define MAP_LAKE_OF_RAGE                    MAP_T29         // Lake of Rage
#define MAP_BLACKTHORN_CITY                 MAP_T30         // Blackthorn City
#define MAP_MT_SILVER_EXTERIOR              MAP_T31         // Mt. Silver Exterior (Johto)
#define MAP_ROUTE_19                        MAP_W19         // Route 19 (W = Water?) "Sea Route #" on bulbapedia
#define MAP_ROUTE_20                        MAP_W20         // Route 20
#define MAP_ROUTE_21                        MAP_W21         // Route 21
#define MAP_ROUTE_40                        MAP_W40         // Route 40
#define MAP_ROUTE_41                        MAP_W41         // Route 41
#define MAP_NATIONAL_PARK                   MAP_D22R0101    // National Park
#define MAP_ROUTE_31_WEST_GATE              MAP_R31R0101    // Route 31 west gate/Violet City east gate
#define MAP_ROUTE_32_WEST_GATE              MAP_R32R0101    // Route 32 west gate/Ruins of Alph east gate
#define MAP_UNION_CAVE_B1F_ENTR_ENTR        MAP_D25R0101    // Southwest entrance into Union Cave from Ruins of Alph. Leads to a hallway that leads to B1F (hence entrance entrance).
#define MAP_AZALEA_WEST_GATE                MAP_T23R0101    // Azalea Town west gate/Ilex Forest south gate (facing L/R)
#define MAP_ROUTE_35_SOUTH_GATE             MAP_R35R0101    // Route 35 south gate/Goldenrod City north gate
#define MAP_ROUTE_35_NORTH_GATE             MAP_R35R0201    // Route 35 north gate. Connects to National Park and Pokéathlon Dome
#define MAP_ROUTE_36_SOUTH_GATE             MAP_R36R0101    // Route 36 south gate/Ruins of Alph north gate
#define MAP_ROUTE_36_WEST_GATE              MAP_R36R0201    // Route 36 west gate/National Park east gate
#define MAP_ECRUTEAK_GATE_UNUSED            MAP_T27R0601    // Gate associated with Ecruteak (T27). Has no exits.
#define MAP_DIGLETTS_CAVE_BOTTOM_EXIT       MAP_D01R0101    // Diglett's Cave Exit to Route 11/Vermillion City
#define MAP_MT_MOON_1F                      MAP_D02R0101    // Mt. Moon 1F
#define MAP_ROCK_TUNNEL_1F                  MAP_D05R0101    // Rock Tunnel 1F
#define MAP_PAL_PARK_PARK                   MAP_D10R0101    // Pal Park's park area
#define MAP_SPROUT_TOWER_1F                 MAP_D15R0101    // Sprout Tower 1F
#define MAP_BELL_TOWER_1F                   MAP_D17R0101    // Bell Tower 1F
#define MAP_GOLDENROD_RADIO_TOWER_1F        MAP_D23R0101    // Goldenrod Radio Tower 1F
#define MAP_RUINS_OF_ALPH                   MAP_D24R0101    // Ruins of Alph overworld
#define MAP_SLOWPOKE_WELL_ENTRANCE          MAP_D26R0101    // Slowpoke Well Entrance Cave
#define MAP_OLIVINE_LIGHTHOUSE_1F           MAP_D27R0101    // Olivine Lighthouse 1F
#define MAP_TEAM_ROCKET_HQ_1F               MAP_D35R0101    // Team Rocket HQ 1F (Mahogany Town Shop Entrance Room Thing)
#define MAP_ILEX_FOREST                     MAP_D36R0101    // Ilex Forest
#define MAP_GOLDENROD_TUNNEL_ENTRANCES      MAP_D37R0101    // Goldenrod Tunnel entrances (both on same map, plus warehouse entrance)
#define MAP_MT_MORTAR_1F_ENTRANCE           MAP_D38R0101    // Mt. Mortar 1F Entrance
#define MAP_D39R0101                          120   // Ice Path 1F      //todo: verify these seven
#define MAP_D40R0101                          121   // Whirl Islands 1F Northeast (?)
#define MAP_D41R0101                          122   // Mt. Silver 1F (?)
#define MAP_D42R0101                          123   // Dark Cave - north (?)
#define MAP_D43R0101                          124   // Victory Road 1F (?)
#define MAP_D44R0101                          125   // Dragon's Den Entrance (?)
#define MAP_D45R0101                          126   // Tohjo Falls (?)
#define MAP_APRICORN_MANS_HOUSE             MAP_R30R0101    // Apricorn man's house on Route 30
#define MAP_ECRUTEAK_UNION_ROOM             MAP_T27PC0102   // Union Room/Wi-Fi CLub associated with Ecruteak's Pokécenter
#define MAP_ECRUTEAK_PCCC_1V1               MAP_T27PC0103   // Pokémon Communication Club Colosseum 1v1 room associated with Ecruteak's Pokécenter
#define MAP_ECRUTEAK_PCCC_2V2               MAP_T27PC0104   // Pokémon Communication Club Colosseum 2v2 room associated with Ecruteak's Pokécenter
#define MAP_ECRUTEAK_POKECENTER_B1F         MAP_T27PC0105   // Ecruteak City's Pokémon Center lower floor
#define MAP_R42R0101                          132
#define MAP_T28R0201                          133
#define MAP_R29R0101                          134
#define MAP_T22GYM0101                        135
#define MAP_T23GYM0101                        136
#define MAP_T25GYM0101                        137
#define MAP_T26GYM0101                        138
#define MAP_T24GYM0101                        139
#define MAP_T28GYM0101                        140
#define MAP_T30GYM0101                        141
#define MAP_R43R0101                          142
#define MAP_R30R0201                          143
#define MAP_T21PC0102                         144
#define MAP_D03R0101                          145
#define MAP_D11R0101                          146
#define MAP_D46R0101                          147
#define MAP_R09R0101                          148
#define MAP_T22R0701                          149
#define MAP_D22R0201                          150
#define MAP_R47                               151
#define MAP_R48                               152
#define MAP_D25R0102                          153
#define MAP_D25R0103                          154
#define MAP_SPROUT_TOWER_2F                 MAP_D15R0102    // Sprout Tower 2F
#define MAP_SPROUT_TOWER_3F                 MAP_D15R0103    // Sprout Tower 3F
#define MAP_T22FS0101                         157
#define MAP_T22PC0101                         158
#define MAP_T22R0301                          159
#define MAP_T22R0401                          160
#define MAP_T22R0501                          161
#define MAP_T22R0601                          162
#define MAP_T23R0201                          163
#define MAP_T23R0501                          164
#define MAP_T23FS0101                         165
#define MAP_T23PC0101                         166
#define MAP_T22PC0102                         167
#define MAP_T23PC0102                         168
#define MAP_R32PC0101                         169
#define MAP_R32PC0102                         170
#define MAP_R34R0201                          171
#define MAP_R38R0101                          172
#define MAP_D47R0101                          173
#define MAP_D47                               174
#define MAP_ECRUTEAK_HOUSE_3                MAP_T27R0301    // Ecruteak house 3, has no exit. Removed? TODO. test Hangs upon enter
#define MAP_D42R0102                          176
#define MAP_SLOWPOKE_WELL_B1F               MAP_D26R0102    // Slowpoke Well B1F
#define MAP_D43R0102                          178
#define MAP_D43R0103                          179
#define MAP_T23GYM0102                        180
#define MAP_SLOWPOKE_WELL_B2F               MAP_D26R0103    // Slowpoke Well B2F
#define MAP_T25R0201                          182
#define MAP_T25R1101                          183
#define MAP_T25R0601                          184
#define MAP_T25PC0101                         185
#define MAP_GOLDENROD_RADIO_TOWER_2F        MAP_D23R0102    // Goldenrod Radio Tower 2F
#define MAP_GOLDENROD_RADIO_TOWER_3F        MAP_D23R0103    // Goldenrod Radio Tower 3F
#define MAP_GOLDENROD_RADIO_TOWER_4F        MAP_D23R0104    // Goldenrod Radio Tower 4F
#define MAP_GOLDENROD_RADIO_TOWER_5F        MAP_D23R0105    // Goldenrod Radio Tower 5F
#define MAP_GOLDENROD_RADIO_TOWER_LOOKOUT   MAP_D23R0106    // Goldenrod Radio Tower Observation Deck (may need renamed)
#define MAP_T25R1001                          191
#define MAP_T25R1002                          192
#define MAP_T25R1003                          193
#define MAP_T25R1004                          194
#define MAP_T25R1005                          195
#define MAP_T25R1006                          196
#define MAP_T25R0501                          197
#define MAP_T25R0502                          198
#define MAP_GOLDENROD_TUNNEL_B1F            MAP_D37R0102    // Goldenrod Tunnel B1F (also has photo gallery south of main map)
#define MAP_GOLDENROD_DEPARTMENT_BASEMENT   MAP_D37R0103    // Goldenrod Department Store Basement (but it's classified as Goldenrod Tunnel and not the dpt store lol)
#define MAP_GOLDENROD_TUNNEL_B2F            MAP_D37R0104    // Goldenrod Tunnel B2F
#define MAP_GOLDENROD_TUNNEL_WAREHOUSE      MAP_D37R0105    // Goldenrod Tunnel Warehouse B2F
#define MAP_T25R0401                          203
#define MAP_T25R0301                          204
#define MAP_T25R0801                          205
#define MAP_T25R0901                          206
#define MAP_T25R1201                          207
#define MAP_T25R1301                          208
#define MAP_T25R1302                          209
#define MAP_T25R1303                          210
#define MAP_T25R1304                          211
#define MAP_T25R1305                          212
#define MAP_T25R1306                          213
#define MAP_R39R0101                          214
#define MAP_R39R0201                          215
#define MAP_ECRUTEAK_BARRIER_STATION_BACK   MAP_T27R0202    // Back part of Barrier Station to Bell Tower (Connects to Bellchime trail)
#define MAP_D18R0102                          217
#define MAP_D24R0201                          218
#define MAP_T25PC0102                         219
#define MAP_OLIVINE_LIGHTHOUSE_2F           MAP_D27R0102    // Olivine Lighthouse 2F
#define MAP_OLIVINE_LIGHTHOUSE_EXTERIOR     MAP_D27R0103    // Olivine Lighthouse Exterior
#define MAP_OLIVINE_LIGHTHOUSE_3F           MAP_D27R0104    // Olivine Lighthouse 3F
#define MAP_OLIVINE_LIGHTHOUSE_4F           MAP_D27R0105    // Olivine Lighthouse 4F
#define MAP_OLIVINE_LIGHTHOUSE_5F           MAP_D27R0106    // Olivine Lighthouse 5F
#define MAP_OLIVINE_LIGHTHOUSE_LIGHT_ROOM   MAP_D27R0107    // Olivine Lighthouse Light Room
#define MAP_T26PC0101                         226
#define MAP_T26FS0101                         227
#define MAP_T26R0301                          228
#define MAP_T26R0501                          229
#define MAP_T26R0601                          230
#define MAP_T26R0701                          231
#define MAP_T24R0201                          232
#define MAP_T24R0501                          233
#define MAP_T24R0601                          234
#define MAP_T24R0701                          235
#define MAP_T24PC0101                         236
#define MAP_D39R0102                          237
#define MAP_D39R0103                          238
#define MAP_D39R0104                          239
#define MAP_OLIVINE_PORT_BUILDING           MAP_P01R0101    // Olivine Port Building
#define MAP_T24PC0102                         241
#define MAP_D40R0102                          242
#define MAP_D40R0104                          243
#define MAP_D40R0107                          244
#define MAP_R43R0201                          245
#define MAP_T28PC0101                         246
#define MAP_TEAM_ROCKET_HQ_B1F              MAP_D35R0102    // Team Rocket HQ B1F
#define MAP_TEAM_ROCKET_HQ_B2F              MAP_D35R0103    // Team Rocket HQ B2F
#define MAP_TEAM_ROCKET_HQ_B3F              MAP_D35R0104    // Team Rocket HQ B3F
#define MAP_MT_MORTAR_1F_BACK               MAP_D38R0102    // Mt. Mortar 1F back
#define MAP_MT_MORTAR_2F                    MAP_D38R0103    // Mt. Mortar 2F
#define MAP_MT_MORTAR_B1F                   MAP_D38R0104    // Mt. Mortar B1F
#define MAP_D44R0102                          253
#define MAP_C11                               254           // Battle Tower shell? (EVERYWHERE_bin) (Johto)
#define MAP_C11PC0101                         255           // Pokémon Center shell? (EVERYWHERE_bin)
#define MAP_C11PC0102                         256           // Pokémon Center shell B1F? (EVERYWHERE_bin)
#define MAP_C11FS0101                         257           // Pokémart shell?
#define MAP_C11R0101                          258           // House...? empty
#define MAP_C11R0201                          259           // House...? empty
#define MAP_C11R0301                          260           // House...? empty
#define MAP_C11R0401                          261           // House...? empty
#define MAP_C11PC0103                         262           // no idea ngl
#define MAP_D31                               263
#define MAP_D31R0101                          264
#define MAP_D31R0201                          265
#define MAP_D31R0202                          266
#define MAP_D31R0203                          267
#define MAP_D31R0204                          268
#define MAP_D31R0205                          269
#define MAP_D31R0206                          270
#define MAP_D31R0207                          271
#define MAP_D32                               272
#define MAP_D32R0101                          273
#define MAP_D32R0201                          274
#define MAP_D32R0301                          275
#define MAP_D32R0401                          276
#define MAP_D32R0501                          277
#define MAP_D32R0601                          278
#define MAP_D48R0101                          279
#define MAP_D49                               280
#define MAP_D49R0101                          281
#define MAP_D49R0102                          282
#define MAP_D49R0103                          283
#define MAP_D49R0104                          284
#define MAP_D49R0105                          285
#define MAP_D49R0106                          286
#define MAP_D49R0107                          287
#define MAP_D44R0103                          288
#define MAP_T30R0201                          289
#define MAP_T30R0301                          290
#define MAP_T30R0601                          291
#define MAP_T30FS0101                         292
#define MAP_T30PC0101                         293
#define MAP_T29R0101                          294
#define MAP_T29R0201                          295
#define MAP_R26R0101                          296
#define MAP_R26R0201                          297
#define MAP_D45R0102                          298
#define MAP_R22R0101                          299
#define MAP_T10R0101                          300
#define MAP_T10R0201                          301
#define MAP_T10R0301                          302
#define MAP_T10R0401                          303
#define MAP_T10R0501                          304
#define MAP_T10R0601                          305
#define MAP_T10R0701                          306
#define MAP_SS_AQUA_1F                      MAP_P01R0301    // S.S. Aqua 1F
#define MAP_SS_AQUA_CAPTAINS_CABIN          MAP_P01R0302    // S.S. Aqua Captain's Cabin
#define MAP_SS_AQUA_1F_ROOMS_7_AND_8        MAP_P01R0303    // S.S. Aqua 1F rooms 7 & 8
#define MAP_SS_AQUA_1F_ROOMS_5_AND_6        MAP_P01R0304    // S.S. Aqua 1F rooms 5 & 6
#define MAP_SS_AQUA_1F_ROOMS_3_AND_4        MAP_P01R0305    // S.S. Aqua 1F rooms 3 & 4
#define MAP_D24R0202                          312
#define MAP_D24R0203                          313
#define MAP_D24R0204                          314
#define MAP_D24R0205                          315
#define MAP_D24R0206                          316
#define MAP_D24R0207                          317
#define MAP_D24R0208                          318
#define MAP_D24R0209                          319
#define MAP_D24R0210                          320
#define MAP_D24R0102                          321
#define MAP_R27R0101                          322
#define MAP_D24R0211                          323
#define MAP_D24R0212                          324
#define MAP_D24R0213                          325
#define MAP_D24R0214                          326
#define MAP_D24R0215                          327
#define MAP_SS_AQUA_1F_ROOMS_1_AND_2        MAP_P01R0306    // S.S. Aqua 1F rooms 1 & 2
#define MAP_SS_AQUA_B1F                     MAP_P01R0307    // S.S. Aqua B1F
#define MAP_OLIVINE_PORT_BOARDWALK          MAP_P01R0102    // Olivine Port Boardwalk
#define MAP_R34R0101                          331
#define MAP_BELL_TOWER_2F                   MAP_D17R0102    // Bell Tower 2F
#define MAP_BELL_TOWER_3F                   MAP_D17R0103    // Bell Tower 3F
#define MAP_BELL_TOWER_4F                   MAP_D17R0104    // Bell Tower 4F
#define MAP_BELL_TOWER_5F                   MAP_D17R0105    // Bell Tower 5F
#define MAP_BELL_TOWER_6F                   MAP_D17R0106    // Bell Tower 6F
#define MAP_BELL_TOWER_7F                   MAP_D17R0107    // Bell Tower 7F
#define MAP_BELL_TOWER_8F                   MAP_D17R0108    // Bell Tower 8F
#define MAP_BELL_TOWER_9F                   MAP_D17R0109    // Bell Tower 9F
#define MAP_BELL_TOWER_ROOF                 MAP_D17R0110    // Bell Tower Roof  (i promise this is right)
#define MAP_BELL_TOWER_10F                  MAP_D17R0112    // Bell Tower 10F   (they are not switched)
#define MAP_D50R0101                          342
#define MAP_SAF01                             343   // todo: safari Zone probably
#define MAP_SAF02                             344
#define MAP_SAF03                             345
#define MAP_SAF04                             346
#define MAP_SAF05                             347
#define MAP_SAF06                             348
#define MAP_SAF07                             349
#define MAP_SAF08                             350
#define MAP_SAF09                             351
#define MAP_SAF10                             352
#define MAP_SAF11                             353
#define MAP_SAF12                             354
#define MAP_SAF13                             355
#define MAP_SAF14                             356
#define MAP_D47R0102                          357
#define MAP_T06PC0101                         358
#define MAP_T06PC0102                         359
#define MAP_T06FS0101                         360
#define MAP_T06R0101                          361
#define MAP_T06R0301                          362
#define MAP_T06R0401                          363
#define MAP_T06R0601                          364
#define MAP_T06GYM0101                        365
#define MAP_W40R0101                          366
#define MAP_T26PC0102                         367
#define MAP_T28PC0102                         368
#define MAP_T30PC0102                         369
#define MAP_T07R0101                          370
#define MAP_T07R0102                          371
#define MAP_T07R0103                          372
#define MAP_T07R0104                          373
#define MAP_T07R0105                          374
#define MAP_T07R0106                          375
#define MAP_T07R0201                          376
#define MAP_T07R0202                          377
#define MAP_T07R0203                          378
#define MAP_T07R0204                          379
#define MAP_T07R0205                          380
#define MAP_T07R0401                          381
#define MAP_T07R0501                          382
#define MAP_T07R0701                          383
#define MAP_FRIENDS_HOUSE_2F                MAP_T20R0402    // Ethan/Lyra's house (Upstairs)
#define MAP_T24R0801                          385
#define MAP_VERMILION_PORT_BUILDING         MAP_P01R0103    // Vermilion Port Building
#define MAP_VERMILION_PORT_BOARDWALK        MAP_P01R0104    // Vermilion Port Boardwalk
#define MAP_R10R0101                          388
#define MAP_R06R0201                          389
#define MAP_R08R0201                          390
#define MAP_R05R0301                          391
#define MAP_R15R0101                          392
#define MAP_T07PC0101                         393
#define MAP_T07PC0102                         394
#define MAP_T07GYM0101                        395
#define MAP_T28GYM0102                        396
#define MAP_T28GYM0103                        397
#define MAP_T11R0101                          398
#define MAP_T11R0501                          399
#define MAP_T11R0601                          400
#define MAP_T11R0602                          401
#define MAP_T11R0701                          402
#define MAP_T11R0702                          403
#define MAP_T11R0801                          404
#define MAP_T11R0802                          405
#define MAP_T11R0901                          406
#define MAP_T11PC0101                         407
#define MAP_T11PC0102                         408
#define MAP_T11FS0101                         409
#define MAP_T11GYM0101                        410
#define MAP_D32R0102                          411
#define MAP_T25R1202                          412
#define MAP_T25R1203                          413
#define MAP_R02R0101                          414
#define MAP_R16R0101                          415
#define MAP_W20R0101                          416
#define MAP_R02R0201                          417
#define MAP_R02R0301                          418
#define MAP_R02R0401                          419
#define MAP_R02R0501                          420
#define MAP_R16R0201                          421
#define MAP_R16R0301                          422
#define MAP_R18R0101                          423
#define MAP_W19R0101                          424
#define MAP_R11R0101                          425
#define MAP_T04FS0101                         426
#define MAP_T04GYM0101                        427
#define MAP_T04PC0101                         428
#define MAP_T04R0101                          429
#define MAP_T04R0201                          430
#define MAP_T04R0301                          431
#define MAP_T04R0401                          432
#define MAP_T05FS0101                         433
#define MAP_T05PC0101                         434
#define MAP_T05R0201                          435
#define MAP_T05R0301                          436
#define MAP_T05R0401                          437
#define MAP_T05R0601                          438
#define MAP_T05R0701                          439
#define MAP_R25R0101                          440
#define MAP_T25R1007                          441
#define MAP_T07R0107                          442
#define MAP_T07R0206                          443
#define MAP_T07R0207                          444
#define MAP_T11R0703                          445
#define MAP_OLIVINE_LIGHTHOUSE_ELEVATOR     MAP_D27R0108    // Olivine Lighthouse Elevator
#define MAP_GOLDENROD_RADIO_TOWER_ELEVATOR  MAP_D23R0107    // Goldenrod Radio Tower Elevator
#define MAP_D02R0102                          448
#define MAP_D02R0103                          449
#define MAP_D03R0102                          450
#define MAP_D03R0103                          451
#define MAP_ROCK_TUNNEL_B1F                 MAP_D05R0102    // Rock Tunnel B1F
#define MAP_D11R0102                          453
#define MAP_D11R0103                          454
#define MAP_D11R0104                          455
#define MAP_D11R0105                          456
#define MAP_D11R0106                          457
#define MAP_D11R0107                          458
#define MAP_D41R0102                          459
#define MAP_D41R0103                          460
#define MAP_D41R0104                          461
#define MAP_D41R0105                          462
#define MAP_D41R0106                          463
#define MAP_D41R0107                          464
#define MAP_D41R0108                          465
#define MAP_R10PC0101                         466
#define MAP_R10R0201                          467
#define MAP_R05R0101                          468
#define MAP_R05R0201                          469
#define MAP_R06R0101                          470
#define MAP_T03R0101                          471
#define MAP_T03R0201                          472
#define MAP_T03GYM0101                        473
#define MAP_T03FS0101                         474
#define MAP_T03PC0101                         475
#define MAP_T03PC0102                         476
#define MAP_T03R0601                          477
#define MAP_T08FS0101                         478
#define MAP_PAL_PARK_INTERIOR               MAP_T08R0201    // Pal Park Building Interior   (Violet City Building 2)
#define MAP_T08GYM0101                        480
#define MAP_T08R0401                          481
#define MAP_T08PC0101                         482
#define MAP_T08R0601                          483
#define MAP_R10PC0102                         484
#define MAP_T08PC0102                         485
#define MAP_D40R0106                          486
#define MAP_D22R0102                          487
#define MAP_D22R0103                          488
#define MAP_R10R0202                          489
#define MAP_D24R0216                          490
#define MAP_D24R0217                          491
#define MAP_D24R0218                          492
#define MAP_R07R0101                          493
#define MAP_T05PC0102                         494
#define MAP_T04PC0102                         495
#define MAP_T02GYM0101                        496
#define MAP_T02R0201                          497
#define MAP_T02R0301                          498
#define MAP_T02R0302                          499
#define MAP_T02FS0101                         500
#define MAP_T02PC0101                         501
#define MAP_T02PC0102                         502
#define MAP_T01R0101                          503
#define MAP_T01R0201                          504
#define MAP_T01R0301                          505
#define MAP_T01R0102                          506
#define MAP_T01R0202                          507
#define MAP_T09PC0101                         508
#define MAP_T09PC0102                         509
#define MAP_ROUTE_28_HOUSE                  MAP_R28R0101    // Route 28 Steel Wing house
#define MAP_R03PC0101                         511
#define MAP_R03PC0102                         512
#define MAP_D02R0104                          513
#define MAP_MT_SILVER_POKECENTER_1F         MAP_T31PC0101   //Mt. Silver Exterior Pokémon Center 1F
#define MAP_MT_SILVER_POKECENTER_B1F        MAP_T31PC0102   //Mt. Sliver Exterior Pokémon Center B1F
#define MAP_HIROBA                            516       // todo: Hiroba. Wi-Fi Plaza?
#define MAP_R05R0401                          517
#define MAP_D02FS0101                         518
#define MAP_T25R0503                          519
#define MAP_T11R0603                          520
#define MAP_D51R0101                          521
#define MAP_D51R0201                          522
#define MAP_D51R0301                          523
#define MAP_D52R0101                          524
#define MAP_D52R0102                          525
#define MAP_D52R0103                          526
#define MAP_T02R0401                          527
#define MAP_D32PC0101                         528
#define MAP_D32PC0102                         529
#define MAP_D32FS0101                         530
#define MAP_D32R0103                          531
#define MAP_R05R0202                          532
#define MAP_R12R0101                          533
#define MAP_D47PC0101                         534
#define MAP_D47PC0102                         535
#define MAP_T25SP0101                         536   // todo: tf is sp
#define MAP_T07SP0101                         537
#define MAP_R00                               538       //todo: this looks fun!
#define MAP_T10R0801                          539

#endif //POKEHEARTGOLD_CONSTANTS_MAPS_H


#endif //CONSTANTS_MAPS_ALIAS_H
