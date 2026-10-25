#include "battle/overlay_07_0223251C.h"

//static 
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

//static 
BOOL ov07_02232540(int param0)
{
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

//static 
BOOL ov07_02232580(int param0)
{
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

//static 
BOOL ov07_022325BC(int param0)
{
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

//static 
int ov07_022325F4(int param0)
{
    int v0 = ov07_0223251C(param0);
    return ov07_0223738C[v0][0];
}

//static 
int ov07_02232608(int param0)
{
    int v0 = ov07_0223251C(param0);
    return ov07_0223738C[v0][1];
}

extern int ov07_0223746C[][3];

//static 
int ov07_0223261C(int param0)
{
    int v0 = ov07_0223251C(param0);
    return ov07_0223746C[v0][0];
}

//static 
int ov07_02232630(int param0)
{
    int v0 = ov07_0223251C(param0);
    return ov07_0223746C[v0][2];
}

//static 
int ov07_02232644(int param0)
{
    int v0 = ov07_0223251C(param0);
    return ov07_0223746C[v0][1];
}

extern int ov07_022375BC[][4];

//static
int ov07_02232658(int param0, int param1) {
    int v0 = ov07_0223251C(param0);
    return ov07_022375BC[v0][param1];
}

//static
BallCapsuleSealEffect *ov07_02232670(enum HeapID heapID)
{
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

BallCapsuleSealEffect *ov07_02232694(enum HeapID heapID, const BallCapsuleConfig *ballCapCfg)
{
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

void ov07_022326C0(BallCapsuleSealEffect *ballCapSealEff, const BallCapsuleConfig *ballCapCfgPtr)
{
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
