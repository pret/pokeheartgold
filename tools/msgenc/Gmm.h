#ifndef GUARD_GMM_H
#define GUARD_GMM_H


#include <string>
#include <vector>
#include <fstream>
#include "pugixml.hpp"
#include "MessagesConverter.h"

class GMM {
    char row_no_buf[6] = "00000";
    string filename;
    fstream stream;
    pugi::xml_document doc;
    vector<string> id_strings;
    void ReadGmmHeader(const string &_filename);
    void WriteGmmHeader(const string &_filename);
    void IncRowNoBuf() {
        for (int i = 4; i >= 0; i--) {
            row_no_buf[i]++;
            if (row_no_buf[i] > '9') {
                if (i == 0) {
                    throw runtime_error("message count overflow");
                }
                row_no_buf[i] = '0';
            } else {
                break;
            }
        }
    }
public:
    GMM(string &_filename, ios::openmode _openmode) : filename(_filename), stream(_filename, _openmode) {}
    void FromFile(MessagesConverter &converter);
    void ToFile(MessagesConverter &converter);
};


#endif //GUARD_GMM_H
