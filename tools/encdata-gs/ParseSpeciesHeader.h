#ifndef GUARD_PARSESPECIESHEADER_H
#define GUARD_PARSESPECIESHEADER_H

#include "global.h"

using SpeciesMap = std::unordered_map<std::string, uint16_t>;

bool ParseSpeciesHeader(std::string &filename, SpeciesMap &map);

#endif //GUARD_PARSESPECIESHEADER_H
