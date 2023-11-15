#ifndef POKEHEARTGOLD_CERTIFICATES_APP_H
#define POKEHEARTGOLD_CERTIFICATES_APP_H

#include "overlay_manager.h"

#define CERTIFICATE_JOHTO_DEX    0
#define CERTIFICATE_NATIONAL_DEX 1
#define CERTIFICATE_SHINY_LEAVES 2

BOOL CertificatesApp_Init(OVY_MANAGER *manager, int *state);
BOOL CertificatesApp_Run(OVY_MANAGER *manager, int *state);
BOOL CertificatesApp_Exit(OVY_MANAGER *manager, int *state);

#endif
