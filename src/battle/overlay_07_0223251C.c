#include "battle/overlay_07_0223251C.h"

void ov07_02232AFC(BallCapsuleSealEffect *ballCapSealEff, void *param1);
void ov07_02233F30(BallRotation *param0);
void ov07_022341A4(BallRotation *param0, s16 *param1, s16 *param2);
void ov07_022342E4(BallRotation *param0);
void ov07_0223441C(BallRotation *param0);
void ov07_0223441C(BallRotation *param0);

// static
int ov07_0223251C(int a0) {
    if ((a0 >= 1) && (a0 <= 0x18)) {
        return a0 - 1;
    }
    if ((a0 >= 0x3E8) && (a0 <= 0x403)) {
        return a0 - 0x3E8;
    }
    return 3;
}

extern int ov07_02237228[11];

// static
BOOL ov07_02232540(int param0) {
    int v2[11];
    v2 = ov07_02237228;
    BOOL v1 = FALSE;

    for (int v0 = 0; v0 < NELEMS(v2); v0++) {
        if (v2[v0] != param0) {
            continue;
        }

        v1 = TRUE;
        break;
    }

    return v1;
}

extern int ov07_02237188[6];

// static
BOOL ov07_02232580(int param0) {
    int v2[6];
    v2 = ov07_02237188;

    BOOL v1 = FALSE;

    for (int v0 = 0; v0 < NELEMS(v2); v0++) {
        if (v2[v0] != param0) {
            continue;
        }

        v1 = TRUE;
        break;
    }

    return v1;
}

extern int ov07_0223717C[3];

// static
BOOL ov07_022325BC(int param0) {
    int v2[3];
    v2 = ov07_0223717C;

    BOOL v1 = TRUE;

    for (int v0 = 0; v0 < NELEMS(v2); v0++) {
        if (v2[v0] != param0) {
            continue;
        }

        v1 = FALSE;
        break;
    }

    return v1;
}

extern int ov07_0223738C[][2];

// static
int ov07_022325F4(int param0) {
    int v0 = ov07_0223251C(param0);
    return ov07_0223738C[v0][0];
}

// static
int ov07_02232608(int param0) {
    int v0 = ov07_0223251C(param0);
    return ov07_0223738C[v0][1];
}

extern int ov07_0223746C[][3];

// static
int ov07_0223261C(int param0) {
    int v0 = ov07_0223251C(param0);
    return ov07_0223746C[v0][0];
}

// static
int ov07_02232630(int param0) {
    int v0 = ov07_0223251C(param0);
    return ov07_0223746C[v0][2];
}

// static
int ov07_02232644(int param0) {
    int v0 = ov07_0223251C(param0);
    return ov07_0223746C[v0][1];
}

extern int ov07_022375BC[][4];

// static
int ov07_02232658(int param0, int param1) {
    int v0 = ov07_0223251C(param0);
    return ov07_022375BC[v0][param1];
}

// static
BallCapsuleSealEffect *ov07_02232670(enum HeapID heapID) {
    BallCapsuleSealEffect *ballCapSealEff = NULL;

    ballCapSealEff = Heap_Alloc(heapID, sizeof(BallCapsuleSealEffect));

    if (ballCapSealEff == NULL) {
        GF_ASSERT(FALSE);
        return NULL;
    }

    ballCapSealEff->heapID = heapID;
    ballCapSealEff->isActive = 0;

    return ballCapSealEff;
}

BallCapsuleSealEffect *ov07_02232694(enum HeapID heapID, const BallCapsuleConfig *ballCapCfg) {
    BallCapsuleSealEffect *ballCapSealEff = NULL;

    ballCapSealEff = ov07_02232670(heapID);
    ov07_022326C0(ballCapSealEff, ballCapCfg);

    ballCapSealEff->sealCount = 0;

    for (int v1 = 0; v1 < 9; v1++) {
        ballCapSealEff->sealParticleSystems[v1] = NULL;
        ballCapSealEff->seals[v1] = NULL;
        ballCapSealEff->sealActiveFlags[v1] = 0;
    }

    return ballCapSealEff;
}

void ov07_022326C0(BallCapsuleSealEffect *ballCapSealEff, const BallCapsuleConfig *ballCapCfgPtr) {
    ballCapSealEff->ballCapCfg = *ballCapCfgPtr;
    ballCapSealEff->capsuleID = GetMonData(ballCapSealEff->ballCapCfg.mon, MON_DATA_BALL_CAPSULE_ID, NULL);

    GF_ASSERT(ballCapSealEff->capsuleID < 12 + 1);

    if (ballCapSealEff->capsuleID == 0) {
        ballCapSealEff->hasCapsule = 0;

        if (ballCapSealEff->ballCapCfg.ballTypeOverride != 0) {
            ballCapSealEff->ballType = ballCapSealEff->ballCapCfg.ballTypeOverride;
        } else {
            ballCapSealEff->ballType = GetMonData(ballCapSealEff->ballCapCfg.mon, MON_DATA_POKEBALL, NULL);
        }
    } else {
        ballCapSealEff->hasCapsule = 1;
        GetMonData(ballCapSealEff->ballCapCfg.mon, MON_DATA_BALL_CAPSULE, &ballCapSealEff->capsule);
    }
}

// Pikalax is currently decompiling this function
extern int CapsuleMenu_GetSealParticleIndex(u8);

