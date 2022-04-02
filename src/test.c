#include "heap.h"
#include "overlay_01.h"
#include "system.h"

typedef struct {
    u32 unk0;
    u32 unk4;
    u32 unk8;
} Unk021FB530;

static void ov01_021FB594(void *);

// // DO NOT SUBMIT until finding the struct used here!!
// void *ov01_021FB4C0(HeapID heap_id) {
//     void *ptr = (void *)AllocFromHeap(heap_id, 0x1c);
//     ov01_021FB55C(ptr);
//     return ptr;
// }

// void ov01_021FB4D4(u32 *a0) {
//     if (a0 == NULL) return;

//     if (*a0 == 1) {
//         ov01_021FB514(a0);
//     }
//     ov01_021FB55C(a0);
//     FreeToHeap(a0);
// }

// void ov01_021FB4F4(u32 *arg) {
//     if (Main_SetHBlankIntrCB(&ov01_021FB594, arg) != TRUE) {
//         GF_ASSERT(FALSE);
//     }
//     *arg = 1;
// }

// void ov01_021FB514(u32 *a0) {
//     if (Main_SetHBlankIntrCB(NULL, 0) != TRUE) {
//         GF_ASSERT(FALSE);
//     }
//     *a0 = 0;
// }

// Unk021FB530 *ov01_021FB530(u32 a0, u32 a1, u32 a2) {
//     Unk021FB530 *ptr = (Unk021FB530 *)ov01_021FB5B4(a0, a1, a2);
//     if (ptr == NULL) {
//         GF_ASSERT(FALSE);
//     }
//     if (ptr != NULL) {
//         ptr->unk4 = a2;
//         ptr->unk8 = a1;
//         ptr->unk0 = 1;
//     }
//     return ptr;
// }

// void ov01_021FB554(void) {
//     ov01_021FB584();
// }
