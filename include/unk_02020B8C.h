#ifndef POKEHEARTGOLD_UNK_02020B8C_H
#define POKEHEARTGOLD_UNK_02020B8C_H

fx32 GetDistanceFromPointToLine(VecFx32 *a, VecFx32 *near, VecFx32 *far);
void sub_02020D2C(MtxFx33 *rotation, VecFx32 *a1);
void sub_02020E10(u16 perspectiveAngle, fx32 distance, fx32 aspect, fx32 *dx, fx32 *dy);

#endif // POKEHEARTGOLD_UNK_02020B8C_H
