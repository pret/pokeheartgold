#include "global.h"


// Note: these structs are needed to match *only as long as the data is in the assembly*
// when the data gets decompiled, they should be embeded in the function as arrays
typedef struct TempStatsStruct {
    u32 stats[6];
} TempStatsStruct;


extern const u16 sPickupTable2[];
extern const u32 ov12_0226C324[];
extern const TempStatsStruct ov12_0226C33C;
extern const TempStatsStruct ov12_0226C354;
extern const TempStatsStruct ov12_0226C36C;
extern const TempStatsStruct ov12_0226C384;
extern const u16 sLowKickDamageTable[6][2];
extern const u16 sNaturePowerMoveTable[];
extern const u8 ov12_0226C3CE[][2];
extern const u16 ov12_0226C3E8[];
extern const u16 sPickupTable1[];
