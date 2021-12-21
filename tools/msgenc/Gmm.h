#ifndef GUARD_GMM_H
#define GUARD_GMM_H


#include <string>
#include <vector>
#include <fstream>
#include "pugixml.hpp"

class GMM {
    std::string filename;
    std::fstream stream;
    pugi::xml_document doc;
public:
    GMM(std::string &_filename, std::ios::openmode _openmode) : filename(_filename), stream(_filename, _openmode) {}
    void FromFile(std::vector<std::string> &messages);
    void ToFile(std::vector<std::string> const &messages);
};


#endif //GUARD_GMM_H
