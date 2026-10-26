#ifndef GUARD_POKEHEARTGOLD_GEONET_STATES_H
#define GUARD_POKEHEARTGOLD_GEONET_STATES_H

#include "global.h"

u32 GeonetLocations_GetLocationListCount(void);
u32 GeonetLocations_GetIndexFromCountry(u32 country);
u32 GeonetLocations_GetLocationCountFromCountry(u32 country);
u32 GeonetLocations_GetBankIDFromCountry(u32 country);
u32 GeonetLocations_GetBankID(u32 index);
u32 GeonetLocations_GetCountry(u32 index);
u32 GeonetLocations_GetNarcMemberIndex(u32 index);
const u8 *GeonetLocations_GetLocationList(u32 index);
u32 GeonetLocations_GetLocationCount(u32 index);

#endif // GUARD_POKEHEARTGOLD_GEONET_STATES_H