void ov07_02232730(SysTask *param0, void *ballCapSealEffPtr) {
    BallCapsuleSealEffect *ballCapSealEff = ballCapSealEffPtr;
    int i;
    int v2;
    int v3;
    int v4;
    SEAL *seal;

    switch (ballCapSealEff->state) {
    case 0:
        ballCapSealEff->particleNarc = NARC_New(0x5f, ballCapSealEff->heapID);

        for (i = 0; i < 2; i++) {
            seal = CapsuleGetSealI(&ballCapSealEff->capsule, i);

            if (seal == NULL) {
                continue;
            }

            v2 = SealOnCapsuleGetID(seal);

            if (v2 == 0) {
                continue;
            }

            if (v2 >= 0x51) {
                continue;
            }

            v3 = CapsuleMenu_GetSealParticleIndex(v2);

            ballCapSealEff->seals[ballCapSealEff->sealCount] = seal;
            GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL);
            ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] = ov07_0221FEE4(ballCapSealEff->particleNarc, ballCapSealEff->heapID, v3, 0);

            if (ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL) {
                GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] != NULL);
                continue;
            }

            ballCapSealEff->sealCount++;
        }

        ballCapSealEff->state++;
        break;
    case 1:
        for (i = 2; i < 4; i++) {
            seal = CapsuleGetSealI(&ballCapSealEff->capsule, i);

            if (seal == NULL) {
                continue;
            }

            v2 = SealOnCapsuleGetID(seal);

            if (v2 == 0) {
                continue;
            }

            if (v2 >= (80 + 1)) {
                continue;
            }

            v3 = CapsuleMenu_GetSealParticleIndex(v2);

            ballCapSealEff->seals[ballCapSealEff->sealCount] = seal;
            GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL);
            ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] = ov07_0221FEE4(ballCapSealEff->particleNarc, ballCapSealEff->heapID, v3, 0);

            if (ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL) {
                GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] != NULL);
                continue;
            }

            ballCapSealEff->sealCount++;
        }

        ballCapSealEff->state++;
        break;
    case 2:
        for (i = 4; i < 6; i++) {
            seal = CapsuleGetSealI(&ballCapSealEff->capsule, i);

            if (seal == NULL) {
                continue;
            }

            v2 = SealOnCapsuleGetID(seal);

            if (v2 == 0) {
                continue;
            }

            if (v2 >= (80 + 1)) {
                continue;
            }

            v3 = CapsuleMenu_GetSealParticleIndex((u8)v2);

            ballCapSealEff->seals[ballCapSealEff->sealCount] = seal;
            GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL);
            ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] = ov07_0221FEE4(ballCapSealEff->particleNarc, ballCapSealEff->heapID, v3, 0);

            if (ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL) {
                GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] != NULL);
                continue;
            }

            ballCapSealEff->sealCount++;
        }

        ballCapSealEff->state++;
        break;
    case 3:
        for (i = 6; i < 8; i++) {
            seal = CapsuleGetSealI(&ballCapSealEff->capsule, i);

            if (seal == NULL) {
                continue;
            }

            v2 = SealOnCapsuleGetID(seal);

            if (v2 == 0) {
                continue;
            }

            if (v2 >= (80 + 1)) {
                continue;
            }

            v3 = CapsuleMenu_GetSealParticleIndex(v2);

            ballCapSealEff->seals[ballCapSealEff->sealCount] = seal;
            GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL);
            ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] = ov07_0221FEE4(ballCapSealEff->particleNarc, ballCapSealEff->heapID, v3, 0);

            if (ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] == NULL) {
                GF_ASSERT(ballCapSealEff->sealParticleSystems[ballCapSealEff->sealCount] != NULL);
                continue;
            }

            ballCapSealEff->sealCount++;
        }

        ballCapSealEff->state = 0xFF;

        NARC_Delete(ballCapSealEff->particleNarc);
        SysTask_Destroy(param0);
        break;
    default:
        break;
    }
}

void ov07_022329B0(BallCapsuleSealEffect *ballCapSealEff) {
    int v3;

    if (ballCapSealEff->hasCapsule == 0) {
        v3 = ov07_022325F4(ballCapSealEff->ballType);

        ballCapSealEff->sealCount = 1;
        ballCapSealEff->sealParticleSystems[0] = ov07_0221FEB0(ballCapSealEff->heapID, 95, v3, 0);
        ballCapSealEff->state = 0xFF;
    } else {
        ballCapSealEff->sealCount = 0;
        ballCapSealEff->state = 0;

        SysTask *v5 = SysTask_CreateOnMainQueue(ov07_02232730, ballCapSealEff, 1000);
        ov07_02232730(v5, ballCapSealEff);
    }
}

BOOL ov07_02232A04(BallCapsuleSealEffect *ballCapSealEff) {
    if (ballCapSealEff->state == 0xFF) {
        return 1;
    }

    return 0;
}

extern void ov07_02232A5C(SysTask *, void *);

void ov07_02232A14(BallCapsuleSealEffect *ballCapSealEff, void *param1) {
    ballCapSealEff->isActive = 1;

    ov07_0221C69C();
    ov07_02232AFC(ballCapSealEff, param1);

    ballCapSealEff->task = SysTask_CreateOnMainQueue(ov07_02232A5C, ballCapSealEff, 1000);
}

extern void ov07_02232C28(SPLEmitter *);

void ov07_02232A44(BallCapsuleSealEffect *ballCapSealEff) {
    ov07_02232A14(ballCapSealEff, ov07_02232C28);
}

BOOL BallCapsuleSealEffect_IsActive(BallCapsuleSealEffect *ballCapSealEff) {
    return ballCapSealEff->isActive;
}

// static
void ov07_02232A5C(SysTask *param0, void *ballCapSealEffPtr) {
    int v0;
    BOOL v1;
    BallCapsuleSealEffect *ballCapSealEff = (BallCapsuleSealEffect *)ballCapSealEffPtr;

    v1 = 0;

    GF_ASSERT(ballCapSealEff->sealCount <= 9);

    for (v0 = 0; v0 < ballCapSealEff->sealCount; v0++) {
        if (ballCapSealEff->sealParticleSystems[v0] == NULL) {
            continue;
        }

        if ((sub_020154B0(ballCapSealEff->sealParticleSystems[v0]) == 0) && (ballCapSealEff->sealActiveFlags[v0] != 0)) {
            ov07_0221FF2C(ballCapSealEff->sealParticleSystems[v0]);
            ballCapSealEff->sealParticleSystems[v0] = NULL;
            ballCapSealEff->sealActiveFlags[v0] = 0;
            continue;
        }

        v1 = 1;
    }

    if (v1 == 0) {
        ballCapSealEff->isActive = 0;
        SysTask_Destroy(param0);
    }
}

void BallCapsuleSealEffect_Free(BallCapsuleSealEffect *ballCapSealEff) {
    Heap_Free(ballCapSealEff);
}

// static
void ov07_02232AC0(SysTask *param0, void *param1) {
    UnkStruct_02236430 *v0 = (UnkStruct_02236430 *)param1;

    if (v0->unk_04 == 0) {
        *(v0->unk_0C) = 1;
        sub_02015494(v0->unk_10, 0, v0->unk_18, v0);
        sub_02015528(v0->unk_10, 1);
        SysTask_Destroy(param0);
        Heap_Free(v0);
    } else {
        v0->unk_04--;
    }
}

extern void ov07_02232C64(SPLEmitter *);

// static
void ov07_02232AFC(BallCapsuleSealEffect *ballCapSealEff, void *param1) {
    int v0, v1;
    int v2;
    int v3;

    if (ballCapSealEff->hasCapsule == 0) {
        v3 = ov07_02232608(ballCapSealEff->ballType);

        for (v0 = 0; v0 < v3; v0++) {
            sub_02015494(ballCapSealEff->sealParticleSystems[0], v0, param1, ballCapSealEff);
        }

        ballCapSealEff->sealActiveFlags[0] = 1;
        sub_02015528(ballCapSealEff->sealParticleSystems[0], 1);
    } else {
        for (v0 = 0; v0 < ballCapSealEff->sealCount; v0++) {
            UnkStruct_02236430 *v4 = Heap_Alloc(ballCapSealEff->heapID, sizeof(UnkStruct_02236430));

            GF_ASSERT(v4 != NULL);

            v4->unk_00 = v0;
            v4->unk_08 = ballCapSealEff->ballCapCfg.battlerType;
            v4->unk_18 = ov07_02232C64;

            ballCapSealEff->sealActiveFlags[v0] = 0;

            v4->unk_0C = &ballCapSealEff->sealActiveFlags[v0];
            v4->unk_10 = ballCapSealEff->sealParticleSystems[v0];
            v4->unk_14 = ballCapSealEff->seals[v0];

            GF_ASSERT(v4->unk_14 != NULL);
            v4->unk_04 = ov07_02234530(v4->unk_14);

            SysTask_CreateOnMainQueue(ov07_02232AC0, v4, 1001);
        }
    }
}

