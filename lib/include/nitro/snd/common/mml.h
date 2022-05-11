#ifndef NITRO_SND_COMMON_MML_H_
#define NITRO_SND_COMMON_MML_H_

#define SND_MML_WAIT        0x80
#define SND_MML_PRG         0x81

#define SND_MML_OPEN_TRACK  0x93
#define SND_MML_JUMP        0x94
#define SND_MML_CALL        0x95

#define SND_MML_RANDOM      0xa0
#define SND_MML_VARIABLE    0xa1
#define SND_MML_IF          0xa2

#define SND_MML_SETVAR      0xb0
#define SND_MML_ADDVAR      0xb1
#define SND_MML_SUBVAR      0xb2
#define SND_MML_MULVAR      0xb3
#define SND_MML_DIVVAR      0xb4
#define SND_MML_SHIFTVAR    0xb5
#define SND_MML_RANDVAR     0xb6

#define SND_MML_CMP_EQ      0xb8
#define SND_MML_CMP_GE      0xb9
#define SND_MML_CMP_GT      0xba
#define SND_MML_CMP_LE      0xbb
#define SND_MML_CMP_LT      0xbc
#define SND_MML_CMP_NE      0xbd

#define SND_MML_PAN         0xc0
#define SND_MML_VOLUME      0xc1
#define SND_MML_MAIN_VOLUME 0xc2
#define SND_MML_TRANSPOSE   0xc3
#define SND_MML_PITCH_BEND  0xc4
#define SND_MML_BEND_RANGE  0xc5
#define SND_MML_PRIO        0xc6
#define SND_MML_NOTE_WAIT   0xc7
#define SND_MML_TIE         0xc8
#define SND_MML_PORTA       0xc9
#define SND_MML_MOD_DEPTH   0xca
#define SND_MML_MOD_SPEED   0xcb
#define SND_MML_MOD_TYPE    0xcc
#define SND_MML_MOD_RANGE   0xcd
#define SND_MML_PORTA_SW    0xce
#define SND_MML_PORTA_TIME  0xcf
#define SND_MML_ATTACK      0xd0
#define SND_MML_DECAY       0xd1
#define SND_MML_SUSTAIN     0xd2
#define SND_MML_RELEASE     0xd3
#define SND_MML_LOOP_START  0xd4
#define SND_MML_VOLUME2     0xd5
#define SND_MML_PRINTVAR    0xd6
#define SND_MML_MUTE        0xd7

#define SND_MML_MOD_DELAY   0xe0
#define SND_MML_TEMPO       0xe1
#define SND_MML_SWEEP_PITCH 0xe3

#define SND_MML_LOOP_END    0xfc
#define SND_MML_RET         0xfd
#define SND_MML_ALLOC_TRACK 0xfe
#define SND_MML_FIN         0xff

#endif //NITRO_SND_COMMON_MML_H_
