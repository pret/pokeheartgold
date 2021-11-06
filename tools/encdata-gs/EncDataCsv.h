#ifndef GUARD_ENCDATACSV_H
#define GUARD_ENCDATACSV_H

#include "global.h"
#include "CsvFile.h"
#include "EncounterDataColumns.h"
#include "ParseSpeciesHeader.h"
#include "../../lib/include/nitro/types.h"
#include "../../include/wild_encounter.h"

extern const std::array<std::string, ENCDATA_NCOL> default_colnames;

class EncDataCsv : public CsvFile {
public:
    EncDataCsv() : CsvFile() {}
    EncDataCsv(const fs::path &path, bool has_header = true) : CsvFile(path, has_header) {}
    void to_struct(int i, ENC_DATA &encData, const SpeciesMap &species_h);
    void from_struct(int i, ENC_DATA const &encData, const SpeciesRevMap &species_h_rev);
    void ToFile(const fs::path &path, bool write_header = true);
};


#endif //GUARD_ENCDATACSV_H