// static
void ov07_02232BB0(int param0, VecFx32 *param1) {
    ov07_02231DE0(param0, param1, 0, 1);

    s16 v2;
    s16 v3;

    switch (param0) {
    case 0:
        v2 = 0;
        v3 = -16;
        break;
    case 1:
        v2 = -15;
        v3 = -25;
        break;
    case 2:
        v2 = -8;
        v3 = -12;
        break;
    case 3:
        v2 = -14;
        v3 = -25;
        break;
    case 4:
        v2 = -8;
        v3 = -12;
        break;
    case 5:
    default:
        v2 = -16;
        v3 = -29;
        break;
    }

    int v0 = 172 * ((+10) + v2);
    int v1 = 172 * (32 + v3);

    VecFx32 v4;
    VEC_Set(&v4, v0, v1, 0);

    param1->x -= v4.x;
    param1->y -= v4.y;
}

// static
void ov07_02232C28(SPLEmitter *param0) {
    int v0;
    BallCapsuleSealEffect *ballCapSealEff = sub_02015504();
    v0 = ballCapSealEff->ballCapCfg.battlerType;

    VecFx32 v2;

    ov07_02232BB0(v0, &v2);
    SPL_SetEmitterPosition(param0, &v2);
}

// static
void ov07_02232C64(SPLEmitter *param0) {
    VecFx32 v0;
    int v1;
    BallCapsuleSealEffect *unused;
    UnkStruct_02236430 *v3 = sub_02015504();
    v1 = v3->unk_08;

    ov07_02232BB0(v1, &v0);

    u32 v4;
    u8 v5, v6;
    s16 v7, v8;
    int v9, v10;
    VecFx32 v11;

    v4 = SealOnCapsuleGetID(v3->unk_14);

    if (CapsuleMenu_IsAlphabetSeal(v4) == 1) {
        v5 = SealOnCapsuleGetX(v3->unk_14);
        v6 = SealOnCapsuleGetY(v3->unk_14);
        v7 = (v5 - 190);
        v8 = (70 - v6 + (+30));
        v9 = v7 * 172;
        v10 = v8 * 172;

        VEC_Set(&v11, v9, v10, 0);

        v0.x += v11.x;
        v0.y += v11.y;
        v0.z += v11.z;
    } else {
        v5 = SealOnCapsuleGetX(v3->unk_14);
        v6 = SealOnCapsuleGetY(v3->unk_14);
        v7 = (v5 - 190);
        v8 = (70 - v6 + (+30));
        v9 = v7 * 172;
        v10 = v8 * 172;

        VEC_Set(&v11, v9, v10, 0);

        v0.x += v11.x;
        v0.y += v11.y;
        v0.z += v11.z;
    }

    SPL_SetEmitterPosition(param0, &v0);
}

// static
void ov07_02232CD8(SPLEmitter *param0) {
    UnkStruct_ov12_02236648 *v0 = sub_02015504();

    VecFx32 v1;
    int v2, v3;
    s16 v4, v5;

    v4 = (v0->unk_00.unk_00 - 190 + 61);
    v5 = (70 - v0->unk_00.unk_02 + (+30));
    v2 = v4 * 172;
    v3 = v5 * 172;

    VEC_Set(&v1, v2, v3, 0);
    SPL_SetEmitterPosition(param0, &v1);
}

UnkStruct_ov12_02236648 *ov07_02232D20(UnkStruct_ov12_02236690 *param0) {
    UnkStruct_ov12_02236648 *v0 = Heap_Alloc(param0->heapID, sizeof(UnkStruct_ov12_02236648));
    GF_ASSERT(v0 != NULL);

    v0->unk_00 = *param0;

    if (v0->unk_00.unk_10) {
        v0->unk_20 = ov07_0223261C(0x403);
        v0->unk_1C = ov07_02232630(0x403);
    } else {
        v0->unk_20 = ov07_0223261C(v0->unk_00.unk_04);
        v0->unk_1C = ov07_02232630(v0->unk_00.unk_04);
    }

    v0->unk_18 = ov07_0221FEB0(v0->unk_00.heapID, 95, v0->unk_20, 0);

    return v0;
}

void ov07_02232D80(UnkStruct_ov12_02236648 *param0) {
    int v0;
    int v1;
    UnkStruct_ov12_02236648 *v2 = param0;

    if (v2->unk_00.unk_0C == 0xFF) {
        if (v2->unk_00.unk_10) {
            for (v0 = 0; v0 < v2->unk_1C; v0++) {
                sub_02015494(v2->unk_18, v0, ov07_02232CD8, v2);
            }
        } else {
            for (v0 = 0; v0 < v2->unk_1C; v0++) {
                if (v0 == ov07_02232644(v2->unk_00.unk_04)) {
                    continue;
                }

                sub_02015494(v2->unk_18, v0, ov07_02232CD8, v2);
            }
        }
    } else {
        v1 = v2->unk_00.unk_0C;
        sub_02015494(v2->unk_18, v1, ov07_02232CD8, v2);
    }

    sub_02015528(v2->unk_18, 1);
}

BOOL ov07_02232DF4(UnkStruct_ov12_02236648 *param0) {
    UnkStruct_ov12_02236648 *v0 = param0;

    if (sub_020154B0(v0->unk_18) == 0) {
        ov07_0221FF2C(v0->unk_18);
        return 0;
    }

    return 1;
}

void ov07_02232E10(UnkStruct_ov12_02236648 *param0) {
    Heap_Free(param0);
}

// static
BOOL ov07_02232E18(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 1);
    }

    v0 = ov07_02233EBC(param0, 2);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232E40(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 3);
    }

    v0 = ov07_02233EBC(param0, 4);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232E68(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 5);
    }

    v0 = ov07_02233EBC(param0, 6);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232E90(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 7);
    }

    v0 = ov07_02233EBC(param0, 14);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232EB8(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 15);
    }

    v0 = ov07_02233EBC(param0, 18);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232EE0(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 19);
    }

    v0 = ov07_02233EBC(param0, 27);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232F08(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 21);
    }

    v0 = ov07_02233EBC(param0, 22);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

