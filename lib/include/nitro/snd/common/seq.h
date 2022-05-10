#ifndef NITRO_SND_COMMON_SEQ_H_
#define NITRO_SND_COMMON_SEQ_H_

#define SND_PLAYER_NUM 16
#define SND_PLAYER_MIN  0
#define SND_PLAYER_MAX 15

#define SND_TRACK_NUM 32
#define SND_TRACK_MIN  0
#define SND_TRACK_MAX 31

#define SND_TRACK_NUM_PER_PLAYER 16

#define SND_TRACK_CALL_STACK_DEPTH 3

#define SND_PLAYER_VARIABLE_NUM 16
#define SND_GLOBAL_VARIABLE_NUM 16

enum SNDSeqCommand {
    SND_SEQ_CMD_NOTE_C_0       =   0,
    SND_SEQ_CMD_NOTE_Cs0       =   1,
    SND_SEQ_CMD_NOTE_D_0       =   2,
    SND_SEQ_CMD_NOTE_Ds0       =   3,
    SND_SEQ_CMD_NOTE_E_0       =   4,
    SND_SEQ_CMD_NOTE_F_0       =   5,
    SND_SEQ_CMD_NOTE_Fs0       =   6,
    SND_SEQ_CMD_NOTE_G_0       =   7,
    SND_SEQ_CMD_NOTE_Gs0       =   8,
    SND_SEQ_CMD_NOTE_A_0       =   9,
    SND_SEQ_CMD_NOTE_As0       =  10,
    SND_SEQ_CMD_NOTE_B_0       =  11,
    SND_SEQ_CMD_NOTE_C_1       =  12,
    SND_SEQ_CMD_NOTE_Cs1       =  13,
    SND_SEQ_CMD_NOTE_D_1       =  14,
    SND_SEQ_CMD_NOTE_Ds1       =  15,
    SND_SEQ_CMD_NOTE_E_1       =  16,
    SND_SEQ_CMD_NOTE_F_1       =  17,
    SND_SEQ_CMD_NOTE_Fs1       =  18,
    SND_SEQ_CMD_NOTE_G_1       =  19,
    SND_SEQ_CMD_NOTE_Gs1       =  20,
    SND_SEQ_CMD_NOTE_A_1       =  21,
    SND_SEQ_CMD_NOTE_As1       =  22,
    SND_SEQ_CMD_NOTE_B_1       =  23,
    SND_SEQ_CMD_NOTE_C_2       =  24,
    SND_SEQ_CMD_NOTE_Cs2       =  25,
    SND_SEQ_CMD_NOTE_D_2       =  26,
    SND_SEQ_CMD_NOTE_Ds2       =  27,
    SND_SEQ_CMD_NOTE_E_2       =  28,
    SND_SEQ_CMD_NOTE_F_2       =  29,
    SND_SEQ_CMD_NOTE_Fs2       =  30,
    SND_SEQ_CMD_NOTE_G_2       =  31,
    SND_SEQ_CMD_NOTE_Gs2       =  32,
    SND_SEQ_CMD_NOTE_A_2       =  33,
    SND_SEQ_CMD_NOTE_As2       =  34,
    SND_SEQ_CMD_NOTE_B_2       =  35,
    SND_SEQ_CMD_NOTE_C_3       =  36,
    SND_SEQ_CMD_NOTE_Cs3       =  37,
    SND_SEQ_CMD_NOTE_D_3       =  38,
    SND_SEQ_CMD_NOTE_Ds3       =  39,
    SND_SEQ_CMD_NOTE_E_3       =  40,
    SND_SEQ_CMD_NOTE_F_3       =  41,
    SND_SEQ_CMD_NOTE_Fs3       =  42,
    SND_SEQ_CMD_NOTE_G_3       =  43,
    SND_SEQ_CMD_NOTE_Gs3       =  44,
    SND_SEQ_CMD_NOTE_A_3       =  45,
    SND_SEQ_CMD_NOTE_As3       =  46,
    SND_SEQ_CMD_NOTE_B_3       =  47,
    SND_SEQ_CMD_NOTE_C_4       =  48,
    SND_SEQ_CMD_NOTE_Cs4       =  49,
    SND_SEQ_CMD_NOTE_D_4       =  50,
    SND_SEQ_CMD_NOTE_Ds4       =  51,
    SND_SEQ_CMD_NOTE_E_4       =  52,
    SND_SEQ_CMD_NOTE_F_4       =  53,
    SND_SEQ_CMD_NOTE_Fs4       =  54,
    SND_SEQ_CMD_NOTE_G_4       =  55,
    SND_SEQ_CMD_NOTE_Gs4       =  56,
    SND_SEQ_CMD_NOTE_A_4       =  57,
    SND_SEQ_CMD_NOTE_As4       =  58,
    SND_SEQ_CMD_NOTE_B_4       =  59,
    SND_SEQ_CMD_NOTE_C_5       =  60,
    SND_SEQ_CMD_NOTE_Cs5       =  61,
    SND_SEQ_CMD_NOTE_D_5       =  62,
    SND_SEQ_CMD_NOTE_Ds5       =  63,
    SND_SEQ_CMD_NOTE_E_5       =  64,
    SND_SEQ_CMD_NOTE_F_5       =  65,
    SND_SEQ_CMD_NOTE_Fs5       =  66,
    SND_SEQ_CMD_NOTE_G_5       =  67,
    SND_SEQ_CMD_NOTE_Gs5       =  68,
    SND_SEQ_CMD_NOTE_A_5       =  69,
    SND_SEQ_CMD_NOTE_As5       =  70,
    SND_SEQ_CMD_NOTE_B_5       =  71,
    SND_SEQ_CMD_NOTE_C_6       =  72,
    SND_SEQ_CMD_NOTE_Cs6       =  73,
    SND_SEQ_CMD_NOTE_D_6       =  74,
    SND_SEQ_CMD_NOTE_Ds6       =  75,
    SND_SEQ_CMD_NOTE_E_6       =  76,
    SND_SEQ_CMD_NOTE_F_6       =  77,
    SND_SEQ_CMD_NOTE_Fs6       =  78,
    SND_SEQ_CMD_NOTE_G_6       =  79,
    SND_SEQ_CMD_NOTE_Gs6       =  80,
    SND_SEQ_CMD_NOTE_A_6       =  81,
    SND_SEQ_CMD_NOTE_As6       =  82,
    SND_SEQ_CMD_NOTE_B_6       =  83,
    SND_SEQ_CMD_NOTE_C_7       =  84,
    SND_SEQ_CMD_NOTE_Cs7       =  85,
    SND_SEQ_CMD_NOTE_D_7       =  86,
    SND_SEQ_CMD_NOTE_Ds7       =  87,
    SND_SEQ_CMD_NOTE_E_7       =  88,
    SND_SEQ_CMD_NOTE_F_7       =  89,
    SND_SEQ_CMD_NOTE_Fs7       =  90,
    SND_SEQ_CMD_NOTE_G_7       =  91,
    SND_SEQ_CMD_NOTE_Gs7       =  92,
    SND_SEQ_CMD_NOTE_A_7       =  93,
    SND_SEQ_CMD_NOTE_As7       =  94,
    SND_SEQ_CMD_NOTE_B_7       =  95,
    SND_SEQ_CMD_NOTE_C_8       =  96,
    SND_SEQ_CMD_NOTE_Cs8       =  97,
    SND_SEQ_CMD_NOTE_D_8       =  98,
    SND_SEQ_CMD_NOTE_Ds8       =  99,
    SND_SEQ_CMD_NOTE_E_8       = 100,
    SND_SEQ_CMD_NOTE_F_8       = 101,
    SND_SEQ_CMD_NOTE_Fs8       = 102,
    SND_SEQ_CMD_NOTE_G_8       = 103,
    SND_SEQ_CMD_NOTE_Gs8       = 104,
    SND_SEQ_CMD_NOTE_A_8       = 105,
    SND_SEQ_CMD_NOTE_As8       = 106,
    SND_SEQ_CMD_NOTE_B_8       = 107,
    SND_SEQ_CMD_NOTE_C_9       = 108,
    SND_SEQ_CMD_NOTE_Cs9       = 109,
    SND_SEQ_CMD_NOTE_D_9       = 110,
    SND_SEQ_CMD_NOTE_Ds9       = 111,
    SND_SEQ_CMD_NOTE_E_9       = 112,
    SND_SEQ_CMD_NOTE_F_9       = 113,
    SND_SEQ_CMD_NOTE_Fs9       = 114,
    SND_SEQ_CMD_NOTE_G_9       = 115,
    SND_SEQ_CMD_NOTE_Gs9       = 116,
    SND_SEQ_CMD_NOTE_A_9       = 117,
    SND_SEQ_CMD_NOTE_As9       = 118,
    SND_SEQ_CMD_NOTE_B_9       = 119,
    SND_SEQ_CMD_NOTE_C_10      = 120,
    SND_SEQ_CMD_NOTE_Cs10      = 121,
    SND_SEQ_CMD_NOTE_D_10      = 122,
    SND_SEQ_CMD_NOTE_Ds10      = 123,
    SND_SEQ_CMD_NOTE_E_10      = 124,
    SND_SEQ_CMD_NOTE_F_10      = 125,
    SND_SEQ_CMD_NOTE_Fs10      = 126,
    SND_SEQ_CMD_NOTE_G_10      = 127,

