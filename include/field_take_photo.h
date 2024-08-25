#ifndef POKEHEARTGOLD_FIELD_TAKE_PHOTO_H
#define POKEHEARTGOLD_FIELD_TAKE_PHOTO_H

#include "photo_album.h"
#include "photo_types_def.h"
#include "script.h"

void FieldSystem_TakePhoto(FieldSystem *fieldSystem, u16 photo_id);
void FieldSystem_ViewSavedPhotos(FieldSystem *fieldSystem);
void FieldViewPhoto_GetAlbumScrollParam(FieldViewPhoto *takePhoto, PhotoAlbumScroll *albumScroll);
void FieldViewPhoto_SetPlayerInput(FieldViewPhoto *takePhoto, ViewPhotoInputResponse exitRequested);

#endif // POKEHEARTGOLD_FIELD_TAKE_PHOTO_H
