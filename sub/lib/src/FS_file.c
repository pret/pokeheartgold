#include <nitro.h>

static BOOL is_init = FALSE;

void FS_Init(u32 default_dma_no) {
#ifdef FS_IMPLEMENT
    if (!is_init) {
        is_init = TRUE;
        FSi_InitRom(default_dma_no);
    }
#else
    CARD_Init();
#endif //FS_IMPLEMENT
}
