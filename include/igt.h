#ifndef POKEHEARTGOLD_IGT_H
#define POKEHEARTGOLD_IGT_H

struct IGT {
    u16 hours;
    u8 minutes;
    u8 seconds;
};

void InitIGT(struct IGT* igt);
void AddIGTSeconds(struct IGT* igt, u32 seconds_to_add);
u16 GetIGTHours(struct IGT* igt);
u8 GetIGTMinutes(struct IGT* igt);
u8 GetIGTSeconds(struct IGT* igt);

#endif