// static
BOOL ov07_02232F30(BallRotation *param0) {
    BOOL v0;

    if (param0->unk_04 == 0) {
        param0->unk_04++;
        ov07_02233EB8(param0, 23);
    }

    v0 = ov07_02233EBC(param0, 27);

    if (v0 == 1) {
        return 0;
    }

    return 1;
}

void UnkBallData_SetBallAnimation(BallRotation *param0, int param1) {
    param0->unk_00 = param1;
    param0->unk_04 = 0;
}

extern BOOL (*const ov07_022371B8[])(BallRotation *);

BOOL ov07_02232F60(BallRotation *param0, int param1) {
    BOOL v0 = ov07_022371B8[param0->unk_00](param0);
    return v0;
}

// static
void ov07_02232F74(BallRotation *param0, int param1) {
    param0->unk_14 = param1;
    param0->unk_08 = 0;
    param0->unk_0C = 0;
    param0->unk_10 = 0;
}

// static
BOOL ov07_02232F80(BallRotation *param0) {
    return 1;
}

// static
BOOL ov07_02232F84(BallRotation *param0) {
    BOOL v0 = ov07_022335B4(param0);

    if (v0 == 0) {
        ov07_02232F74(param0, 2);
    }

    return 1;
}

// static
BOOL ov07_02232F9C(BallRotation *param0) {
    ov07_02232F74(param0, 3);
    return 1;
}

// static
BOOL ov07_02232FA8(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        ManagedSprite_SetAnim(param0->unk_30, 1);
        {
            UnkStruct_ov12_02236690 v0;

            v0.unk_04 = param0->unk_90.ballID;
            v0.heapID = param0->unk_90.heapID;
            v0.unk_0C = 0xFF;
            v0.unk_10 = 0;

            ManagedSprite_GetPositionXY(param0->unk_30, &v0.unk_00, &v0.unk_02);

            param0->unk_D8 = ov07_0221FDFC(param0->unk_90.battleSystem, param0->unk_90.heapID);
            param0->unk_D0 = ov07_02232D20(&v0);
        }
        param0->unk_08++;
        break;
    case 1: {
        int v1 = ManagedSprite_GetAnimationFrame(param0->unk_30);

        if (v1 >= 2) {
            param0->unk_24 = 0;
            param0->unk_08++;
        }
    } break;
    case 2:
        ov07_02232D80(param0->unk_D0);
        ov07_0221FE08(param0->unk_D8);
        param0->unk_08++;
        break;
    case 3: {
        if (ov07_02232DF4(param0->unk_D0) == 0) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 0);
            ov07_02232E10(param0->unk_D0);
            param0->unk_08++;
        }
    } break;
    default:
        ov07_02232F74(param0, 4);
        break;
    }

    return 1;
}

// static
BOOL ov07_02233088(BallRotation *param0) {
    return 1;
}

// static
BOOL ov07_0223308C(BallRotation *param0) {
    BOOL v0;

    switch (param0->unk_0C) {
    case 0:
        ManagedSprite_GetPositionXY(param0->unk_30, &param0->unk_B8.unk_00, &param0->unk_B8.unk_02);
        param0->unk_B8.unk_04 = 60;
        param0->unk_B8.unk_06 = 180;
        param0->unk_B8.unk_08 = 10;
        param0->unk_B8.unk_10 = 12;
        param0->unk_0C++;
        break;
    default: {
        v0 = ov07_022335B4(param0);

        if (v0 == 0) {
            ov07_02232F74(param0, 6);
        }
    } break;
    }

    return 1;
}

// static
BOOL ov07_022330E0(BallRotation *param0) {
    return 1;
}

// static
BOOL ov07_022330E4(BallRotation *param0) {
    ov07_02232F74(param0, 8);
    return 1;
}

// static
BOOL ov07_022330F0(BallRotation *param0) {
    ov07_02232F74(param0, 9);
    return 1;
}

// static
BOOL ov07_022330FC(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:

    {
        int v0;

        v0 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
        PaletteData_BeginPaletteFade(param0->unk_90.paletteData, 0x4, 1 << v0, -1, 0, 12, 0x37F);

        param0->unk_08++;
    } break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(param0->unk_90.paletteData) != 0) {
            break;
        }

        {
            int v1;

            v1 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
            PaletteData_BeginPaletteFade(param0->unk_90.paletteData, 0x4, 1 << v1, -1, 12, 0, 0x37F);
        }

        param0->unk_08++;
        break;
    default:
        if (PaletteData_GetSelectedBuffersBitmask(param0->unk_90.paletteData) != 0) {
            break;
        }

        ov07_02232F74(param0, 10);
        break;
    }

    return 1;
}

// static
BOOL ov07_022331A4(BallRotation *param0) {
    ov07_02232F74(param0, 11);
    return 1;
}

// static
BOOL ov07_022331B0(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        if ((++param0->unk_0C) < 1) {
            break;
        }

        {
            s16 v0, v1;

            ManagedSprite_GetPositionXY(param0->unk_30, &v0, &v1);
            ov07_02222268(&param0->unk_48[0], v0, v0, v1, (s16)(v1 + 32), 32 / 3);

            param0->unk_08++;
        }
        break;
    case 1:
        if (ov07_022222F0(&param0->unk_48[0], param0->unk_30) == 0) {
            param0->unk_08++;

            ov07_02232F74(param0, 13);
        }
        break;
    default:
        break;
    }

    return 1;
}

// static
BOOL ov07_02233224(BallRotation *param0) {
    return 1;
}

extern const s16 ov07_0223730E[][3];
extern int ov07_02237200[][2];

// static
BOOL ov07_02233228(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        ManagedSprite_SetAnim(param0->unk_30, 1);
        ManagedSprite_SetAnimationFrame(param0->unk_30, 0);
        param0->unk_08++;
    case 1: {
        s16 v0, v1;
        int v2;

        v0 = 0;
        v1 = ov07_0223730E[param0->unk_0C][0];
        v2 = ov07_0223730E[param0->unk_0C][1];

        ManagedSprite_SetAnimationFrame(param0->unk_30, v2);

        param0->unk_0C++;

        {
            int v3;

            for (v3 = 0; v3 < 5; v3++) {
                if (ov07_02237200[v3][0] == param0->unk_0C) {
                    Sound_PlayPannedEffect((u16)ov07_02237200[v3][1], 117);
                }
            }
        }

        if ((param0->unk_0C > 20) || (v0 == 0xFF) || (v1 == 0xFF)) {
            param0->unk_08++;
        } else {
            ManagedSprite_OffsetPositionXY(param0->unk_30, v0, v1);
        }
    } break;
    default:
        ov07_02232F74(param0, 14);
        break;
    }

    return 1;
}

// static
BOOL ov07_022332C4(BallRotation *param0) {
    return 1;
}

// static
BOOL ov07_022332C8(BallRotation *param0) {
    param0->unk_0C++;

    if (param0->unk_0C >= 14) {
        param0->unk_08++;
        param0->unk_0C = 0;
        ov07_02232F74(param0, 16);
    }

    return 1;
}

