#include <stdexcept>
#include "Glob.h"

Glob::Glob(const char *pattern, int _glob_flags) : glob_flags(_glob_flags) {
    int result = glob(pattern, glob_flags, nullptr, &glob_result);
    if (result) {
        throw runtime_error(string("Glob(") + pattern + ") failed with error " + to_string(result));
    }
    assign(glob_result.gl_pathv, glob_result.gl_pathv + glob_result.gl_pathc);
}

Glob::Glob(const string& pattern, int _glob_flags) : Glob(pattern.c_str(), _glob_flags) {}

Glob::~Glob() {
    globfree(&glob_result);
}
