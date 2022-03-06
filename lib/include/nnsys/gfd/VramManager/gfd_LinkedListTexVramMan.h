#ifndef NNSYS_GFD_VRAMMANAGER_GFD_LINKEDLISTTEXVRAMMAN_H_
#define NNSYS_GFD_VRAMMANAGER_GFD_LINKEDLISTTEXVRAMMAN_H_

u32 NNS_GfdGetLnkTexVramManagerWorkSize( u32 numMemBlk );
void NNS_GfdInitLnkTexVramManager(u32 szByte, u32 szByteFor4x4, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);

#endif //NNSYS_GFD_VRAMMANAGER_GFD_LINKEDLISTTEXVRAMMAN_H_