// static
BOOL ov07_022332E8(BallRotation *param0) {
    ov07_02232F74(param0, 17);
    return 1;
}

extern const s16 ov07_02237254[][12];

// static
BOOL ov07_022332F4(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        GF_ASSERT(param0->unk_18 < 3);
        param0->unk_08++;
    case 1: {
        s16 v0;

        v0 = ov07_02237254[param0->unk_18][param0->unk_0C];
        param0->unk_0C++;

        if ((param0->unk_0C > 11) || (v0 == 0xFF)) {
            param0->unk_08++;
            param0->unk_18++;
            ManagedSprite_SetAffineZRotation(param0->unk_30, 0);
            ov07_02232F74(param0, 18);
            return 1;
        } else {
            if (param0->unk_0C == 5) {
                Sound_PlayPannedEffect(0x5FD, 117);
            }

            ManagedSprite_OffsetPositionXY(param0->unk_30, v0, 0);
            ManagedSprite_OffsetAffineZRotation(param0->unk_30, (((v0) * 2) * 0xffff) / 360);
        }
    } break;
    default:
        break;
    }

    return 1;
}

// static
BOOL ov07_0223338C(BallRotation *param0) {
    return 1;
}

// static
BOOL ov07_02233390(BallRotation *param0) {
    ov07_02232F74(param0, 20);
    return 1;
}

// static
BOOL ov07_0223339C(BallRotation *param0) {
    ov07_02232F74(param0, 27);
    return 1;
}

// static
BOOL ov07_022333A8(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:

    {
        int v0;

        v0 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
        PaletteData_BeginPaletteFade(param0->unk_90.paletteData, 0x4, 1 << v0, -5, 0, 10, 0x0);

        param0->unk_08++;
    } break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(param0->unk_90.paletteData) != 0) {
            break;
        }

        {
            UnkStruct_ov12_02236690 v1;

            v1.unk_04 = param0->unk_90.ballID;
            v1.heapID = param0->unk_90.heapID;
            v1.unk_0C = ov07_02232644(v1.unk_04);
            v1.unk_10 = 0;

            ManagedSprite_GetPositionXY(param0->unk_30, &v1.unk_00, &v1.unk_02);
            param0->unk_D0 = ov07_02232D20(&v1);
        }
        param0->unk_08++;
        break;
    case 2:
        ov07_02232D80(param0->unk_D0);
        param0->unk_08++;
        break;
    case 3: {
        if (ov07_02232DF4(param0->unk_D0) == 0) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 0);
            ov07_02232E10(param0->unk_D0);
            param0->unk_08++;
        }
    } break;
    default:
        if (PaletteData_GetSelectedBuffersBitmask(param0->unk_90.paletteData) != 0) {
            break;
        }

        ov07_02232F74(param0, 22);
        break;
    }

    return 1;
}

// static
BOOL ov07_02233498(BallRotation *param0) {
    return 1;
}

// static
BOOL ov07_0223349C(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0: {
        int v0;

        v0 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
        PaletteData_BeginPaletteFade(param0->unk_90.paletteData, 0x4, 1 << v0, -5, 10, 0, 0x0);
    }
        param0->unk_08++;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(param0->unk_90.paletteData) != 0) {
            break;
        }

        param0->unk_08++;
        break;
    default:
        ov07_02232F74(param0, 24);
        break;
    }

    return 1;
}

// static
BOOL ov07_02233500(BallRotation *param0) {
    ov07_02232F74(param0, 25);
    return 1;
}

// static
BOOL ov07_0223350C(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        ManagedSprite_SetOamMode(param0->unk_30, GX_OAM_MODE_XLU);
        param0->unk_08++;
    case 1:
        if (param0->unk_20 > 0) {
            param0->unk_20--;
            param0->unk_21++;
        } else {
            param0->unk_20 = 0;
            param0->unk_21 = 15;
            ManagedSprite_SetDrawFlag(param0->unk_30, 0);
            param0->unk_08++;
        }

        G2_ChangeBlendAlpha(param0->unk_20, param0->unk_21);
        break;
    default:
        ov07_02232F74(param0, 26);
        break;
    }

    return 1;
}

// static
BOOL ov07_02233590(BallRotation *param0) {
    ov07_02232F74(param0, 27);
    return 1;
}

// static
BOOL ov07_0223359C(BallRotation *param0) {
    return 0;
}

extern BOOL (*const ov07_0223729C[])(BallRotation *);

// static
BOOL ov07_022335A0(BallRotation *param0) {
    BOOL v0 = ov07_0223729C[param0->unk_14](param0);
    return v0;
}

// static
BOOL ov07_022335B4(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        ov07_02222338(&param0->unk_48[0], &param0->unk_48[1], param0->unk_B8.unk_00, param0->unk_B8.unk_04, param0->unk_B8.unk_02, param0->unk_B8.unk_06, (u16)param0->unk_B8.unk_08, param0->unk_B8.unk_10 * FX32_ONE);

        param0->unk_B8.unk_0C = 0;
        param0->unk_08++;
        param0->unk_D4 = NULL;

        {
            int v0;

            if (ov07_02232540(param0->unk_90.type) == 1) {
                v0 = (LCRandom() % 20) + 10;

                ManagedSprite_OffsetAffineZRotation(param0->unk_30, 0x2000 * v0);
            }
        }
        break;
    case 1:
        if (ov07_02232540(param0->unk_90.type) == 1) {
            ManagedSprite_OffsetAffineZRotation(param0->unk_30, 0x2000);

            if (param0->unk_B8.unk_0C > ((param0->unk_B8.unk_08 / 2) + 10)) {
                ManagedSprite_OffsetAffineZRotation(param0->unk_30, 0x2000);
            }

            if (ov07_02232580(param0->unk_90.type) == 1) {
                if (param0->unk_B8.unk_0C == ((param0->unk_B8.unk_08 / 2) + 10)) {
                    u32 v1 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
                    param0->unk_D4 = ov07_02222F10(param0->unk_90.paletteData, param0->unk_90.heapID, 2, (u16)(v1 * 16), 16, -2, 2, 0, 14, 0xFFFF, 1002);
                }
            }
        }

        param0->unk_B8.unk_0C++;

        if ((param0->unk_90.type >= 6) && (param0->unk_90.type <= 8)) {
            if ((param0->unk_B8.unk_0C > (param0->unk_B8.unk_08 / 2)) && (param0->unk_B8.unk_0C < ((param0->unk_B8.unk_08 / 2) + 5))) {
                break;
            }
        }

        if (ov07_022223CC(&param0->unk_48[0], &param0->unk_48[1], param0->unk_30) == 0) {
            ov07_022344B4(param0, 0);
            param0->unk_08++;
        }
        break;
    case 2:
        if ((ov07_02232580(param0->unk_90.type) == 1) && (param0->unk_D4 != NULL)) {
            if (ov07_02222EE8(param0->unk_D4) == 1) {
                break;
            }

            ov07_02222EF8(param0->unk_D4);
            param0->unk_28 = 1;

            return 0;
        } else {
            if (param0->unk_90.type >= 15) {
                param0->unk_28 = 1;
                return 0;
            }

            if (param0->unk_90.ballID == 0x401) {
                Sound_PlayPannedEffect(0x7E8, 117);
            }

            param0->unk_08++;
        }
        break;
    case 3:
        ManagedSprite_SetAnim(param0->unk_30, 1);
        ov07_022344C0(param0, 1);
        param0->unk_B8.unk_0C = 0;
        param0->unk_08++;
        break;
    default:
        if (param0->unk_B8.unk_0C == 5) {
            {
                u32 v2;

                if ((param0->unk_90.type != 12) && (param0->unk_90.type != 13)) {
                    v2 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
                    param0->unk_D4 = ov07_02222F10(param0->unk_90.paletteData, param0->unk_90.heapID, 2, (u16)(v2 * 16), 16, -2, 2, 0, 14, 0xFFFF, 1002);
                }
            }
            param0->unk_28 = 1;
        }

        if ((++param0->unk_B8.unk_0C) <= 15) {
            break;
        }

        if ((param0->unk_90.type != 12) && (param0->unk_90.type != 13)) {
            if (ov07_02222EE8(param0->unk_D4) == 1) {
                break;
            }

            ov07_02222EF8(param0->unk_D4);
        }

        return 0;
    }

    return 1;
}