    SND_SEQ_CMD_GRP_VARLEN     = 0x80,
    SND_SEQ_CMD_REST           = SND_SEQ_CMD_GRP_VARLEN + 0x0,
    SND_SEQ_CMD_PRGNO          = SND_SEQ_CMD_GRP_VARLEN + 0x1,

    SND_SEQ_CMD_GRP_POINTER    = 0x90,
    SND_SEQ_CMD_TRACK          = SND_SEQ_CMD_GRP_POINTER + 0x3,
    SND_SEQ_CMD_JUMP           = SND_SEQ_CMD_GRP_POINTER + 0x4,
    SND_SEQ_CMD_CALL           = SND_SEQ_CMD_GRP_POINTER + 0x5,

    SND_SEQ_CMD_GRP_ARGTYPE    = 0xA0,
    SND_SEQ_CMD_RANDARG        = SND_SEQ_CMD_GRP_ARGTYPE + 0x0,
    SND_SEQ_CMD_VARARG         = SND_SEQ_CMD_GRP_ARGTYPE + 0x1,
    SND_SEQ_CMD_IFTRUE         = SND_SEQ_CMD_GRP_ARGTYPE + 0x2,

    SND_SEQ_CMD_GRP_VARACT     = 0xB0,
    SND_SEQ_CMD_SETVAR         = SND_SEQ_CMD_GRP_VARACT + 0x0,
    SND_SEQ_CMD_ADDVAR         = SND_SEQ_CMD_GRP_VARACT + 0x1,
    SND_SEQ_CMD_SUBVAR         = SND_SEQ_CMD_GRP_VARACT + 0x2,
    SND_SEQ_CMD_MULVAR         = SND_SEQ_CMD_GRP_VARACT + 0x3,
    SND_SEQ_CMD_DIVVAR         = SND_SEQ_CMD_GRP_VARACT + 0x4,
    SND_SEQ_CMD_SHIFTVAR       = SND_SEQ_CMD_GRP_VARACT + 0x5,
    SND_SEQ_CMD_SETVARRND      = SND_SEQ_CMD_GRP_VARACT + 0x6,
    SND_SEQ_CMD_VARNOP         = SND_SEQ_CMD_GRP_VARACT + 0x7,
    SND_SEQ_CMD_VAREQ          = SND_SEQ_CMD_GRP_VARACT + 0x8,
    SND_SEQ_CMD_VARGE          = SND_SEQ_CMD_GRP_VARACT + 0x9,
    SND_SEQ_CMD_VARGT          = SND_SEQ_CMD_GRP_VARACT + 0xA,
    SND_SEQ_CMD_VARLE          = SND_SEQ_CMD_GRP_VARACT + 0xB,
    SND_SEQ_CMD_VARLT          = SND_SEQ_CMD_GRP_VARACT + 0xC,
    SND_SEQ_CMD_VARNE          = SND_SEQ_CMD_GRP_VARACT + 0xD,

