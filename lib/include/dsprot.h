#ifndef DSPROT_H
#define DSPROT_H

/*
 * dsprot.h
 *
 * Header file for the DS Protect library
 * Version 1.23
 */

#include <nitro/types.h> // For u32

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

/*
 * u32 DSProt_DetectFlashcart(void *callback)
 *
 * Detect if the current environment is a flashcart.
 *
 * @param callback:    Function to be called if the environment is determined to be a flashcart. May be NULL.
 *
 * @returns:    1 if the environment is determined to be a flashcart, 0 otherwise
 */
extern u32 DSProt_DetectFlashcart(void *callback);

/*
 * u32 DSProt_DetectNotFlashcart(void *callback)
 *
 * Detect if the current environment is NOT a flashcart.
 *
 * @param callback:    Function to be called if the environment is determined to NOT be a flashcart. May be NULL.
 *
 * @returns:    1 if the environment is determined to NOT be a flashcart, 0 otherwise
 */
extern u32 DSProt_DetectNotFlashcart(void *callback);

/*
 * u32 DSProt_DetectEmulator(void *callback)
 *
 * Detect if the current environment is an emulator.
 *
 * @param callback:    Function to be called if the environment is determined to be an emulator. May be NULL.
 *
 * @returns:    1 if the environment is determined to be an emulator, 0 otherwise
 */
extern u32 DSProt_DetectEmulator(void *callback);

/*
 * u32 DSProt_DetectNotEmulator(void *callback)
 *
 * Detect if the current environment is NOT an emulator.
 *
 * @param callback:    Function to be called if the environment is determined to NOT be an emulator. May be NULL.
 *
 * @returns:    1 if the environment is determined to NOT be an emulator, 0 otherwise
 */
extern u32 DSProt_DetectNotEmulator(void *callback);

/*
 * u32 DSProt_DetectDummy(void *callback)
 *
 * Dummy environment detection function that does not do anything. Will always fail.
 *
 * @param callback:    Dummy callback function which will never be called. May be NULL.
 *
 * @returns:    0
 */
extern u32 DSProt_DetectDummy(void *callback);

/*
 * u32 DSProt_DetectNotDummy(void *callback)
 *
 * Dummy environment detection function that does not do anything. Will always succeed.
 *
 * @param callback:    Dummy callback function which will always be called. May be NULL.
 *
 * @returns:    1
 */
extern u32 DSProt_DetectNotDummy(void *callback);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // DSPROT_H