// static
BOOL ov07_02233874(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        ov07_02222338(&param0->unk_48[0], &param0->unk_48[1], param0->unk_B8.unk_00, param0->unk_B8.unk_04, param0->unk_B8.unk_02, param0->unk_B8.unk_06, (u16)param0->unk_B8.unk_08, param0->unk_B8.unk_10 * FX32_ONE);

        param0->unk_B8.unk_0C = 0;
        param0->unk_08++;
        param0->unk_D4 = NULL;

        {
            int v0;

            if (ov07_02232540(param0->unk_90.type) == 1) {
                v0 = (LCRandom() % 20) + 10;

                ManagedSprite_OffsetAffineZRotation(param0->unk_30, 0x2000 * v0);
            }
        }
        break;
    case 1:
        if (ov07_02232540(param0->unk_90.type) == 1) {
            ManagedSprite_OffsetAffineZRotation(param0->unk_30, 0x2000);

            if (param0->unk_B8.unk_0C > ((param0->unk_B8.unk_08 / 2) + 10)) {
                ManagedSprite_OffsetAffineZRotation(param0->unk_30, 0x2000);
            }

            if (ov07_02232580(param0->unk_90.type) == 1) {
                if (param0->unk_B8.unk_0C == ((param0->unk_B8.unk_08 / 2) + 10)) {
                    int v1;

                    v1 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
                    param0->unk_D4 = ov07_02222F10(param0->unk_90.paletteData, param0->unk_90.heapID, 2, (u16)(v1 * 16), 16, -2, 2, 0, 14, 0xFFFF, 1002);
                }
            }
        }

        param0->unk_B8.unk_0C++;

        if ((param0->unk_90.type >= 6) && (param0->unk_90.type <= 8)) {
            if ((param0->unk_B8.unk_0C > (param0->unk_B8.unk_08 / 2)) && (param0->unk_B8.unk_0C < ((param0->unk_B8.unk_08 / 2) + 5))) {
                break;
            }
        }

        if (ov07_022223CC(&param0->unk_48[0], &param0->unk_48[1], param0->unk_30) == 0) {
            ov07_022344B4(param0, 0);
            param0->unk_08++;
        }
        break;
    case 2:
        if ((ov07_02232580(param0->unk_90.type) == 1) && (param0->unk_D4 != NULL)) {
            if (ov07_02222EE8(param0->unk_D4) == 1) {
                break;
            }

            ov07_02222EF8(param0->unk_D4);
            param0->unk_28 = 1;

            return 0;
        } else {
            if (param0->unk_90.type >= 15) {
                param0->unk_28 = 1;

                return 0;
            }

            param0->unk_08++;
        }
        break;
    case 3:
        ManagedSprite_SetAnim(param0->unk_30, 1);
        ov07_022344C0(param0, 0);
        param0->unk_B8.unk_0C = 0;
        param0->unk_08++;
        break;
    default:
        if (param0->unk_B8.unk_0C == 5) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 2);

            {
                int v2;

                v2 = ManagedSprite_GetPaletteOverrideOffset(param0->unk_30);
                param0->unk_D4 = ov07_02222F10(param0->unk_90.paletteData, param0->unk_90.heapID, 2, (u16)(v2 * 16), 16, -2, 2, 0, 14, 0xFFFF, 1002);
            }

            param0->unk_28 = 1;
        }

        if ((++param0->unk_B8.unk_0C) <= 15) {
            break;
        }

        if (ov07_02222EE8(param0->unk_D4) == 1) {
            break;
        }

        ov07_02222EF8(param0->unk_D4);

        return 0;
    }

    return 1;
}

// static
BOOL ov07_02233B04(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0:
        ov07_022344C0(param0, 0);
        ManagedSprite_SetAnim(param0->unk_30, 1);
        param0->unk_B8.unk_0C++;

        if (param0->unk_B8.unk_0C >= 2) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 0);
            param0->unk_B8.unk_0C = 0;
            param0->unk_08++;
        }
        break;
    case 1:
        param0->unk_B8.unk_0C++;

        if (param0->unk_B8.unk_0C >= 2) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 2);
            param0->unk_B8.unk_0C = 0;
            param0->unk_08++;
        }
        break;
    case 2: {
        UnkStruct_ov12_02236690 v0;

        v0.unk_04 = param0->unk_90.ballID;
        v0.heapID = param0->unk_90.heapID;
        v0.unk_0C = 0xFF;
        v0.unk_10 = 1;

        ManagedSprite_GetPositionXY(param0->unk_30, &v0.unk_00, &v0.unk_02);
        param0->unk_D0 = ov07_02232D20(&v0);
    }
        param0->unk_08++;
        break;
    case 3:
        ov07_02232D80(param0->unk_D0);
        param0->unk_08++;
        break;
    case 4:
        param0->unk_B8.unk_0C++;

        if (param0->unk_B8.unk_0C >= 6) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 2);
            param0->unk_B8.unk_0C = 0;
            param0->unk_08++;
        }
        break;
    case 5:
        param0->unk_B8.unk_0C++;

        if (param0->unk_B8.unk_0C >= 6) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 1);
            param0->unk_B8.unk_0C = 0;
            param0->unk_08++;
        }
        break;
    case 6:
        param0->unk_B8.unk_0C++;

        if (param0->unk_B8.unk_0C >= 6) {
            ManagedSprite_SetAnimationFrame(param0->unk_30, 0);
            param0->unk_B8.unk_0C = 0;
            param0->unk_08++;
        }
        break;
    case 7:
        if (ov07_02232DF4(param0->unk_D0) == 0) {
            ov07_02232E10(param0->unk_D0);
            param0->unk_08++;
        }
        break;
    default:
        return 0;
        break;
    }

    return 1;
}

