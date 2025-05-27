#ifndef POKEHEARTGOLD_CERTIFICATES_APP_H
#define POKEHEARTGOLD_CERTIFICATES_APP_H

#include "overlay_manager.h"
#include "save.h"

#define CERTIFICATE_JOHTO_DEX    0
#define CERTIFICATE_NATIONAL_DEX 1
#define CERTIFICATE_SHINY_LEAVES 2

typedef enum CertificatesExecStates {
    CERTIFICATES_EXECSTATE_SETUP,
    CERTIFICATES_EXECSTATE_FADE_IN,
    CERTIFICATES_EXECSTATE_WAIT_ONE_SECOND,
    CERTIFICATES_EXECSTATE_MOVE_TO_BOTTOM_SCREEN,
    CERTIFICATES_EXECSTATE_WAIT_FOR_INPUT,
    CERTIFICATES_EXECSTATE_FADE_OUT,

    CERTIFICATES_EXECSTATE_COUNT,
} CertificatesExecStates;

typedef struct CertificatesArgs {
    SaveData *saveData;
    u32 certificateId;
} CertificatesArgs;

BOOL Certificates_Init(OverlayManager *manager, int *state);
BOOL Certificates_Main(OverlayManager *manager, int *state);
BOOL Certificates_Exit(OverlayManager *manager, int *state);

#endif
