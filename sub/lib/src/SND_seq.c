#include <nitro.h>

#define SND_TIMER_RATE 240

#define SND_TRACK_MUTE_MODE_UNMUTE 0
#define SND_TRACK_MUTE_MODE_MUTE 1
#define SND_TRACK_MUTE_MODE_MUTE_RELEASE 2
#define SND_TRACK_MUTE_MODE_MUTE_STOP 3

enum SNDSeqProc {
    SND_PROC_SKIP_NOTES = 0,
    SND_PROC_PLAY_NOTES = 1,
};

enum SNDSeqVal {
    SND_SEQ_VAL_U8 = 0,
    SND_SEQ_VAL_U16 = 1,
    SND_SEQ_VAL_VLV = 2,
    SND_SEQ_VAL_RAN = 3,
    SND_SEQ_VAL_VAR = 4,
};

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

static void PlayerUpdateSeq(SNDPlayer *player);
static void PlayerUpdateChannel(SNDPlayer *player);
static void FinishPlayer(SNDPlayer *player);
static void InitPlayer(SNDPlayer *player, struct SNDBankData *bank);
static int AllocTrack(void);
static void InitTrack(SNDTrack *track);
static void StartTrack(SNDTrack *track, const void *seq, u32 offset);
static void InitCache(const u8 *addr);
static u8 FetchByte(const u8 *addr);
static u8 ReadByte(SNDTrack *track);
static SNDTrack *GetPlayerTrack(SNDPlayer *player, int track);
static void ReleaseTrackChannelAll(SNDTrack *track, SNDPlayer *player, int release);
static void FreeTrackChannelAll(SNDTrack *track);
static BOOL PlayerSeqMain(SNDPlayer *player, u32 ticks);
static void SetTrackMute(SNDTrack *track, SNDPlayer *player, int muteMode);
static s16 * GetVariablePtr(const SNDPlayer *player, int var);
static void UpdateTrackChannel(SNDTrack *track, SNDPlayer *player, int release);
static inline u16 Read16(SNDTrack *track);

