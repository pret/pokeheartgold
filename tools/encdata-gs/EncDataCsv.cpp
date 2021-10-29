#include <array>
#include "EncDataCsv.h"

const std::array<std::string, ENCDATA_NCOL> default_colnames {
    "mapname",
    "rate_walk",
    "rate_surf",
    "rate_smash",
    "rate_oldrod",
    "rate_goodrod",
    "rate_superrod",
    "land_lvl0",
    "land_lvl1",
    "land_lvl2",
    "land_lvl3",
    "land_lvl4",
    "land_lvl5",
    "land_lvl6",
    "land_lvl7",
    "land_lvl8",
    "land_lvl9",
    "land_lvl10",
    "land_lvl11",
    "land_species_morn0",
    "land_species_morn1",
    "land_species_morn2",
    "land_species_morn3",
    "land_species_morn4",
    "land_species_morn5",
    "land_species_morn6",
    "land_species_morn7",
    "land_species_morn8",
    "land_species_morn9",
    "land_species_morn10",
    "land_species_morn11",
    "land_species_day0",
    "land_species_day1",
    "land_species_day2",
    "land_species_day3",
    "land_species_day4",
    "land_species_day5",
    "land_species_day6",
    "land_species_day7",
    "land_species_day8",
    "land_species_day9",
    "land_species_day10",
    "land_species_day11",
    "land_species_nite0",
    "land_species_nite1",
    "land_species_nite2",
    "land_species_nite3",
    "land_species_nite4",
    "land_species_nite5",
    "land_species_nite6",
    "land_species_nite7",
    "land_species_nite8",
    "land_species_nite9",
    "land_species_nite10",
    "land_species_nite11",
    "hoenn1",
    "hoenn2",
    "sinnoh1",
    "sinnoh2",
    "lvl_min_surf0",
    "lvl_max_surf0",
    "species_surf0",
    "lvl_min_surf1",
    "lvl_max_surf1",
    "species_surf1",
    "lvl_min_surf2",
    "lvl_max_surf2",
    "species_surf2",
    "lvl_min_surf3",
    "lvl_max_surf3",
    "species_surf3",
    "lvl_min_surf4",
    "lvl_max_surf4",
    "species_surf4",
    "lvl_min_smash0",
    "lvl_max_smash0",
    "species_smash0",
    "lvl_min_smash1",
    "lvl_max_smash1",
    "species_smash1",
    "lvl_min_oldrod0",
    "lvl_max_oldrod0",
    "species_oldrod0",
    "lvl_min_oldrod1",
    "lvl_max_oldrod1",
    "species_oldrod1",
    "lvl_min_oldrod2",
    "lvl_max_oldrod2",
    "species_oldrod2",
    "lvl_min_oldrod3",
    "lvl_max_oldrod3",
    "species_oldrod3",
    "lvl_min_oldrod4",
    "lvl_max_oldrod4",
    "species_oldrod4",
    "lvl_min_goodrod0",
    "lvl_max_goodrod0",
    "species_goodrod0",
    "lvl_min_goodrod1",
    "lvl_max_goodrod1",
    "species_goodrod1",
    "lvl_min_goodrod2",
    "lvl_max_goodrod2",
    "species_goodrod2",
    "lvl_min_goodrod3",
    "lvl_max_goodrod3",
    "species_goodrod3",
    "lvl_min_goodrod4",
    "lvl_max_goodrod4",
    "species_goodrod4",
    "lvl_min_superrod0",
    "lvl_max_superrod0",
    "species_superrod0",
    "lvl_min_superrod1",
    "lvl_max_superrod1",
    "species_superrod1",
    "lvl_min_superrod2",
    "lvl_max_superrod2",
    "species_superrod2",
    "lvl_min_superrod3",
    "lvl_max_superrod3",
    "species_superrod3",
    "lvl_min_superrod4",
    "lvl_max_superrod4",
    "species_superrod4",
    "swarm_species0",
    "swarm_species1",
    "swarm_species2",
    "swarm_species3",
};

void EncDataCsv::ToFile(const fs::path &path, bool write_header) {
    SetColnames(default_colnames.cbegin(), default_colnames.cend());
    CsvFile::ToFile(path, write_header);
}

