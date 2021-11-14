#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <string>
#include <regex>
#include <unordered_map>
#include <map>
#include <cassert>

#if (__cplusplus < 201703L)
#include <experimental/filesystem>
namespace fs = std::experimental::filesystem;
#else
#include <filesystem>
namespace fs = std::filesystem;
#endif

#endif //GUARD_GLOBAL_H