// static
BOOL ov07_02233C98(BallRotation *param0) {
    switch (param0->unk_08) {
    case 0: {
        if (param0->unk_10 == 0) {
            ov07_022223F0(&param0->unk_34, -((45 * 0xffff) / 360), +((45 * 0xffff) / 360), 10);
        } else {
            ov07_022223F0(&param0->unk_34, +((45 * 0xffff) / 360), -((45 * 0xffff) / 360), 10);
        }

        param0->unk_10 ^= 1;
    }
        param0->unk_08++;
        break;
    case 1:
        ManagedSprite_SetAffineZRotation(param0->unk_30, param0->unk_34.value);

        if (ov07_02222440(&param0->unk_34) == 0) {
            if (param0->unk_0C >= 1) {
                param0->unk_08++;
            } else {
                param0->unk_0C++;
                param0->unk_08--;
            }
        }
        break;
    default:
        param0->unk_B8.unk_0C = 0;
        return 0;
        break;
    }

    return 1;
}

// static
BOOL ov07_02233D24(BallRotation *param0) {
    if (param0->unk_08 == 0xFF) {
        return 0;
    }

    if (param0->unk_30 != NULL) {
        s16 v0, v1;

        ManagedSprite_GetPositionXY(param0->unk_30, &v0, &v1);

        param0->unk_B8.unk_00 = v0;
        param0->unk_B8.unk_02 = v1;
    }

    return 1;
}

extern BOOL (*const ov07_022371A0[])(BallRotation *);

// static
void ov07_02233D60(SysTask *param0, void *param1) {
    BOOL v0;
    BallRotation *v1 = (BallRotation *)param1;

    if (v1->unk_1C == 0) {
        return;
    }

    if (v1->unk_DC > 0) {
        v1->unk_DC--;
        SpriteSystem_DrawSprites(v1->unk_2C);
        return;
    }

    v0 = ov07_022371A0[v1->unk_90.mode](v1);

    if (v0 == 0) {
        v1->unk_1C = 0;
    }

    if (v1->unk_24 == 1) {
        ManagedSprite_TickFrame(v1->unk_30);
    }

    SpriteSystem_DrawSprites(v1->unk_2C);
}

BallRotation *ov07_02233DB8(BallThrow *param0) {
    BallRotation *v0 = NULL;

    v0 = Heap_Alloc(param0->heapID, sizeof(BallRotation));
    MI_CpuClear8(v0, sizeof(BallRotation));

    GF_ASSERT(v0 != NULL);

    v0->unk_90 = (*param0);
    v0->unk_08 = 0;
    v0->unk_10 = 0;
    v0->unk_0C = 0;
    v0->unk_14 = 0;
    v0->unk_18 = 0;
    v0->unk_00 = 0;
    v0->unk_04 = 0;
    v0->unk_2C = SpriteManager_New(v0->unk_90.spriteSystem);
    v0->unk_DC = 0;
    v0->unk_24 = ov07_022325BC(v0->unk_90.type);
    v0->unk_B8.unk_0C = 0;
    v0->unk_20 = 16;
    v0->unk_21 = 0;

    ov07_0221C69C();

    {
        int v1;

        v1 = LCRandom() % 2;

        if (v1) {
            v0->unk_22 = +1;
        } else {
            v0->unk_22 = -1;
        }
    }

    ov07_022342E4(v0);
    ov07_0223441C(v0);
    ov07_02233F30(v0);

    v0->unk_1C = 1;
    v0->unk_28 = 0;
    v0->unk_CC = SysTask_CreateOnMainQueue(ov07_02233D60, v0, 1000);

    return v0;
}

BOOL ov07_02233E88(BallRotation *param0) {
    GF_ASSERT(param0 != NULL);
    return param0->unk_1C ? 1 : 0;
}

BOOL ov07_02233EA0(BallRotation *param0) {
    GF_ASSERT(param0 != NULL);
    return param0->unk_28 ? 1 : 0;
}

void ov07_02233EB8(BallRotation *param0, int param1) {
    param0->unk_14 = param1;
}

BOOL ov07_02233EBC(BallRotation *param0, int param1) {
    return (param0->unk_14 == param1) ? 1 : 0;
}

void ov07_02233ECC(BallRotation *param0) {
    int v0 = param0->unk_90.heapID;

    GF_ASSERT(param0 != NULL);

    SpriteSystem_FreeResourcesAndManager(param0->unk_90.spriteSystem, param0->unk_2C);
    Sprite_DeleteAndFreeResources(param0->unk_30);
    SysTask_Destroy(param0->unk_CC);
    Heap_Free(param0);
}

void ov07_02233EFC(BallRotation *param0, int param1) {
    param0->unk_90.mode = param1;
    param0->unk_08 = 0;
    param0->unk_0C = 0;
    param0->unk_10 = 0;
    param0->unk_1C = 1;

    ManagedSprite_GetPositionXY(param0->unk_30, &param0->unk_B8.unk_00, &param0->unk_B8.unk_02);
}

int ov07_02233F20(BallRotation *param0) {
    GF_ASSERT(param0 != NULL);

    return param0->unk_90.mode;
}