    SND_SEQ_CMD_GRP_U8ARG_0   = 0xC0,
    SND_SEQ_CMD_GRP_U8ARG_1   = 0xD0,
    SND_SEQ_CMD_PAN             = SND_SEQ_CMD_GRP_U8ARG_0 + 0x0,
    SND_SEQ_CMD_VOLUME          = SND_SEQ_CMD_GRP_U8ARG_0 + 0x1,
    SND_SEQ_CMD_MASTERVOLUME    = SND_SEQ_CMD_GRP_U8ARG_0 + 0x2,
    SND_SEQ_CMD_TRANSPOSE       = SND_SEQ_CMD_GRP_U8ARG_0 + 0x3,
    SND_SEQ_CMD_PITCHBEND       = SND_SEQ_CMD_GRP_U8ARG_0 + 0x4,
    SND_SEQ_CMD_BEND_RANGE      = SND_SEQ_CMD_GRP_U8ARG_0 + 0x5,
    SND_SEQ_CMD_PRIORITY        = SND_SEQ_CMD_GRP_U8ARG_0 + 0x6,
    SND_SEQ_CMD_POLY            = SND_SEQ_CMD_GRP_U8ARG_0 + 0x7,
    SND_SEQ_CMD_TIE             = SND_SEQ_CMD_GRP_U8ARG_0 + 0x8,
    SND_SEQ_CMD_PORTA_CNT       = SND_SEQ_CMD_GRP_U8ARG_0 + 0x9,
    SND_SEQ_CMD_MODDEPTH        = SND_SEQ_CMD_GRP_U8ARG_0 + 0xA,
    SND_SEQ_CMD_MODSPEED        = SND_SEQ_CMD_GRP_U8ARG_0 + 0xB,
    SND_SEQ_CMD_MODTYPE         = SND_SEQ_CMD_GRP_U8ARG_0 + 0xC,
    SND_SEQ_CMD_MODRANGE        = SND_SEQ_CMD_GRP_U8ARG_0 + 0xD,
    SND_SEQ_CMD_PORTA_TOGGLE    = SND_SEQ_CMD_GRP_U8ARG_0 + 0xE,
    SND_SEQ_CMD_PORTA_TIME      = SND_SEQ_CMD_GRP_U8ARG_0 + 0xF,
    SND_SEQ_CMD_ATTACK          = SND_SEQ_CMD_GRP_U8ARG_1 + 0x0,
    SND_SEQ_CMD_DECAY           = SND_SEQ_CMD_GRP_U8ARG_1 + 0x1,
    SND_SEQ_CMD_SUSTAIN         = SND_SEQ_CMD_GRP_U8ARG_1 + 0x2,
    SND_SEQ_CMD_RELEASE         = SND_SEQ_CMD_GRP_U8ARG_1 + 0x3,
    SND_SEQ_CMD_LOOPSTART       = SND_SEQ_CMD_GRP_U8ARG_1 + 0x4,
    SND_SEQ_CMD_VOLUME2         = SND_SEQ_CMD_GRP_U8ARG_1 + 0x5,
    SND_SEQ_CMD_PRINT           = SND_SEQ_CMD_GRP_U8ARG_1 + 0x6,
    SND_SEQ_CMD_MUTE            = SND_SEQ_CMD_GRP_U8ARG_1 + 0x7,

