#ifndef GUARD_GMM_H
#define GUARD_GMM_H


// The GMM format is a slimmed-down variant of GameFreak's GMM file.
// It is essentially an XML file by another name.
// Within the body, each row encodes the text of a message as well
// as additional details about how the message is printed.
// Most of these details are ignored.
// Some strings in the EN-US release of Pokemon titles are blank
// (composed entirely of spaces). The number of spaces varies by the
// length of the corresponding Japanese message. Such strings are
// labeled with the window context "garbage".

#include <string>
#include <vector>
#include <fstream>
#include <cstring>
#include "pugixml.hpp"
#include "MessagesConverter.h"

class GMM {
    static const int _row_no_buf_ndigit = 5;
    char row_no_buf[_row_no_buf_ndigit + 1] = {0};
    string filename;
    fstream stream;
    pugi::xml_document doc;
    vector<string> id_strings;
    vector<string> messages;
    void ReadGmmHeader(const string &_filename);
    void WriteGmmHeader(const string &_filename);
    void IncRowNoBuf() {
        for (int i = _row_no_buf_ndigit - 1; i >= 0; i--) {
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
    GMM(string &_filename, ios::openmode _openmode) : filename(_filename), stream(_filename, _openmode) {
        memset(row_no_buf, '0', _row_no_buf_ndigit);
    }
    void FromFile(MessagesConverter &converter);
    void ToFile(MessagesConverter &converter);

private:
    vector<string> SplitMessage(const string &message);
};


#endif //GUARD_GMM_H
