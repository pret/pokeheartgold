#include <nitro.h>

#define SND_TIMER_RATE 240

typedef struct SNDSeqCache {
    const u8 *begin;
    const u8 *end;
    union {
        u8 buf[16];
        u32 buf32[4];
    };
} SNDSeqCache;

BOOL sMmlPrintEnable;
SNDSeqCache seqCache;

void PlayerUpdateSeq(SNDPlayer *ply);
void PlayerUpdateChannel(SNDPlayer *ply);
void FinishPlayer(SNDPlayer *ply);
BOOL PlayerSeqMain(struct SNDPlayer *player, u32 ticks);
static void PlayerUpdateChannel(struct SNDPlayer *player);
SNDTrack *GetPlayerTrack(SNDPlayer *player, int trkNo);
void UpdateTrackChannel(SNDTrack *trk, SNDPlayer *player, BOOL doPeriodicUpdate);
static u8 FetchByte(const u8 *addr);
u8 ReadByte(SNDTrack *track);
static u16 ReadShort(SNDTrack *track);
void InitCache(const u8 *addr);
int AllocTrack(void);
void InitTrack(SNDTrack *track);
void StartTrack(SNDTrack *track, const void *seq, u32 offset);
static void InitPlayer(SNDPlayer *player, struct SNDBankData *bank);
void ReleaseTrackChannelAll(SNDTrack *track, SNDPlayer *player, int release);
void FreeTrackChannelAll(SNDTrack *track);
void SetTrackMute(SNDTrack *track, SNDPlayer *player, int muteMode);

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

void SND_PrepareSeq(int player, const void *seq, u32 offset, struct SNDBankData *bankData) {
    struct SNDPlayer *ply = &SNDi_Work.player[player];

    if (ply->active_flag) {
        FinishPlayer(ply);
    }

    InitPlayer(ply, bankData);

    int allocTrkIdx = AllocTrack();

    if (allocTrkIdx < 0) {
        return;
    }

    struct SNDTrack *trk = &SNDi_Work.track[allocTrkIdx];
    InitTrack(trk);
    //StartTrack(trk, seq, offset);
    trk->base = seq;
    trk->cur = seq + offset;
    ply->tracks[0] = (u8)allocTrkIdx;
    InitCache(trk->cur);

    u8 cmd = ReadByte(trk);

    if (cmd != 0xFE) {
        trk->cur--;
    } else {
        int track;
        u16 trackMask;

        for (trackMask = (u16)(ReadShort(trk) >> 1), track = 1; trackMask != 0;
             track++, trackMask >>= 1) {
            if (trackMask & 1) {
                allocTrkIdx = AllocTrack();
                if (allocTrkIdx < 0) {
                    break;
                }
                InitTrack(&SNDi_Work.track[allocTrkIdx]);
                ply->tracks[track] = (u8)allocTrkIdx;
            }
        }
    }

    ply->active_flag = TRUE;
    ply->prepared_flag = FALSE;

    if (SNDi_SharedWork) {
        SNDi_SharedWork->playerStatus |= 1 << player;
    }
}

static u8 FetchByte(const u8 *addr) {
    if (addr < seqCache.begin || addr >= seqCache.end) {
        InitCache(addr);
    }
    return seqCache.buf[(u32)addr - (u32)seqCache.begin];
}

u8 ReadByte(SNDTrack *track) {
    u8 retval = FetchByte(track->cur);
    track->cur++;
    return retval;
}

static u16 ReadShort(SNDTrack *track) {
    int ret;
    ret = ReadByte(track);
    ret |= ReadByte(track) << 8;
    return ret;
}

void SND_StartPreparedSeq(int playerNo) {
    SNDi_Work.player[playerNo].prepared_flag = TRUE;
}

void SND_StartSeq(int playerNo, const void *seq, u32 offset, struct SNDBankData *bankData) {
    SND_PrepareSeq(playerNo, seq, offset, bankData);
    SND_StartPreparedSeq(playerNo);
}

void SND_StopSeq(int player) {
    SNDPlayer *ply = &SNDi_Work.player[player];

    if (ply->active_flag) {
        FinishPlayer(ply);

        if (SNDi_SharedWork) {
            SNDi_SharedWork->playerStatus &= ~(1 << player);
        }
    }
}

void SND_PauseSeq(int player, BOOL flag) {
    SNDPlayer *ply = &SNDi_Work.player[player];
    int i;

    ply->pause_flag = flag;

    if (flag) {
        for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
            SNDTrack *trk = GetPlayerTrack(ply, i);

            if (trk) {
                ReleaseTrackChannelAll(trk, ply, 127);
                FreeTrackChannelAll(trk);
            }
        }
    }
}

