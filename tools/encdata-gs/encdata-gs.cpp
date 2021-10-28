#include "global.h"
#include "CsvFile.h"
#include "ParseSpeciesHeader.h"
#include "EncounterDataColumns.h"
#include "../../lib/include/nitro/types.h"
#include "../../include/wild_encounter.h"
#include "version.h"

enum Mode {
    MODE_COMPILE,
    MODE_DUMP
};

struct Options {
    Mode mode = MODE_COMPILE;
    CsvFile csvfile;
    SpeciesMap species_h;
    fs::path bindir;
    std::vector<std::string> posargs;
    Options(int argc, char * argv[]);
    int main();
private:
    int main_compile();
    int main_dump();
};

static void usage() {
    std::cout << "Usage: encdata-gs [-h] [-v] [-d] CSV HEADER OUT" << std::endl;
    std::cout << std::endl;
    std::cout << "CSV      CSV file containing a human-readable representation of the wild encounter data" << std::endl;
    std::cout << "HEADER   C header file with the species constants" << std::endl;
    std::cout << "OUT      Directory to write binary files" << std::endl;
    std::cout << "-d       Run in dump mode (binary --> csv). Default: compile (csv --> binary)" << std::endl;
    std::cout << "-v       Print the software version and exit" << std::endl;
    std::cout << "-h       Print this message and exit" << std::endl;
}

Options::Options(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        std::string arg(argv[i]);
        if (arg == "-h") {
            usage();
            std::exit(0);
        } else if (arg == "-v") {
            std::cout << "encdata-gs v" << VERSION_STRING << std::endl;
            std::exit(0);
        } else if (arg == "-d") {
            mode = MODE_DUMP;
        } else if (arg[0] == '-') {
            usage();
            std::cerr << "invalid flag: " << arg << std::endl;
            std::exit(1);
        } else {
            posargs.push_back(arg);
        }
    }
    assert(posargs.size() >= 3);
    if (mode == MODE_COMPILE) {
        csvfile.FromFile(posargs[0]);
    }
    ParseSpeciesHeader(posargs[1], species_h);
    bindir = posargs[2];
}