// static
void ov07_02233F30(BallRotation *param0) {
    ManagedSprite_GetPositionXY(param0->unk_30, &param0->unk_B8.unk_00, &param0->unk_B8.unk_02);

    switch (param0->unk_90.type) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        ManagedSprite_GetPositionXY(param0->unk_30, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 0;
        param0->unk_B8.unk_08 = 12;
        return;
    case 6:
        ov07_02221F04(0, 0, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 48;
        param0->unk_B8.unk_06 += 32;
        break;
    case 7:
        ManagedSprite_GetPositionXY(param0->unk_30, &param0->unk_B8.unk_00, &param0->unk_B8.unk_02);
        ov07_02221F04(1, 4, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 48;
        param0->unk_B8.unk_06 += 32;
        break;
    case 8:
        ov07_02221F04(1, 2, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 48;
        param0->unk_B8.unk_06 += 32;
        break;
    case 9:
        ov07_02221F04(0, 1, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 48;
        param0->unk_B8.unk_06 += 32;
        break;
    case 10:
        ov07_02221F04(1, 3, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 48;
        param0->unk_B8.unk_06 += 32;
        break;
    case 11:
        ov07_02221F04(1, 5, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 48;
        param0->unk_B8.unk_06 += 32;
        break;
    case 12:
        ov07_02221F04(0, 1, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 16;
        param0->unk_B8.unk_06 += 16;
        param0->unk_B8.unk_08 = 12;
        return;
    case 13:
        ov07_02221F04(0, 1, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 32;
        param0->unk_B8.unk_04 -= 20;
        param0->unk_B8.unk_06 += 38;
        param0->unk_B8.unk_08 = 16;
        return;
    case 14:
        param0->unk_B8.unk_04 = 128;
        param0->unk_B8.unk_06 = (96 - 32);
        param0->unk_B8.unk_10 = 32;
        param0->unk_B8.unk_06 += 32;
        break;
    case 15:
        ov07_02221F04(0, 1, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 64;
        param0->unk_B8.unk_06 += 8;
        param0->unk_B8.unk_08 = 16;
        return;
    case 16:
        ov07_02221F04(1, 3, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 64;
        param0->unk_B8.unk_06 += 8;
        param0->unk_B8.unk_08 = 16;
        return;
    case 17:
        ov07_02221F04(1, 5, &param0->unk_B8.unk_04, &param0->unk_B8.unk_06);
        param0->unk_B8.unk_10 = 64;
        param0->unk_B8.unk_06 += 8;
        param0->unk_B8.unk_08 = 16;
        return;
    default:
        break;
    }

    param0->unk_B8.unk_08 = 20;
}

// static
void ov07_022341A4(BallRotation *param0, s16 *param1, s16 *param2) {
    switch (param0->unk_90.type) {
    case 0:
        ov07_02221F04(0, 0, param1, param2);
        (*param2) += (32 + 8);
        break;
    case 1:
        ov07_02221F04(0, 1, param1, param2);
        (*param2) += 38;
        break;
    case 2:
        ov07_02221F04(1, 2, param1, param2);
        (*param2) += (32 + 8);
        break;
    case 4:
        ov07_02221F04(1, 4, param1, param2);
        (*param2) += (32 + 8);
        break;
    case 3:
        ov07_02221F04(1, 3, param1, param2);
        (*param2) += 38;
        break;
    case 5:
        ov07_02221F04(1, 5, param1, param2);
        (*param2) += 38;
        break;
    case 6:
        *param1 = 10;
        *param2 = 100;
        break;
    case 7:
        *param1 = 10;
        *param2 = 100;
        break;
    case 8:
        *param1 = 10;
        *param2 = 100;
        break;
    case 9:
        ov07_02221F04(0, 0, param1, param2);
        break;
    case 10:
        ov07_02221F04(0, 0, param1, param2);
        break;
    case 11:
        ov07_02221F04(0, 0, param1, param2);
        break;
    case 12:
        ov07_02221F04(0, 0, param1, param2);
        break;
    case 13:
        ov07_02221F04(0, 0, param1, param2);
        break;
    case 14:
        *param1 = 230;
        *param2 = 32;
        break;
    case 15:
    case 16:
    case 17:
        *param1 = -30;
        *param2 = 160;
        break;
    default:
        break;
    }
}

// static
void ov07_022342E4(BallRotation *param0) {
    SpriteSystem_InitSprites(param0->unk_90.spriteSystem, param0->unk_2C, 10);

    if (param0->unk_90.surface == 0) {
        G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(param0->unk_90.spriteSystem), 0, (192 + 80) << FX32_SHIFT);
    }

    SpriteResourceCountsListUnion v5;

    for (int v4 = 0; v4 < 6; v4++) {
        v5.asArray[v4] = 10;
    }

    v5.asArray[4] = 0;
    v5.asArray[5] = 0;

    SpriteSystem_InitManagerWithCapacities(param0->unk_90.spriteSystem, param0->unk_2C, &v5);

    int v0 = ov07_02232658(param0->unk_90.ballID, 0);
    int v1 = ov07_02232658(param0->unk_90.ballID, 1);
    int v2 = ov07_02232658(param0->unk_90.ballID, 2);
    int v3 = ov07_02232658(param0->unk_90.ballID, 3);

    NARC *v6 = NARC_New(8, param0->unk_90.heapID);

    SpriteSystem_LoadCharResObjFromOpenNarc(param0->unk_90.spriteSystem, param0->unk_2C, v6, v0, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, param0->unk_90.target + 6000);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(param0->unk_90.paletteData, 2, param0->unk_90.spriteSystem, param0->unk_2C, v6, v1, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, param0->unk_90.target + 6000);
    SpriteSystem_LoadCellResObjFromOpenNarc(param0->unk_90.spriteSystem, param0->unk_2C, v6, v2, TRUE, param0->unk_90.target + 6000);
    SpriteSystem_LoadAnimResObjFromOpenNarc(param0->unk_90.spriteSystem, param0->unk_2C, v6, v3, TRUE, param0->unk_90.target + 6000);
    NARC_Delete(v6);
}

// static
void ov07_0223441C(BallRotation *param0) {
    int v0;
    ManagedSpriteTemplate v1;
    int v2;

    ov07_022341A4(param0, &v1.x, &v1.y);

    v1.z = 0;
    v1.animation = 0;
    v1.drawPriority = 0;
    v1.pal = 0;
    v1.vram = NNS_G2D_VRAM_TYPE_2DMAIN;
    v1.bgPriority = param0->unk_90.bgPrio;
    v1.vramTransfer = FALSE;

    for (v0 = 0; v0 < 6; v0++) {
        v1.resIdList[v0] = param0->unk_90.target + 6000;
    }

    param0->unk_30 = SpriteSystem_NewSprite(param0->unk_90.spriteSystem, param0->unk_2C, &v1);

    ManagedSprite_SetDrawFlag(param0->unk_30, TRUE);
    ManagedSprite_SetAffineOverwriteMode(param0->unk_30, 2);
    ManagedSprite_SetAnimationFrame(param0->unk_30, 0);
    ManagedSprite_SetAnim(param0->unk_30, 0);
    ManagedSprite_TickFrame(param0->unk_30);

    ov07_0221C69C();
}

void ov07_0223449C(BallRotation *param0, int param1) {
    ManagedSprite_SetDrawFlag(param0->unk_30, param1);
}

void ov07_022344A8(BallRotation *param0, s16 param1, s16 param2) {
    ManagedSprite_SetPositionXY(param0->unk_30, param1, param2);
}

void ov07_022344B4(BallRotation *param0, u16 param1) {
    ManagedSprite_SetAffineZRotation(param0->unk_30, param1);
}

void ov07_022344C0(BallRotation *param0, BOOL param1) {
    param0->unk_24 = param1;
}

void ov07_022344C4(BallRotation *param0, u16 param1) {
    ManagedSprite_SetDrawPriority(param0->unk_30, param1);
}

void ov07_022344D0(BallRotation *param0, int param1) {
    ManagedSprite_SetPriority(param0->unk_30, param1);
}

void ov07_022344DC(BallRotation *param0, int param1) {
    param0->unk_DC = param1;
}
