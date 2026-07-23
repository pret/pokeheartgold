/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:25 $
 * $Revision: 1.54.2.2 $
 */

#ifndef _MSL_C_VERSION_H
#define _MSL_C_VERSION_H

/*
 * The __MSL__ identifier is a hex value tracking, more or less,
 * a decimal identity - that is, for builds 10 - 16, we will use a
 * decimal appearing number.
 *
 * The __MSL__ identifier is broken up into three parts:  the major
 * version number, a zero (for backwards compatibility with older
 * version of the __MSL__ identifier), and the minor version number.
 *
 * The major version number takes the first five positions, the
 * zero is in the sixth position, and the minor version number is in
 * the final two positions; therefore: 0x000008001 means the major
 * MSL version is 8, and the minor version is 1.  This translates to
 * mean that MSL is the 8.1 version.
 *
 * The identifier is monotonically increasing for each build.
 */

/* MSL 11.0 */
#define __MSL__ 0x00011000

/*
 * The __MSL_BUILD__ identifier is an internal build number for
 * CodeWarrior.  It is used only during the development process of
 * MSL.  For a customer release, it will always be undefined.  For
 * internal use, it always starts at one and increases until MSL
 * is released to customers; at which time it then resets to one again.
 */

#define __MSL_BUILD__ 06

#endif /* _MSL_C_VERSION_H */

/* Change record:
 * JWW 010912 Created new file for tracking the MSL version number
 */