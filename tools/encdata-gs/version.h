#ifndef GUARD_VERSION_H
#define GUARD_VERSION_H

#define SX(x) #x
#define S(x) SX(x)

#define VERSION_MAJOR     0
#define VERSION_MINOR     1
#define VERSION_PATCH     0

#define VERSION_STRING S(VERSION_MAJOR) "." S(VERSION_MINOR) "." S(VERSION_PATCH)

#endif //GUARD_VERSION_H