    SND_SEQ_CMD_GRP_U16ARG      = 0xE0,
    SND_SEQ_CMD_MODDELAY        = SND_SEQ_CMD_GRP_U16ARG + 0x0,
    SND_SEQ_CMD_TEMPO           = SND_SEQ_CMD_GRP_U16ARG + 0x1,
    SND_SEQ_CMD_PITCHSWEEP      = SND_SEQ_CMD_GRP_U16ARG + 0x3,

    SND_SEQ_CMD_GRP_CNT         = 0xF0,
    SND_SEQ_CMD_LOOPEND         = SND_SEQ_CMD_GRP_CNT + 0xC,
    SND_SEQ_CMD_RETURN          = SND_SEQ_CMD_GRP_CNT + 0xD,
    SND_SEQ_CMD_TRACKNUM        = SND_SEQ_CMD_GRP_CNT + 0xE,
    SND_SEQ_CMD_TRACKEND        = SND_SEQ_CMD_GRP_CNT + 0xF,

    SND_SEQ_CMD_NOTNOTE_MASK    = 0x80,
    SND_SEQ_CMD_GRP_MASK        = 0xF0,
};

typedef struct SNDPlayer {
    u8 active_flag:1;
    u8 prepared_flag:1;
    u8 pause_flag:1;
    u8 pad_:5;
    u8 myNo;
    u8 pad2_;
    u8 pad3_;
    u8 prio;
    u8 volume;
    s16 extFader;
    u8 tracks[SND_TRACK_NUM_PER_PLAYER];
    u16 tempo;
    u16 tempo_ratio;
    u16 tempo_counter;
    u16 pad__;
    struct SNDBankData *bank;
} SNDPlayer;

typedef struct SNDTrack {
    u8 active_flag:1;
    u8 note_wait:1;
    u8 mute_flag:1;
    u8 tie_flag:1;
    u8 note_finish_wait:1;
    u8 porta_flag:1;
    u8 cmp_flag:1;
    u8 channel_mask_flag:1;
    u8 pan_range;
    u16 prgNo;
    u8 volume;
    u8 volume2;
    s8 pitch_bend;
    u8 bend_range;
    s8 pan;
    s8 ext_pan;
    s16 extFader;
    s16 ext_pitch;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 prio;
    s8 transpose;
    u8 porta_key;
    u8 porta_time;
    s16 sweep_pitch;
    struct SNDLfoParam mod;
    u16 channel_mask;
    s32 wait;
    const u8 *base;
    const u8 *cur;
    const u8 *call_stack[SND_TRACK_CALL_STACK_DEPTH];
    u8 loop_count[SND_TRACK_CALL_STACK_DEPTH];
    u8 call_stack_depth;
    struct SNDExChannel *channel_list;
} SNDTrack;

void SND_SeqInit(void);
void SND_SeqMain(BOOL doPeriodicProc);

#endif //NITRO_SND_COMMON_SEQ_H_