void EncDataCsv::from_struct(int i, const ENC_DATA &encData, const SpeciesRevMap &species_h_rev) {
    std::vector<std::string> &row = operator[](i);
    row[ENCDATA_RATE_WALK] = std::to_string(encData.encounterRate_walking);
    row[ENCDATA_RATE_SURF] = std::to_string(encData.encounterRate_surfing);
    row[ENCDATA_RATE_SMASH] = std::to_string(encData.encounterRate_rockSmash);
    row[ENCDATA_RATE_OLDROD] = std::to_string(encData.encounterRate_oldRod);
    row[ENCDATA_RATE_GOODROD] = std::to_string(encData.encounterRate_goodRod);
    row[ENCDATA_RATE_SUPERROD] = std::to_string(encData.encounterRate_superRod);
    row[ENCDATA_LAND_LVL0] = std::to_string(encData.landSlots.levels[0]);
    row[ENCDATA_LAND_LVL1] = std::to_string(encData.landSlots.levels[1]);
    row[ENCDATA_LAND_LVL2] = std::to_string(encData.landSlots.levels[2]);
    row[ENCDATA_LAND_LVL3] = std::to_string(encData.landSlots.levels[3]);
    row[ENCDATA_LAND_LVL4] = std::to_string(encData.landSlots.levels[4]);
    row[ENCDATA_LAND_LVL5] = std::to_string(encData.landSlots.levels[5]);
    row[ENCDATA_LAND_LVL6] = std::to_string(encData.landSlots.levels[6]);
    row[ENCDATA_LAND_LVL7] = std::to_string(encData.landSlots.levels[7]);
    row[ENCDATA_LAND_LVL8] = std::to_string(encData.landSlots.levels[8]);
    row[ENCDATA_LAND_LVL9] = std::to_string(encData.landSlots.levels[9]);
    row[ENCDATA_LAND_LVL10] = std::to_string(encData.landSlots.levels[10]);
    row[ENCDATA_LAND_LVL11] = std::to_string(encData.landSlots.levels[11]);
    row[ENCDATA_LAND_SPECIES_MORN0] = species_h_rev.at(encData.landSlots.species_morn[0]);
    row[ENCDATA_LAND_SPECIES_MORN1] = species_h_rev.at(encData.landSlots.species_morn[1]);
    row[ENCDATA_LAND_SPECIES_MORN2] = species_h_rev.at(encData.landSlots.species_morn[2]);
    row[ENCDATA_LAND_SPECIES_MORN3] = species_h_rev.at(encData.landSlots.species_morn[3]);
    row[ENCDATA_LAND_SPECIES_MORN4] = species_h_rev.at(encData.landSlots.species_morn[4]);
    row[ENCDATA_LAND_SPECIES_MORN5] = species_h_rev.at(encData.landSlots.species_morn[5]);
    row[ENCDATA_LAND_SPECIES_MORN6] = species_h_rev.at(encData.landSlots.species_morn[6]);
    row[ENCDATA_LAND_SPECIES_MORN7] = species_h_rev.at(encData.landSlots.species_morn[7]);
    row[ENCDATA_LAND_SPECIES_MORN8] = species_h_rev.at(encData.landSlots.species_morn[8]);
    row[ENCDATA_LAND_SPECIES_MORN9] = species_h_rev.at(encData.landSlots.species_morn[9]);
    row[ENCDATA_LAND_SPECIES_MORN10] = species_h_rev.at(encData.landSlots.species_morn[10]);
    row[ENCDATA_LAND_SPECIES_MORN11] = species_h_rev.at(encData.landSlots.species_morn[11]);
    row[ENCDATA_LAND_SPECIES_DAY0] = species_h_rev.at(encData.landSlots.species_day[0]);
    row[ENCDATA_LAND_SPECIES_DAY1] = species_h_rev.at(encData.landSlots.species_day[1]);
    row[ENCDATA_LAND_SPECIES_DAY2] = species_h_rev.at(encData.landSlots.species_day[2]);
    row[ENCDATA_LAND_SPECIES_DAY3] = species_h_rev.at(encData.landSlots.species_day[3]);
    row[ENCDATA_LAND_SPECIES_DAY4] = species_h_rev.at(encData.landSlots.species_day[4]);
    row[ENCDATA_LAND_SPECIES_DAY5] = species_h_rev.at(encData.landSlots.species_day[5]);
    row[ENCDATA_LAND_SPECIES_DAY6] = species_h_rev.at(encData.landSlots.species_day[6]);
    row[ENCDATA_LAND_SPECIES_DAY7] = species_h_rev.at(encData.landSlots.species_day[7]);
    row[ENCDATA_LAND_SPECIES_DAY8] = species_h_rev.at(encData.landSlots.species_day[8]);
    row[ENCDATA_LAND_SPECIES_DAY9] = species_h_rev.at(encData.landSlots.species_day[9]);
    row[ENCDATA_LAND_SPECIES_DAY10] = species_h_rev.at(encData.landSlots.species_day[10]);
    row[ENCDATA_LAND_SPECIES_DAY11] = species_h_rev.at(encData.landSlots.species_day[11]);
    row[ENCDATA_LAND_SPECIES_NITE0] = species_h_rev.at(encData.landSlots.species_nite[0]);
    row[ENCDATA_LAND_SPECIES_NITE1] = species_h_rev.at(encData.landSlots.species_nite[1]);
    row[ENCDATA_LAND_SPECIES_NITE2] = species_h_rev.at(encData.landSlots.species_nite[2]);
    row[ENCDATA_LAND_SPECIES_NITE3] = species_h_rev.at(encData.landSlots.species_nite[3]);
    row[ENCDATA_LAND_SPECIES_NITE4] = species_h_rev.at(encData.landSlots.species_nite[4]);
    row[ENCDATA_LAND_SPECIES_NITE5] = species_h_rev.at(encData.landSlots.species_nite[5]);
    row[ENCDATA_LAND_SPECIES_NITE6] = species_h_rev.at(encData.landSlots.species_nite[6]);
    row[ENCDATA_LAND_SPECIES_NITE7] = species_h_rev.at(encData.landSlots.species_nite[7]);
    row[ENCDATA_LAND_SPECIES_NITE8] = species_h_rev.at(encData.landSlots.species_nite[8]);
    row[ENCDATA_LAND_SPECIES_NITE9] = species_h_rev.at(encData.landSlots.species_nite[9]);
    row[ENCDATA_LAND_SPECIES_NITE10] = species_h_rev.at(encData.landSlots.species_nite[10]);
    row[ENCDATA_LAND_SPECIES_NITE11] = species_h_rev.at(encData.landSlots.species_nite[11]);
    row[ENCDATA_HOENN1] = species_h_rev.at(encData.hoennSoundsSpecies[0]);
    row[ENCDATA_HOENN2] = species_h_rev.at(encData.hoennSoundsSpecies[1]);
    row[ENCDATA_SINNOH1] = species_h_rev.at(encData.sinnohSoundsSpecies[0]);
    row[ENCDATA_SINNOH2] = species_h_rev.at(encData.sinnohSoundsSpecies[1]);
    row[ENCDATA_LVL_MIN_SURF0] = std::to_string(encData.surfSlots[0].level_min);
    row[ENCDATA_LVL_MAX_SURF0] = std::to_string(encData.surfSlots[0].level_max);
    row[ENCDATA_SPECIES_SURF0] = species_h_rev.at(encData.surfSlots[0].species);
    row[ENCDATA_LVL_MIN_SURF1] = std::to_string(encData.surfSlots[1].level_min);
    row[ENCDATA_LVL_MAX_SURF1] = std::to_string(encData.surfSlots[1].level_max);
    row[ENCDATA_SPECIES_SURF1] = species_h_rev.at(encData.surfSlots[1].species);
    row[ENCDATA_LVL_MIN_SURF2] = std::to_string(encData.surfSlots[2].level_min);
    row[ENCDATA_LVL_MAX_SURF2] = std::to_string(encData.surfSlots[2].level_max);
    row[ENCDATA_SPECIES_SURF2] = species_h_rev.at(encData.surfSlots[2].species);
    row[ENCDATA_LVL_MIN_SURF3] = std::to_string(encData.surfSlots[3].level_min);
    row[ENCDATA_LVL_MAX_SURF3] = std::to_string(encData.surfSlots[3].level_max);
    row[ENCDATA_SPECIES_SURF3] = species_h_rev.at(encData.surfSlots[3].species);
    row[ENCDATA_LVL_MIN_SURF4] = std::to_string(encData.surfSlots[4].level_min);
    row[ENCDATA_LVL_MAX_SURF4] = std::to_string(encData.surfSlots[4].level_max);
    row[ENCDATA_SPECIES_SURF4] = species_h_rev.at(encData.surfSlots[4].species);
    row[ENCDATA_LVL_MIN_SMASH0] = std::to_string(encData.rockSmashSlots[0].level_min);
    row[ENCDATA_LVL_MAX_SMASH0] = std::to_string(encData.rockSmashSlots[0].level_max);
    row[ENCDATA_SPECIES_SMASH0] = species_h_rev.at(encData.rockSmashSlots[0].species);
    row[ENCDATA_LVL_MIN_SMASH1] = std::to_string(encData.rockSmashSlots[1].level_min);
    row[ENCDATA_LVL_MAX_SMASH1] = std::to_string(encData.rockSmashSlots[1].level_max);
    row[ENCDATA_SPECIES_SMASH1] = species_h_rev.at(encData.rockSmashSlots[1].species);
    row[ENCDATA_LVL_MIN_OLDROD0] = std::to_string(encData.oldRodSlots[0].level_min);
    row[ENCDATA_LVL_MAX_OLDROD0] = std::to_string(encData.oldRodSlots[0].level_max);
    row[ENCDATA_SPECIES_OLDROD0] = species_h_rev.at(encData.oldRodSlots[0].species);
    row[ENCDATA_LVL_MIN_OLDROD1] = std::to_string(encData.oldRodSlots[1].level_min);
    row[ENCDATA_LVL_MAX_OLDROD1] = std::to_string(encData.oldRodSlots[1].level_max);
    row[ENCDATA_SPECIES_OLDROD1] = species_h_rev.at(encData.oldRodSlots[1].species);
    row[ENCDATA_LVL_MIN_OLDROD2] = std::to_string(encData.oldRodSlots[2].level_min);
    row[ENCDATA_LVL_MAX_OLDROD2] = std::to_string(encData.oldRodSlots[2].level_max);
    row[ENCDATA_SPECIES_OLDROD2] = species_h_rev.at(encData.oldRodSlots[2].species);
    row[ENCDATA_LVL_MIN_OLDROD3] = std::to_string(encData.oldRodSlots[3].level_min);
    row[ENCDATA_LVL_MAX_OLDROD3] = std::to_string(encData.oldRodSlots[3].level_max);
    row[ENCDATA_SPECIES_OLDROD3] = species_h_rev.at(encData.oldRodSlots[3].species);
    row[ENCDATA_LVL_MIN_OLDROD4] = std::to_string(encData.oldRodSlots[4].level_min);
    row[ENCDATA_LVL_MAX_OLDROD4] = std::to_string(encData.oldRodSlots[4].level_max);
    row[ENCDATA_SPECIES_OLDROD4] = species_h_rev.at(encData.oldRodSlots[4].species);
    row[ENCDATA_LVL_MIN_GOODROD0] = std::to_string(encData.goodRodSlots[0].level_min);
    row[ENCDATA_LVL_MAX_GOODROD0] = std::to_string(encData.goodRodSlots[0].level_max);
    row[ENCDATA_SPECIES_GOODROD0] = species_h_rev.at(encData.goodRodSlots[0].species);
    row[ENCDATA_LVL_MIN_GOODROD1] = std::to_string(encData.goodRodSlots[1].level_min);
    row[ENCDATA_LVL_MAX_GOODROD1] = std::to_string(encData.goodRodSlots[1].level_max);
    row[ENCDATA_SPECIES_GOODROD1] = species_h_rev.at(encData.goodRodSlots[1].species);
    row[ENCDATA_LVL_MIN_GOODROD2] = std::to_string(encData.goodRodSlots[2].level_min);
    row[ENCDATA_LVL_MAX_GOODROD2] = std::to_string(encData.goodRodSlots[2].level_max);
    row[ENCDATA_SPECIES_GOODROD2] = species_h_rev.at(encData.goodRodSlots[2].species);
    row[ENCDATA_LVL_MIN_GOODROD3] = std::to_string(encData.goodRodSlots[3].level_min);
    row[ENCDATA_LVL_MAX_GOODROD3] = std::to_string(encData.goodRodSlots[3].level_max);
    row[ENCDATA_SPECIES_GOODROD3] = species_h_rev.at(encData.goodRodSlots[3].species);
    row[ENCDATA_LVL_MIN_GOODROD4] = std::to_string(encData.goodRodSlots[4].level_min);
    row[ENCDATA_LVL_MAX_GOODROD4] = std::to_string(encData.goodRodSlots[4].level_max);
    row[ENCDATA_SPECIES_GOODROD4] = species_h_rev.at(encData.goodRodSlots[4].species);
    row[ENCDATA_LVL_MIN_SUPERROD0] = std::to_string(encData.superRodSlots[0].level_min);
    row[ENCDATA_LVL_MAX_SUPERROD0] = std::to_string(encData.superRodSlots[0].level_max);
    row[ENCDATA_SPECIES_SUPERROD0] = species_h_rev.at(encData.superRodSlots[0].species);
    row[ENCDATA_LVL_MIN_SUPERROD1] = std::to_string(encData.superRodSlots[1].level_min);
    row[ENCDATA_LVL_MAX_SUPERROD1] = std::to_string(encData.superRodSlots[1].level_max);
    row[ENCDATA_SPECIES_SUPERROD1] = species_h_rev.at(encData.superRodSlots[1].species);
    row[ENCDATA_LVL_MIN_SUPERROD2] = std::to_string(encData.superRodSlots[2].level_min);
    row[ENCDATA_LVL_MAX_SUPERROD2] = std::to_string(encData.superRodSlots[2].level_max);
    row[ENCDATA_SPECIES_SUPERROD2] = species_h_rev.at(encData.superRodSlots[2].species);
    row[ENCDATA_LVL_MIN_SUPERROD3] = std::to_string(encData.superRodSlots[3].level_min);
    row[ENCDATA_LVL_MAX_SUPERROD3] = std::to_string(encData.superRodSlots[3].level_max);
    row[ENCDATA_SPECIES_SUPERROD3] = species_h_rev.at(encData.superRodSlots[3].species);
    row[ENCDATA_LVL_MIN_SUPERROD4] = std::to_string(encData.superRodSlots[4].level_min);
    row[ENCDATA_LVL_MAX_SUPERROD4] = std::to_string(encData.superRodSlots[4].level_max);
    row[ENCDATA_SPECIES_SUPERROD4] = species_h_rev.at(encData.superRodSlots[4].species);
    row[ENCDATA_SWARM_SPECIES0] = species_h_rev.at(encData.swarmSpecies[0]);
    row[ENCDATA_SWARM_SPECIES1] = species_h_rev.at(encData.swarmSpecies[1]);
    row[ENCDATA_SWARM_SPECIES2] = species_h_rev.at(encData.swarmSpecies[2]);
    row[ENCDATA_SWARM_SPECIES3] = species_h_rev.at(encData.swarmSpecies[3]);
}

