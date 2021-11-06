#include "ParseSpeciesHeader.h"

bool ParseSpeciesHeader(std::string &filename, SpeciesMap &map) {
    std::ifstream strm(filename);
    std::string line;
    while (std::getline(strm, line)) {
        if (line.find("#define SPECIES_") == 0) {
            line = line.substr(8);
            int space_pos = line.find(' ');
            std::string species_name = line.substr(0, space_pos);
            space_pos = line.find_first_not_of(' ', space_pos);
            line = line.substr(space_pos);
            line = line.substr(0, line.find(' '));
            uint16_t value = (uint16_t)std::stoi(line);
            map[species_name] = value;
        }
    }
    return true;
}

bool ParseSpeciesHeader(std::string &filename, SpeciesRevMap &map) {
    std::ifstream strm(filename);
    std::string line;
    while (std::getline(strm, line)) {
        if (line.find("#define SPECIES_") == 0) {
            line = line.substr(8);
            int space_pos = line.find(' ');
            std::string species_name = line.substr(0, space_pos);
            space_pos = line.find_first_not_of(' ', space_pos);
            line = line.substr(space_pos);
            line = line.substr(0, line.find(' '));
            uint16_t value = (uint16_t)std::stoi(line);
            map[value] = species_name;
        }
    }
    return true;
}
