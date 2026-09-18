#ifndef GUARD_JSON_H
#define GUARD_JSON_H

// JSON-encoded structures are a port of the original GMM structure previously
// used by the project. A valid JSON file contains a numeric key, and all other
// keys should be interpreted in-order as the entries for a text bank. Each
// bank entry is sub-divided into locales to allow for future multi-language
// extensions.

#include <cstring>
#include <string>
#include <vector>

#include "dataproc.h"

#include "MessagesConverter.h"

#define JSON_KEY_NOT_DEFINED -1

class Json {
    static constexpr int _row_no_buf_ndigit = 5;

    char row_no_buf[_row_no_buf_ndigit + 1] = {0};
    string filename;
    datafile_t doc;
    vector<string> id_strings;
    vector<string> messages;

    void WriteHeader(const string &_filename);
    void ReadHeader(const string &_filename);
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
    Json(string &_filename, ios::openmode _openmode) : filename(_filename) {
        memset(row_no_buf, '0', _row_no_buf_ndigit);
        memset(&this->doc, 0, sizeof(this->doc));
        dp_init(DATAPROC_F_JSON);
    }

    int FromFile(MessagesConverter &converter);
    void ToFile(MessagesConverter &converter);

private:
    vector<string> SplitMessage(const string &message, bool preserve = false);
};

#endif // GUARD_JSON_H
