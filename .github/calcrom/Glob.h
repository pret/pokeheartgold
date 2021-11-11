#ifndef CALCROM_GLOB_H
#define CALCROM_GLOB_H

#include <vector>
#include <string>
#include <glob.h>

using namespace std;

class Glob : public vector<const char *> {
    glob_t glob_result;
    int glob_flags;
public:
    // Call glob with the supplied pattern
    Glob(const char * pattern, int _glob_flags);
    Glob(const string& pattern, int _glob_flags);
    ~Glob();
};

#endif //CALCROM_GLOB_H