int Options::main_compile() {
    int i = 0;
    for (const auto & row : csvfile) {
        fs::path outfilename = bindir / ("bin_" + std::to_string(i) + "_" + row[ENCDATA_MAPNAME] + ".bin");
        std::ofstream binfile(outfilename, std::ios::binary);
        ENC_DATA encData {};
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
        encData.landSlots.species_morn[0] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN0]];
        encData.landSlots.species_morn[1] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN1]];
        encData.landSlots.species_morn[2] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN2]];
        encData.landSlots.species_morn[3] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN3]];
        encData.landSlots.species_morn[4] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN4]];
        encData.landSlots.species_morn[5] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN5]];
        encData.landSlots.species_morn[6] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN6]];
        encData.landSlots.species_morn[7] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN7]];
        encData.landSlots.species_morn[8] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN8]];
        encData.landSlots.species_morn[9] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN9]];
        encData.landSlots.species_morn[10] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN10]];
        encData.landSlots.species_morn[11] = (u16)species_h[row[ENCDATA_LAND_SPECIES_MORN11]];
        encData.landSlots.species_day[0] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY0]];
        encData.landSlots.species_day[1] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY1]];
        encData.landSlots.species_day[2] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY2]];
        encData.landSlots.species_day[3] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY3]];
        encData.landSlots.species_day[4] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY4]];
        encData.landSlots.species_day[5] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY5]];
        encData.landSlots.species_day[6] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY6]];
        encData.landSlots.species_day[7] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY7]];
        encData.landSlots.species_day[8] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY8]];
        encData.landSlots.species_day[9] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY9]];
        encData.landSlots.species_day[10] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY10]];
        encData.landSlots.species_day[11] = (u16)species_h[row[ENCDATA_LAND_SPECIES_DAY11]];
        encData.landSlots.species_nite[0] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE0]];
        encData.landSlots.species_nite[1] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE1]];
        encData.landSlots.species_nite[2] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE2]];
        encData.landSlots.species_nite[3] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE3]];
        encData.landSlots.species_nite[4] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE4]];
        encData.landSlots.species_nite[5] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE5]];
        encData.landSlots.species_nite[6] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE6]];
        encData.landSlots.species_nite[7] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE7]];
        encData.landSlots.species_nite[8] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE8]];
        encData.landSlots.species_nite[9] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE9]];
        encData.landSlots.species_nite[10] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE10]];
        encData.landSlots.species_nite[11] = (u16)species_h[row[ENCDATA_LAND_SPECIES_NITE11]];
        encData.hoennSoundsSpecies[0] = (u16)species_h[row[ENCDATA_HOENN1]];
        encData.hoennSoundsSpecies[1] = (u16)species_h[row[ENCDATA_HOENN2]];
        encData.sinnohSoundsSpecies[0] = (u16)species_h[row[ENCDATA_SINNOH1]];
        encData.sinnohSoundsSpecies[1] = (u16)species_h[row[ENCDATA_SINNOH2]];
        encData.surfSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF0]);
        encData.surfSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF0]);
        encData.surfSlots[0].species = (u16)species_h[row[ENCDATA_SPECIES_SURF0]];
        encData.surfSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF1]);
        encData.surfSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF1]);
        encData.surfSlots[1].species = (u16)species_h[row[ENCDATA_SPECIES_SURF1]];
        encData.surfSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF2]);
        encData.surfSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF2]);
        encData.surfSlots[2].species = (u16)species_h[row[ENCDATA_SPECIES_SURF2]];
        encData.surfSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF3]);
        encData.surfSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF3]);
        encData.surfSlots[3].species = (u16)species_h[row[ENCDATA_SPECIES_SURF3]];
        encData.surfSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SURF4]);
        encData.surfSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SURF4]);
        encData.surfSlots[4].species = (u16)species_h[row[ENCDATA_SPECIES_SURF4]];
        encData.rockSmashSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SMASH0]);
        encData.rockSmashSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SMASH0]);
        encData.rockSmashSlots[0].species = (u16)species_h[row[ENCDATA_SPECIES_SMASH0]];
        encData.rockSmashSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SMASH1]);
        encData.rockSmashSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SMASH1]);
        encData.rockSmashSlots[1].species = (u16)species_h[row[ENCDATA_SPECIES_SMASH1]];
        encData.oldRodSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD0]);
        encData.oldRodSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD0]);
        encData.oldRodSlots[0].species = (u16)species_h[row[ENCDATA_SPECIES_OLDROD0]];
        encData.oldRodSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD1]);
        encData.oldRodSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD1]);
        encData.oldRodSlots[1].species = (u16)species_h[row[ENCDATA_SPECIES_OLDROD1]];
        encData.oldRodSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD2]);
        encData.oldRodSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD2]);
        encData.oldRodSlots[2].species = (u16)species_h[row[ENCDATA_SPECIES_OLDROD2]];
        encData.oldRodSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD3]);
        encData.oldRodSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD3]);
        encData.oldRodSlots[3].species = (u16)species_h[row[ENCDATA_SPECIES_OLDROD3]];
        encData.oldRodSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_OLDROD4]);
        encData.oldRodSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_OLDROD4]);
        encData.oldRodSlots[4].species = (u16)species_h[row[ENCDATA_SPECIES_OLDROD4]];
        encData.goodRodSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD0]);
        encData.goodRodSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD0]);
        encData.goodRodSlots[0].species = (u16)species_h[row[ENCDATA_SPECIES_GOODROD0]];
        encData.goodRodSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD1]);
        encData.goodRodSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD1]);
        encData.goodRodSlots[1].species = (u16)species_h[row[ENCDATA_SPECIES_GOODROD1]];
        encData.goodRodSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD2]);
        encData.goodRodSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD2]);
        encData.goodRodSlots[2].species = (u16)species_h[row[ENCDATA_SPECIES_GOODROD2]];
        encData.goodRodSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD3]);
        encData.goodRodSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD3]);
        encData.goodRodSlots[3].species = (u16)species_h[row[ENCDATA_SPECIES_GOODROD3]];
        encData.goodRodSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_GOODROD4]);
        encData.goodRodSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_GOODROD4]);
        encData.goodRodSlots[4].species = (u16)species_h[row[ENCDATA_SPECIES_GOODROD4]];
        encData.superRodSlots[0].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD0]);
        encData.superRodSlots[0].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD0]);
        encData.superRodSlots[0].species = (u16)species_h[row[ENCDATA_SPECIES_SUPERROD0]];
        encData.superRodSlots[1].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD1]);
        encData.superRodSlots[1].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD1]);
        encData.superRodSlots[1].species = (u16)species_h[row[ENCDATA_SPECIES_SUPERROD1]];
        encData.superRodSlots[2].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD2]);
        encData.superRodSlots[2].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD2]);
        encData.superRodSlots[2].species = (u16)species_h[row[ENCDATA_SPECIES_SUPERROD2]];
        encData.superRodSlots[3].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD3]);
        encData.superRodSlots[3].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD3]);
        encData.superRodSlots[3].species = (u16)species_h[row[ENCDATA_SPECIES_SUPERROD3]];
        encData.superRodSlots[4].level_min = (u8)std::stoi(row[ENCDATA_LVL_MIN_SUPERROD4]);
        encData.superRodSlots[4].level_max = (u8)std::stoi(row[ENCDATA_LVL_MAX_SUPERROD4]);
        encData.superRodSlots[4].species = (u16)species_h[row[ENCDATA_SPECIES_SUPERROD4]];
        encData.swarmSpecies[0] = (u16)species_h[row[ENCDATA_SWARM_SPECIES0]];
        encData.swarmSpecies[1] = (u16)species_h[row[ENCDATA_SWARM_SPECIES1]];
        encData.swarmSpecies[2] = (u16)species_h[row[ENCDATA_SWARM_SPECIES2]];
        encData.swarmSpecies[3] = (u16)species_h[row[ENCDATA_SWARM_SPECIES3]];
        binfile.write((const char *)&encData, sizeof(ENC_DATA));
    }
    return 0;
}

int Options::main_dump() {
    std::vector<fs::path> contents;
    for (auto const & path : fs::directory_iterator(bindir)) {
        if (path.is_regular_file() && path.path().extension() == ".bin") {
            contents.push_back(path.path());
        }
    }
    std::sort(contents.begin(), contents.end());
    csvfile.resize(contents.size(), ENCDATA_NCOL);
    for (auto const & path : contents) {
        std::ifstream binfile(path, std::ios::binary);
        ENC_DATA encData {};
    }
}

int Options::main() {
    return (mode == MODE_COMPILE) ? main_compile() : main_dump();
}

int main(int argc, char * argv[]) {
    Options options(argc, argv);
    options.main();
}
