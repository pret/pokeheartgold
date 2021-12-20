#ifndef GUARD_GMM_H
#define GUARD_GMM_H


#include <string>
#include <vector>
#include <fstream>
#include <pugixml.hpp>

class GMM {
    std::fstream stream;
    pugi::xml_document doc;
public:
    GMM(std::string &filename, std::ios::openmode openmode) : stream(filename, openmode) {}
    void FromFile(std::vector<std::string> &messages);
    void ToFile(std::vector<std::string> const &messages);
};


#endif //GUARD_GMM_H
