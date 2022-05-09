#include <nitro.h>

BOOL sMmlPrintEnable;
u8 seqCache[24];

void PlayerUpdateSeq(SNDPlayer *ply);
void PlayerUpdateChannel(SNDPlayer *ply);
void FinishPlayer(SNDPlayer *ply);
BOOL PlayerSeqMain(struct SNDPlayer *player, u32 ticks);
static void PlayerUpdateChannel(struct SNDPlayer *player);
SNDTrack *GetPlayerTrack(SNDPlayer *player, int trkNo);
void UpdateTrackChannel(SNDTrack *trk, SNDPlayer *player, BOOL doPeriodicUpdate);

void SND_SeqInit(void) {
    int i;
    for (i = 0; i < SND_PLAYER_NUM; i++) {
        SNDPlayer *ply = &SNDi_Work.player[i];

        ply->active_flag = FALSE;
        ply->myNo = (u8)i;
    }

    for (i = 0; i < SND_TRACK_NUM; i++) {
        SNDTrack *trk = &SNDi_Work.track[i];

        trk->active_flag = FALSE;
    }
}

void SND_SeqMain(BOOL doPeriodicProc) {
    struct SNDPlayer *ply;
    int i;
    u32 playerStatus = 0;

    for (i = 0; i < SND_PLAYER_NUM; i++) {
        ply = &SNDi_Work.player[i];

        if (!ply->active_flag) {
            continue;
        }

        if (ply->prepared_flag)
        {
            if (doPeriodicProc && !ply->pause_flag) {
                PlayerUpdateSeq(ply);
            }
            PlayerUpdateChannel(ply);
        }

        if (ply->active_flag) {
            playerStatus |= 1 << i;
        }
    }

    if (SNDi_SharedWork) {
        SNDi_SharedWork->playerStatus = playerStatus;
    }
}

static void PlayerUpdateChannel(SNDPlayer *player) {
    int i;
    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
        SNDTrack *trk = GetPlayerTrack(player, i);
        if (trk) {
            UpdateTrackChannel(trk, player, 1);
        }
    }
}

static void PlayerUpdateSeq(struct SNDPlayer *player) {
    int ticks = 0;
    int tempoInc;
    int i;

    while (player->tempo_counter >= 240) {
        player->tempo_counter -= 240;
        ticks++;
    }

    for (i = 0; i < ticks; i++) {
        if (PlayerSeqMain(player, 1)) {
            FinishPlayer(player);
            break;
        }
    }

    if (SNDi_SharedWork) {
        SNDi_SharedWork->player[player->myNo].tickCounter += i;
    }

    tempoInc = player->tempo;
    tempoInc *= player->tempo_ratio;
    tempoInc >>= 8;

    player->tempo_counter += tempoInc;
}
