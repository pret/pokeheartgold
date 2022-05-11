#ifndef POKEHEARTGOLD_STREAM_H
#define POKEHEARTGOLD_STREAM_H

typedef s32 (*MIi_InitReadStreamCallback) (const u8 *devicep, void *ramp, const void *paramp);
typedef s32 (*MIi_TerminateReadStreamCallback) (const u8 *devicep);
typedef u8 (*MIi_ReadByteStreamCallback) (const u8 *devicep);
typedef u16 (*MIi_ReadShortStreamCallback) (const u8 *devicep);
typedef u32 (*MIi_ReadWordStreamCallback) (const u8 *devicep);

typedef struct {
    MIi_InitReadStreamCallback initStream;
    MIi_TerminateReadStreamCallback terminateStream;
    MIi_ReadByteStreamCallback readByteStream;
    MIi_ReadShortStreamCallback readShortStream;
    MIi_ReadWordStreamCallback readWordStream;
} MIReadStreamCallbacks;

#endif //POKEHEARTGOLD_STREAM_H