void SND_SkipSeq(int player, u32 ticks) {
    SNDPlayer *ply = &SNDi_Work.player[player];
    int i;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
        SNDTrack *trk = GetPlayerTrack(ply, i);

        if (trk) {
            ReleaseTrackChannelAll(trk, ply, 127);
            FreeTrackChannelAll(trk);
        }
    }

    SND_StopIntervalTimer();

    for (i = 0; i < ticks; i++) {
        if (PlayerSeqMain(ply, 0)) {
            FinishPlayer(ply);
            break;
        }
    }

    SND_StartIntervalTimer();

    if (SNDi_SharedWork) {
        SNDi_SharedWork->player[ply->myNo].tickCounter += i;
    }
}

void SND_SetTrackMute(int player, u32 trackMask, int muteMode) {
    SNDPlayer *ply = &SNDi_Work.player[player];
    int i;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER && trackMask != 0; i++, trackMask >>= 1) {
        if (trackMask & 1) {
            SNDTrack *trk = GetPlayerTrack(ply, i);

            if (trk) {
                SetTrackMute(trk, ply, muteMode);
            }
        }
    }
}

void SND_SetTrackAllocatableChannel(int player, u32 trackMask, u32 channelMask) {
    SNDPlayer *ply = &SNDi_Work.player[player];
    int i;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER && trackMask != 0; i++, trackMask >>= 1) {
        if (trackMask & 1) {
            struct SNDTrack *trk = GetPlayerTrack(ply, i);

            if (trk) {
                trk->channel_mask = (u16)channelMask;
                trk->channel_mask_flag = TRUE;
            }
        }
    }
}

void SND_InvalidateSeq(const void *start, const void *end) {
    SNDPlayer *ply;
    SNDTrack *trk;
    int i;
    int j;

    for (i = 0; i < SND_PLAYER_NUM; i++) {
        ply = &SNDi_Work.player[i];

        if (!ply->active_flag) {
            continue;
        }

        for (j = 0; j < SND_TRACK_NUM_PER_PLAYER; j++) {
            trk = GetPlayerTrack(ply, j);

            if (!trk) {
                continue;
            }

            if (start <= (const void *)trk->cur && (const void *)trk->cur <= end) {
                FinishPlayer(ply);
                break;
            }
        }
    }
}

void SND_InvalidateBank(const void *start, const void *end) {
    for (int i = 0; i < SND_PLAYER_NUM; i++) {
        SNDPlayer *ply = &SNDi_Work.player[i];

        if (ply->active_flag && start <= (const void *)ply->bank && (const void *)ply->bank <= end) {
            FinishPlayer(ply);
        }
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

    while (player->tempo_counter >= SND_TIMER_RATE) {
        player->tempo_counter -= SND_TIMER_RATE;
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

/*
void InitTrack(SNDTrack *track) {
    track->base = NULL;
    track->cur = NULL;

    track->note_wait = TRUE;
    track->mute_flag = FALSE;
    track->tie_flag = FALSE;
    track->note_finish_wait = FALSE;
    track->porta_flag = FALSE;
    track->cmp_flag = TRUE;
    track->channel_mask_flag = FALSE;

    track->call_stack_depth = 0;
    track->prgNo = 0;
    track->prio = 64;
    track->volume = 127;
    track->volume2 = 127;
    track->extFader = 0;
    track->pan = 0;
    track->ext_pan = 0;
    track->pitch_bend = 0;
    track->ext_pitch = 0;
    track->attack = 255;
    track->decay = 255;
    track->sustain = 255;
    track->release = 255;
    track->pan_range = 127;
    track->bend_range = 2;
    track->porta_key = 60;
    track->porta_time = 0;
    track->sweep_pitch = 0;
    track->transpose = 0;
    track->channel_mask = 0xFFFF;
    SND_InitLfoParam(&track->mod);
    track->wait = 0;
    track->channel_list = NULL;
}
*/

/*
void StartTrack(SNDTrack *track, const void *seq, u32 offset) {
    track->base = (const u8 *)seq;
    track->cur = &track->base[offset];
}
*/

static void InitPlayer(SNDPlayer *player, struct SNDBankData *bank) {
    int i;

    player->pause_flag = FALSE;
    player->bank = bank;
    player->tempo = 120;
    player->tempo_ratio = 256;
    player->tempo_counter = SND_TIMER_RATE;
    player->volume = 0x7F;
    player->extFader = 0;
    player->prio = 64;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
        player->tracks[i] = 0xFF;
    }

    if (SNDi_SharedWork) {
        SNDi_SharedWork->player[player->myNo].tickCounter = 0;

        for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
            SNDi_SharedWork->player[player->myNo].variable[i] = -1;
        }
    }
}

/*
int AllocTrack(void) {
    int i;

    for (i = 0; i < SND_TRACK_NUM; i++) {
        if (!SNDi_Work.track[i].active_flag) {
            SNDi_Work.track[i].active_flag = TRUE;
            return i;
        }
    }

    return -1;
}*/

static void foo() {
    (void)sMmlPrintEnable;
}
