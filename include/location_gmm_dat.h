#ifndef GUARD_POKEHEARTGOLD_LOCATION_GMM_DAT_H
#define GUARD_POKEHEARTGOLD_LOCATION_GMM_DAT_H

#include "global.h"

int LocationGmmDatCountGet(void);
int LocationGmmDatIndexGetByCountryMsgNo(int country);
int LocationGmmDatRegionCountGetByCountryMsgNo(int country);
int GetCityNamesMsgdataIdByCountry(int country);
int LocationGmmDatGetGmmNo(int index);
int LocationGmmDatGetCountryMsgNo(int index);
int LocationGmmDatGetEarthPlaceDatId(int index);
const u8 *LocationGmmDatGetDistrictNameMsgIdsPtr(int index);
int LocationGmmDatGetDistrictCount(int index);

#endif // GUARD_POKEHEARTGOLD_LOCATION_GMM_DAT_H