extern const s16 SNDi_DecibelTable[];

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
    SNDPlayer *ply;
    int i;
    u32 playerStatus = 0;

    for (i = 0; i < SND_PLAYER_NUM; i++) {
        ply = &SNDi_Work.player[i];

        if (!ply->active_flag) {
            continue;
        }

        if (ply->prepared_flag) {
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
    SNDPlayer *ply = &SNDi_Work.player[player];

    if (ply->active_flag) {
        FinishPlayer(ply);
    }

    InitPlayer(ply, bankData);

    int allocTrkIdx = AllocTrack();

    if (allocTrkIdx < 0) {
        return;
    }

    SNDTrack *trk = &SNDi_Work.track[allocTrkIdx];
    InitTrack(trk);
    StartTrack(trk, seq, offset);
    ply->tracks[0] = (u8)allocTrkIdx;
    InitCache(trk->cur);

    u8 cmd = ReadByte(trk);

    if (cmd != 0xFE) {
        trk->cur--;
    } else {
        int track;
        u16 trackMask;

        for (trackMask = (u16)(Read16(trk) >> 1), track = 1; trackMask != 0;
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

static u8 ReadByte(SNDTrack *track) {
    u8 retval = FetchByte(track->cur);
    track->cur++;
    return retval;
}

static inline u16 Read16(SNDTrack *track) {
    u16 ret;
    ret = ReadByte(track);
    ret |= ReadByte(track) << 8;
    return ret;
}

void SND_StartPreparedSeq(int player) {
    SNDi_Work.player[player].prepared_flag = TRUE;
}

void SND_StartSeq(int player, const void *seq, u32 offset, struct SNDBankData *bankData) {
    SND_PrepareSeq(player, seq, offset, bankData);
    SND_StartPreparedSeq(player);
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

void SND_SetTrackAllocatableChannel(int player, u32 trackMask, u32 channel_mask) {
    SNDPlayer *ply = &SNDi_Work.player[player];
    int i;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER && trackMask != 0; i++, trackMask >>= 1) {
        if (trackMask & 1) {
            SNDTrack *trk = GetPlayerTrack(ply, i);

            if (trk) {
                trk->channel_mask = (u16)channel_mask;
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
    int i;
    for (i = 0; i < SND_PLAYER_NUM; i++) {
        SNDPlayer *ply = &SNDi_Work.player[i];

        if (ply->active_flag && start <= (const void *)ply->bank && (const void *)ply->bank <= end) {
            FinishPlayer(ply);
        }
    }
}

void SNDi_SetPlayerParam(int player, u32 offset, u32 data, int size) {
    SNDPlayer *ply = &SNDi_Work.player[player];

    switch (size) {
    case 1:
        *(u8 *)((u8 *)ply + offset) = (u8)data;
        break;
    case 2:
        *(u16 *)((u8 *)ply + offset) = (u16)data;
        break;
    case 4:
        *(u32 *)((u8 *)ply + offset) = (u32)data;
        break;
    }
}

void SNDi_SetTrackParam(int player, u32 trackMask, u32 offset, u32 data, int size) {
    SNDPlayer *ply = &SNDi_Work.player[player];
    int i;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER && trackMask != 0; i++, trackMask >>= 1) {
        if (!(trackMask & 1)) {
            continue;
        }

        SNDTrack *trk = GetPlayerTrack(ply, i);

        if (!trk) {
            continue;
        }

        switch (size) {
        case 1:
            *(u8 *)((u8 *)trk + offset) = (u8)data;
            break;
        case 2:
            *(u16 *)((u8 *)trk + offset) = (u16)data;
            break;
        case 4:
            *(u32 *)((u8 *)trk + offset) = (u32)data;
            break;
        }
    }
}

static void InitCache(const u8 *addr) {
    addr = (const u8 *)((u32)addr & ~3);
    seqCache.begin = addr;
    seqCache.end = seqCache.begin + 16;

    const u32 *src = (const u32 *)addr;

    seqCache.buf32[0] = src[0];
    seqCache.buf32[1] = src[1];
    seqCache.buf32[2] = src[2];
    seqCache.buf32[3] = src[3];
}

static u32 Read24(SNDTrack *track) {
    u32 retval;

    retval = ReadByte(track);
    retval |= ReadByte(track) << 8;
    retval |= ReadByte(track) << 16;

    return retval;
}

static int ReadVlen(SNDTrack *track) {
    int retval = 0;
    int b;

    do {
        b = ReadByte(track);
        retval = (retval << 7) | (b & 0x7F);
    } while (b & 0x80);

    return retval;
}

static int ReadArg(SNDTrack *track, SNDPlayer *player, enum SNDSeqVal valueType) {
    int retval;
    int lo, hi, ran;
    s16 *var;

    // BUG: undefined behavior if invalid valueType is passed (uninitialized return value)

    switch (valueType) {
    case SND_SEQ_VAL_U8:
        retval = ReadByte(track);
        break;
    case SND_SEQ_VAL_U16:
        retval = Read16(track);
        break;
    case SND_SEQ_VAL_VLV:
        retval = ReadVlen(track);
        break;
    case SND_SEQ_VAL_VAR:
        var = GetVariablePtr(player, ReadByte(track));
        if (var) {
            retval = *var;
        }
        break;
    case SND_SEQ_VAL_RAN:
        lo = (s16)Read16(track);
        hi = (s16)Read16(track);
        ran = SND_CalcRandom();

        retval = hi - lo + 1;
        retval = (ran * retval) >> 16;
        retval += lo;
        break;
    }

    return retval;
}

static void InitTrack(SNDTrack *track) {
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

static void StartTrack(SNDTrack *track, const void *seq, u32 offset) {
    track->base = (const u8 *)seq;
    track->cur = &track->base[offset];
}

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

static void ReleaseTrackChannelAll(SNDTrack *track, SNDPlayer *player, int release) {
    UpdateTrackChannel(track, player, 0);

    for (SNDExChannel *chn = track->channel_list; chn; chn = chn->nextLink) {
        if (SND_IsExChannelActive(chn)) {
            if (release >= 0) {
                SND_SetExChannelRelease(chn, release & 0xFF);
            }
            chn->prio = 1;
            SND_ReleaseExChannel(chn);
        }
    }
}

static void FreeTrackChannelAll(SNDTrack *track) {
    for (SNDExChannel *chn = track->channel_list; chn; chn = chn->nextLink) {
        SND_FreeExChannel(chn);
    }

    track->channel_list = NULL;
}

static void PlayerUpdateSeq(SNDPlayer *player) {
    int ticks = 0;
    int tempoInc;
    int i;

    while (player->tempo_counter >= SND_TIMER_RATE) {
        player->tempo_counter -= SND_TIMER_RATE;
        ticks++;
    }

    for (i = 0; i < ticks; i++) {
        if (PlayerSeqMain(player, SND_PROC_PLAY_NOTES)) {
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

static SNDTrack *GetPlayerTrack(SNDPlayer *player, int track) {
    if (track > (SND_TRACK_NUM_PER_PLAYER - 1)) {
        return NULL;
    }

    if (player->tracks[track] == 0xFF) {
        return NULL;
    }

    return &SNDi_Work.track[player->tracks[track]];
}

static void TrackStop(SNDTrack *track, SNDPlayer *player) {
    ReleaseTrackChannelAll(track, player, -1);
    FreeTrackChannelAll(track);
}

static void ClosePlayerTrack(SNDPlayer *player, int trackIdx) {
    SNDTrack *track = GetPlayerTrack(player, trackIdx);

    if (track == NULL) {
        return;
    }

    TrackStop(track, player);
    SNDi_Work.track[player->tracks[trackIdx]].active_flag = FALSE;
    player->tracks[trackIdx] = 0xFF;
}

static void FinishPlayer(SNDPlayer *player) {
    int i;
    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
        ClosePlayerTrack(player, i);
    }
    player->active_flag = FALSE;
}

static void ChannelCallback(SNDExChannel *chn, SNDExChannelCallbackStatus status, void *track_) {
    SNDExChannel *cur;
    SNDTrack *track;

    track = (SNDTrack *)track_;

    if (status == 1) {
        chn->prio = 0;
        SND_FreeExChannel(chn);
    }

    if (track->channel_list == chn) {
        track->channel_list = chn->nextLink;
    } else {
        cur = track->channel_list;

        while (cur->nextLink) {
            if (cur->nextLink == chn) {
                cur->nextLink = chn->nextLink;
                return;
            }
            cur = cur->nextLink;
        }
    }
}

static void UpdateTrackChannel(SNDTrack *track, SNDPlayer *player, int release) {
    int vol;
    int fader;
    int pan;
    int pitch;

    vol = SNDi_DecibelTable[track->volume] + SNDi_DecibelTable[track->volume2] +
          SNDi_DecibelTable[player->volume];

    fader = track->extFader + player->extFader;

    pitch = track->pitch_bend;
    pitch *= track->bend_range << 6;
    pitch >>= 7;
    pitch += track->ext_pitch;

    pan = track->pan;

    if (track->pan_range != 127) {
        pan = (pan * track->pan_range + 0x40) >> 7;
    }

    pan += track->ext_pan;

    if (vol < -0x8000) {
        vol = -0x8000;
    }

    if (fader < -0x8000) {
        fader = -0x8000;
    }

    if (pan < -128) {
        pan = -128;
    } else if (pan > 127) {
        pan = 127;
    }

    for (SNDExChannel *chn = track->channel_list; chn != NULL; chn = chn->nextLink) {
        chn->user_decay2 = (s16)fader;

        if (chn->env_status == 3) {
            continue;
        }

        chn->user_decay = (s16)vol;
        chn->user_pitch = (s16)pitch;
        chn->user_pan = (s8)pan;
        chn->pan_range = track->pan_range;
        chn->lfo.param = track->mod;

        if (chn->length == 0 && release != 0) {
            chn->prio = 1;
            SND_ReleaseExChannel(chn);
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

static void TrackPlayNote(SNDTrack *track, SNDPlayer *player, int key, int velocity, int length) {
    SNDExChannel *chn = NULL;

    if (track->tie_flag) {
        chn = track->channel_list;
        if (chn) {
            chn->key = (u8)key;
            chn->velocity = (u8)velocity;
        }
    }

    if (chn == NULL) {
        SNDInstData inst;
        if (!SND_ReadInstData(player->bank, track->prgNo, key, &inst)) {
            return;
        }

        u32 allowedChannels;

        // get bitmask with allocatable channels based on channel type
        switch (inst.type) {
        case SND_INST_PCM:
        case SND_INST_DIRECTPCM:
            // all channels support PCM
            allowedChannels = 0xFFFF;
            break;
        case SND_INST_PSG:
            // only channels 8, 9, 10, 11, 12, 13 support PSG
            allowedChannels = 0x3F00;
            break;
        case SND_INST_NOISE:
            // only channels 14 and 15 support noise
            allowedChannels = 0xC000;
            break;
        default:
            return;
        }

        allowedChannels &= track->channel_mask;

        chn = SND_AllocExChannel(allowedChannels,
                                 player->prio + track->prio,
                                 track->channel_mask_flag,
                                 ChannelCallback,
                                 track);
        if (chn == NULL) {
            return;
        }

        if (!SND_NoteOn(chn, key, velocity, track->tie_flag ? -1 : length, player->bank, &inst)) {
            chn->prio = 0;
            SND_FreeExChannel(chn);
            return;
        }

        chn->nextLink = track->channel_list;
        track->channel_list = chn;
    }

    if (track->attack != 0xFF) {
        SND_SetExChannelAttack(chn, track->attack);
    }

    if (track->decay != 0xFF) {
        SND_SetExChannelDecay(chn, track->decay);
    }

    if (track->sustain != 0xFF) {
        SND_SetExChannelSustain(chn, track->sustain);
    }

    if (track->release != 0xFF) {
        SND_SetExChannelRelease(chn, track->release);
    }

    chn->sweep_pitch = track->sweep_pitch;
    if (track->porta_flag) {
        chn->sweep_pitch += (s16)((track->porta_key - key) << 6);
    }

    if (track->porta_time == 0) {
        chn->sweep_length = length;
        chn->auto_sweep = FALSE;
    } else {
        int swp = track->porta_time * track->porta_time;
        swp *= chn->sweep_pitch < 0 ? -chn->sweep_pitch : chn->sweep_pitch;
        swp >>= 11;
        chn->sweep_length = swp;
    }

    chn->sweep_counter = 0;
}

static int TrackSeqMain(SNDTrack *track, SNDPlayer *player, int trackIdx, u32 playNotes) {
    SNDExChannel *chn;
    u8 cmd;
    enum SNDSeqVal valueType;
    BOOL specialValueType;
    BOOL runCmd;
    s32 length;
    int key;

    u8 par8;
    int par32;

    for (chn = track->channel_list; chn; chn = chn->nextLink) {
        if (chn->length > 0) {
            chn->length--;
        }

        if (!chn->auto_sweep && chn->sweep_counter < chn->sweep_length) {
            chn->sweep_counter++;
        }
    }

    if (track->note_finish_wait) {
        if (track->channel_list) {
            return 0;
        }
        track->note_finish_wait = FALSE;
    }

    if (track->wait > 0) {
        track->wait--;
        if (track->wait > 0) {
            return 0;
        }
    }

    InitCache(track->cur);

    while (track->wait == 0 && !track->note_finish_wait) {
        specialValueType = FALSE;
        runCmd = TRUE;

        cmd = ReadByte(track);

        if (cmd == 0xA2) {
            cmd = ReadByte(track);
            runCmd = track->cmp_flag;
        }

        if (cmd == 0xA0) {
            cmd = ReadByte(track);
            valueType = SND_SEQ_VAL_RAN;
            specialValueType = TRUE;
        }

        if (cmd == 0xA1) {
            cmd = ReadByte(track);
            valueType = SND_SEQ_VAL_VAR;
            specialValueType = TRUE;
        }

        if ((cmd & 0x80) == 0) {
            par8 = ReadByte(track);

            length = ReadArg(track, player, specialValueType ? valueType : SND_SEQ_VAL_VLV);
            key = cmd + track->transpose;

            if (!runCmd) {
                continue;
            }

            if (key < 0) {
                key = 0;
            } else if (key > 127) {
                key = 127;
            }

            if (!track->mute_flag && playNotes != 0) {
                TrackPlayNote(track, player, key, par8, (length > 0) ? length : -1);
            }

            track->porta_key = (u8)key;

            if (track->note_wait) {
                track->wait = length;
                if (length == 0) {
                    track->note_finish_wait = TRUE;
                }
            }

            continue;
        }

        switch (cmd & 0xF0) {
        case 0x80:
            par32 =
                ReadArg(track, player, specialValueType ? valueType : SND_SEQ_VAL_VLV);
            if (!runCmd) {
                break;
            }

            switch (cmd) {
            case 0x80:
                track->wait = par32;
                break;
            case 0x81:
                if (par32 < 0x10000) {
                    track->prgNo = (u16)par32;
                }
                break;
            }
            break;
        case 0x90:
            switch (cmd) {
            case 0x93: {
                u32 off;
                SNDTrack *newTrack;

                par8 = ReadByte(track);
                off = Read24(track);
                if (!runCmd) {
                    break;
                }

                newTrack = GetPlayerTrack(player, par8);
                if (newTrack && newTrack != track) {
                    TrackStop(newTrack, player);
                    StartTrack(newTrack, track->base, off);
                }
            }
                break;
            case 0x94: {
                u32 off = Read24(track);
                if (!runCmd) {
                    break;
                }
                track->cur = &track->base[off];
            }
                break;
            case 0x95: {
                u32 off = Read24(track);
                if (!runCmd) {
                    break;
                }

                if (track->call_stack_depth < SND_TRACK_CALL_STACK_DEPTH) {
                    track->call_stack[track->call_stack_depth] = track->cur;
                    track->call_stack_depth++;
                    track->cur = &track->base[off];
                }
                break;
            }
            }
            break;
        case 0xC0:
        case 0xD0: {
            union {
                u8 _u8;
                s8 _s8;
            } par;
            par._u8 = (u8)ReadArg(
                track, player, specialValueType ? valueType : SND_SEQ_VAL_U8);
            if (!runCmd) {
                break;
            }

            switch (cmd) {
            case 0xC1:
                track->volume = par._u8;
                break;
            case 0xD5:
                track->volume2 = par._u8;
                break;
            case 0xC2:
                player->volume = par._u8;
                break;
            case 0xC5:
                track->bend_range = par._u8;
                break;
            case 0xC6:
                track->prio = par._u8;
                break;
            case 0xC7:
                track->note_wait = par._u8;
                break;
            case 0xCF:
                track->porta_time = par._u8;
                break;
            case 0xCA:
                track->mod.depth = par._u8;
                break;
            case 0xCB:
                track->mod.speed = par._u8;
                break;
            case 0xCC:
                track->mod.target = par._u8;
                break;
            case 0xCD:
                track->mod.range = par._u8;
                break;
            case 0xD0:
                track->attack = par._u8;
                break;
            case 0xD1:
                track->decay = par._u8;
                break;
            case 0xD2:
                track->sustain = par._u8;
                break;
            case 0xD3:
                track->release = par._u8;
                break;
            case 0xD4:
                if (track->call_stack_depth < SND_TRACK_CALL_STACK_DEPTH) {
                    track->call_stack[track->call_stack_depth] = track->cur;
                    track->loop_count[track->call_stack_depth] = par._u8;
                    track->call_stack_depth++;
                }
                break;
            case 0xC8:
                track->tie_flag = par._u8;
                ReleaseTrackChannelAll(track, player, -1);
                FreeTrackChannelAll(track);
                break;
            case 0xD7:
                SetTrackMute(track, player, par._u8);
                break;
            case 0xC9:
                track->porta_key = (u8)(par._u8 + track->transpose);
                track->porta_flag = TRUE;
                break;
            case 0xCE:
                track->porta_flag = par._u8;
                break;
            case 0xC3:
                track->transpose = par._s8;
                break;
            case 0xC4:
                track->pitch_bend = par._s8;
                break;
            case 0xC0:
                track->pan = (s8)(par._u8 - 0x40);
                break;
            case 0xD6: {
                s16 *varPtr;

                if (sMmlPrintEnable) {
                    varPtr = GetVariablePtr(player, par._u8);
                    OS_Printf("Player %d track %d var %d = %d\n", player->myNo, trackIdx, par._u8, *varPtr);
                }
            }
                break;
            }
        }
            break;
        case 0xE0: {
            s16 par = (s16)ReadArg(
                track, player, specialValueType ? valueType : SND_SEQ_VAL_U16);
            if (!runCmd) {
                break;
            }

            switch (cmd) {
            case 0xE3:
                track->sweep_pitch = par;
                break;
            case 0xE1:
                player->tempo = (u16)par;
                break;
            case 0xE0:
                track->mod.delay = (u16)par;
                break;
            }
        }
            break;
        case 0xB0: {
            int varNum = ReadByte(track);

            s16 par = (s16)ReadArg(
                track, player, specialValueType ? valueType : SND_SEQ_VAL_U16);
            s16 *varPtr = GetVariablePtr(player, varNum);

            if (!runCmd) {
                break;
            }

            if (varPtr == NULL) {
                break;
            }

            switch (cmd) {
            case 0xB0:
                *varPtr = par;
                break;
            case 0xB1:
                *varPtr += par;
                break;
            case 0xB2:
                *varPtr -= par;
                break;
            case 0xB3:
                *varPtr *= par;
                break;
            case 0xB4:
                if (par != 0) {
                    *varPtr /= par;
                }
                break;
            case 0xB5:
                if (par >= 0) {
                    *varPtr <<= par;
                } else {
                    *varPtr >>= -par;
                }
                break;
            case 0xB6: {
                BOOL neg = FALSE;
                if (par < 0) {
                    neg = TRUE;
                    par = (s16)(-par);
                }
                s32 random = SND_CalcRandom();
                random = (random * (par + 1)) >> 16;
                if (neg) {
                    random = -random;
                }
                *varPtr = (s16)random;
            }
                break;
            case 0xB7:
                break;
            case 0xB8:
                track->cmp_flag = *varPtr == par;
                break;
            case 0xB9:
                track->cmp_flag = *varPtr >= par;
                break;
            case 0xBA:
                track->cmp_flag = *varPtr > par;
                break;
            case 0xBB:
                track->cmp_flag = *varPtr <= par;
                break;
            case 0xBC:
                track->cmp_flag = *varPtr < par;
                break;
            case 0xBD:
                track->cmp_flag = *varPtr != par;
                break;
            }
        }
            break;
        case 0xF0:
            if (!runCmd) {
                break;
            }

            switch (cmd) {
            case 0xFD:
                if (track->call_stack_depth != 0) {
                    track->call_stack_depth--;
                    track->cur = track->call_stack[track->call_stack_depth];
                }
                break;
            case 0xFC: {
                if (track->call_stack_depth == 0) {
                    break;
                }

                // gosh, this was nasty to figure out
                u8 loop_count = track->loop_count[track->call_stack_depth - 1];
                if (loop_count != 0) {
                    loop_count--;
                    if (loop_count == 0) {
                        track->call_stack_depth--;
                        break;
                    }
                }
                track->loop_count[track->call_stack_depth - 1] = loop_count;
                track->cur = track->call_stack[track->call_stack_depth - 1];
            }
                break;
            case 0xFE:
                break;
            case 0xFF:
                return -1;
            }
            break;
        }
    }

    return 0;
}

static BOOL PlayerSeqMain(SNDPlayer *player, u32 ticks) {
    BOOL isPlaying = FALSE;
    int i;

    for (i = 0; i < SND_TRACK_NUM_PER_PLAYER; i++) {
        SNDTrack *trk = GetPlayerTrack(player, i);

        if (trk && trk->cur) {
            if (TrackSeqMain(trk, player, i, ticks)) {
                ClosePlayerTrack(player, i);
            } else {
                isPlaying = TRUE;
            }
        }
    }

    return !isPlaying;
}

static s16 * GetVariablePtr(const SNDPlayer *player, int var) {
    if (SNDi_SharedWork == NULL) {
        return NULL;
    } else if (var < 16) {
        return (s16 *)&SNDi_SharedWork->player[player->myNo].variable[var];
    } else {
        return (s16 *)&SNDi_SharedWork->globalVariable[var - 16];
    }
}

static int AllocTrack(void) {
    int i;
    for (i = 0; i < SND_TRACK_NUM; i++) {
        if (!SNDi_Work.track[i].active_flag) {
            SNDi_Work.track[i].active_flag = TRUE;
            return i;
        }
    }

    return -1;
}

static void SetTrackMute(SNDTrack *track, SNDPlayer *player, int muteMode) {
    switch (muteMode) {
    case SND_TRACK_MUTE_MODE_UNMUTE:
        track->mute_flag = FALSE;
        break;
    case SND_TRACK_MUTE_MODE_MUTE:
        track->mute_flag = TRUE;
        break;
    case SND_TRACK_MUTE_MODE_MUTE_RELEASE:
        track->mute_flag = TRUE;
        ReleaseTrackChannelAll(track, player, -1);
        break;
    case SND_TRACK_MUTE_MODE_MUTE_STOP:
        track->mute_flag = TRUE;
        ReleaseTrackChannelAll(track, player, 127);
        FreeTrackChannelAll(track);
        break;
    }
}
