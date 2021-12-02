#ifndef GUARD_FIND_FILESYSTEM_H
#define GUARD_FIND_FILESYSTEM_H

#if __cplusplus >= 201703L
#include <filesystem>
namespace fs = std::filesystem;
#else
#include <experimental/filesystem>
namespace fs = std::experimental::filesystem;
#endif //__cplusplus

#endif //GUARD_FIND_FILESYSTEM_H
