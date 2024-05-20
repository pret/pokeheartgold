#ifndef POKEHEARTGOLD_FIELD_TAKE_PHOTO_H
#define POKEHEARTGOLD_FIELD_TAKE_PHOTO_H

#include "script.h"
#include "photo_album.h"
#include "photo_types_def.h"

void FieldSystem_TakePhoto(FieldSystem *fieldSystem, u16 photo_id);
void sub_0206A860(FieldSystem *fieldSystem);
void sub_0206A8C0(FieldViewPhoto *a0, PhotoAlbumScroll *a1);
void sub_0206A8DC(FieldViewPhoto *a0, int a1);

#endif //POKEHEARTGOLD_FIELD_TAKE_PHOTO_H
