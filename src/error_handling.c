#include "global.h"
#include "error_handling.h"
#include "error_message_reset.h"
#include "unk_02037C94.h"

void GF_AssertFail(void) {
    if (!sub_02037D78()) {
        return;
    }

    if (OS_GetProcMode() != OS_PROCMODE_IRQ) {
        PrintErrorMessageAndReset();
    }
}
