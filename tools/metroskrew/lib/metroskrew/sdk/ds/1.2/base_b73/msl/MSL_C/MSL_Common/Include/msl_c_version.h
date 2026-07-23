/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/04/07 16:08:18 $
 * $Revision: 1.45.2.7 $
 */

#ifndef _MSL_C_VERSION_H
#define _MSL_C_VERSION_H

/*
 * The __MSL__ identifier is a hex value tracking a more or less
 * decimal identity - that is, for builds 10 - 16, we will use a
 * decimal appearing number.
 *
 * The __MSL__ identifier is broken up into three parts:  the major
 * Pro version number, a zero (for backwards compatibility with older
 * version of the __MSL__ identifier), and the minor Pro version number.  
 *
 * The major Pro version number takes the first five positions, the
 * zero is in the sixth position, and the minor version number is in
 * the final two positions; therefore: 0x000008001 means the major Pro
 * release name is Pro 8, and the minor version is 1.
 *
 * The identifier is monotonically increasing for each build.
 */

#define __MSL__ 0x00009005

/*
 * The __MSL_BUILD__ identifier is an internal build number for
 * Metrowerks.  It is used only during the development process of
 * MSL.  For a customer release, it will always be undefined.  For
 * internal use, it always starts at one and increases until MSL
 * is released to customers; at which time it then resets to one again.
 */

#define __MSL_BUILD__ 05

#endif /* _MSL_C_VERSION_H */

/* Change record:
 * JWW 010912 Created new file for tracking the MSL version number
 */