void EncDataCsv::to_struct(int i, ENC_DATA &encData, const SpeciesMap &species_h) {
    const std::vector<std::string> &row = operator[](i);
    encData.encounterRate_walking = (u8)std::stoi(row[ENCDATA_RATE_WALK]);
    encData.encounterRate_surfing = (u8)std::stoi(row[ENCDATA_RATE_SURF]);
    encData.encounterRate_rockSmash = (u8)std::stoi(row[ENCDATA_RATE_SMASH]);
    encData.encounterRate_oldRod = (u8)std::stoi(row[ENCDATA_RATE_OLDROD]);
    encData.encounterRate_goodRod = (u8)std::stoi(row[ENCDATA_RATE_GOODROD]);
    encData.encounterRate_superRod = (u8)std::stoi(row[ENCDATA_RATE_SUPERROD]);
    encData.landSlots.levels[0] = (u8)std::stoi(row[ENCDATA_LAND_LVL0]);
    encData.landSlots.levels[1] = (u8)std::stoi(row[ENCDATA_LAND_LVL1]);
    encData.landSlots.levels[2] = (u8)std::stoi(row[ENCDATA_LAND_LVL2]);
    encData.landSlots.levels[3] = (u8)std::stoi(row[ENCDATA_LAND_LVL3]);
    encData.landSlots.levels[4] = (u8)std::stoi(row[ENCDATA_LAND_LVL4]);
    encData.landSlots.levels[5] = (u8)std::stoi(row[ENCDATA_LAND_LVL5]);
    encData.landSlots.levels[6] = (u8)std::stoi(row[ENCDATA_LAND_LVL6]);
    encData.landSlots.levels[7] = (u8)std::stoi(row[ENCDATA_LAND_LVL7]);
    encData.landSlots.levels[8] = (u8)std::stoi(row[ENCDATA_LAND_LVL8]);
    encData.landSlots.levels[9] = (u8)std::stoi(row[ENCDATA_LAND_LVL9]);
    encData.landSlots.levels[10] = (u8)std::stoi(row[ENCDATA_LAND_LVL10]);
    encData.landSlots.levels[11] = (u8)std::stoi(row[ENCDATA_LAND_LVL11]);
    encData.landSlots.species_morn[0] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN0]);
    encData.landSlots.species_morn[1] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN1]);
    encData.landSlots.species_morn[2] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN2]);
    encData.landSlots.species_morn[3] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN3]);
    encData.landSlots.species_morn[4] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN4]);
    encData.landSlots.species_morn[5] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN5]);
    encData.landSlots.species_morn[6] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN6]);
    encData.landSlots.species_morn[7] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN7]);
    encData.landSlots.species_morn[8] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN8]);
    encData.landSlots.species_morn[9] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN9]);
    encData.landSlots.species_morn[10] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN10]);
    encData.landSlots.species_morn[11] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_MORN11]);
    encData.landSlots.species_day[0] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY0]);
    encData.landSlots.species_day[1] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY1]);
    encData.landSlots.species_day[2] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY2]);
    encData.landSlots.species_day[3] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY3]);
    encData.landSlots.species_day[4] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY4]);
    encData.landSlots.species_day[5] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY5]);
    encData.landSlots.species_day[6] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY6]);
    encData.landSlots.species_day[7] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY7]);
    encData.landSlots.species_day[8] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY8]);
    encData.landSlots.species_day[9] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY9]);
    encData.landSlots.species_day[10] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY10]);
    encData.landSlots.species_day[11] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_DAY11]);
    encData.landSlots.species_nite[0] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE0]);
    encData.landSlots.species_nite[1] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE1]);
    encData.landSlots.species_nite[2] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE2]);
    encData.landSlots.species_nite[3] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE3]);
    encData.landSlots.species_nite[4] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE4]);
    encData.landSlots.species_nite[5] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE5]);
    encData.landSlots.species_nite[6] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE6]);
    encData.landSlots.species_nite[7] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE7]);
    encData.landSlots.species_nite[8] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE8]);
    encData.landSlots.species_nite[9] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE9]);
    encData.landSlots.species_nite[10] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE10]);
    encData.landSlots.species_nite[11] = (u16)species_h.at(row[ENCDATA_LAND_SPECIES_NITE11]);
    encData.hoennSoundsSpecies[0] = (u16)species_h.at(row[ENCDATA_HOENN1]);
    encData.hoennSoundsSpecies[1] = (u16)species_h.at(row[ENCDATA_HOENN2]);
    encData.sinnohSoundsSpecies[0] = (u16)species_h.at(row[ENCDATA_SINNOH1]);
    encData.sinnohSoundsSpecies[1] = (u16)species_h.at(row[ENCDATA_SINNOH2]);
    encData.surfSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF0]);
    encData.surfSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF0]);
    encData.surfSlots[0].species = (u16)species_h.at(row[ENCDATA_SPECIES_SURF0]);
    encData.surfSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF1]);
    encData.surfSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF1]);
    encData.surfSlots[1].species = (u16)species_h.at(row[ENCDATA_SPECIES_SURF1]);
    encData.surfSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF2]);
    encData.surfSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF2]);
    encData.surfSlots[2].species = (u16)species_h.at(row[ENCDATA_SPECIES_SURF2]);
    encData.surfSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF3]);
    encData.surfSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF3]);
    encData.surfSlots[3].species = (u16)species_h.at(row[ENCDATA_SPECIES_SURF3]);
    encData.surfSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF4]);
    encData.surfSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF4]);
    encData.surfSlots[4].species = (u16)species_h.at(row[ENCDATA_SPECIES_SURF4]);
    encData.rockSmashSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SMASH0]);
    encData.rockSmashSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SMASH0]);
    encData.rockSmashSlots[0].species = (u16)species_h.at(row[ENCDATA_SPECIES_SMASH0]);
    encData.rockSmashSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SMASH1]);
    encData.rockSmashSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SMASH1]);
    encData.rockSmashSlots[1].species = (u16)species_h.at(row[ENCDATA_SPECIES_SMASH1]);
    encData.oldRodSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD0]);
    encData.oldRodSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD0]);
    encData.oldRodSlots[0].species = (u16)species_h.at(row[ENCDATA_SPECIES_OLDROD0]);
    encData.oldRodSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD1]);
    encData.oldRodSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD1]);
    encData.oldRodSlots[1].species = (u16)species_h.at(row[ENCDATA_SPECIES_OLDROD1]);
    encData.oldRodSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD2]);
    encData.oldRodSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD2]);
    encData.oldRodSlots[2].species = (u16)species_h.at(row[ENCDATA_SPECIES_OLDROD2]);
    encData.oldRodSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD3]);
    encData.oldRodSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD3]);
    encData.oldRodSlots[3].species = (u16)species_h.at(row[ENCDATA_SPECIES_OLDROD3]);
    encData.oldRodSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD4]);
    encData.oldRodSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD4]);
    encData.oldRodSlots[4].species = (u16)species_h.at(row[ENCDATA_SPECIES_OLDROD4]);
    encData.goodRodSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD0]);
    encData.goodRodSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD0]);
    encData.goodRodSlots[0].species = (u16)species_h.at(row[ENCDATA_SPECIES_GOODROD0]);
    encData.goodRodSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD1]);
    encData.goodRodSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD1]);
    encData.goodRodSlots[1].species = (u16)species_h.at(row[ENCDATA_SPECIES_GOODROD1]);
    encData.goodRodSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD2]);
    encData.goodRodSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD2]);
    encData.goodRodSlots[2].species = (u16)species_h.at(row[ENCDATA_SPECIES_GOODROD2]);
    encData.goodRodSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD3]);
    encData.goodRodSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD3]);
    encData.goodRodSlots[3].species = (u16)species_h.at(row[ENCDATA_SPECIES_GOODROD3]);
    encData.goodRodSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD4]);
    encData.goodRodSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD4]);
    encData.goodRodSlots[4].species = (u16)species_h.at(row[ENCDATA_SPECIES_GOODROD4]);
    encData.superRodSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD0]);
    encData.superRodSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD0]);
    encData.superRodSlots[0].species = (u16)species_h.at(row[ENCDATA_SPECIES_SUPERROD0]);
    encData.superRodSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD1]);
    encData.superRodSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD1]);
    encData.superRodSlots[1].species = (u16)species_h.at(row[ENCDATA_SPECIES_SUPERROD1]);
    encData.superRodSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD2]);
    encData.superRodSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD2]);
    encData.superRodSlots[2].species = (u16)species_h.at(row[ENCDATA_SPECIES_SUPERROD2]);
    encData.superRodSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD3]);
    encData.superRodSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD3]);
    encData.superRodSlots[3].species = (u16)species_h.at(row[ENCDATA_SPECIES_SUPERROD3]);
    encData.superRodSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD4]);
    encData.superRodSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD4]);
    encData.superRodSlots[4].species = (u16)species_h.at(row[ENCDATA_SPECIES_SUPERROD4]);
    encData.swarmSpecies[0] = (u16)species_h.at(row[ENCDATA_SWARM_SPECIES0]);
    encData.swarmSpecies[1] = (u16)species_h.at(row[ENCDATA_SWARM_SPECIES1]);
    encData.swarmSpecies[2] = (u16)species_h.at(row[ENCDATA_SWARM_SPECIES2]);
    encData.swarmSpecies[3] = (u16)species_h.at(row[ENCDATA_SWARM_SPECIES3]);
}
