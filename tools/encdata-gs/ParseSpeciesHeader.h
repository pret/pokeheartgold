#ifndef GUARD_PARSESPECIESHEADER_H
#define GUARD_PARSESPECIESHEADER_H

#include "global.h"

using SpeciesMap = std::unordered_map<std::string, uint16_t>;
using SpeciesRevMap = std::unordered_map<uint16_t, std::string>;

bool ParseSpeciesHeader(std::string &filename, SpeciesMap &map);
bool ParseSpeciesHeader(std::string &filename, SpeciesRevMap &map);

#endif //GUARD_PARSESPECIESHEADER_H
