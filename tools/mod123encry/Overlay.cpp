#include "Overlay.h"
#include "NtrRom.h"

NtrOverlay::NtrOverlay(NtrRom *baserom, u32 ovy_id) {
    info = baserom->getOverlayInfo(0, ovy_id);
    data = baserom->getOverlayData(0, ovy_id);
}
