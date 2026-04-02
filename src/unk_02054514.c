#include "unk_02054514.h"

void sub_02054514(FieldSystem *fieldSystem, u8 a1) {
    if (fieldSystem->unk5C == NULL) {
        fieldSystem->unk5C = Heap_Alloc(HEAP_ID_FIELD2, 0x80E2);
        sub_0205455C(fieldSystem->mapMatrix, fieldSystem->unk5C, a1);
    }
}

void sub_0205453C(FieldSystem *fieldSystem) {
	if (fieldSystem->unk5C != NULL) {
		Heap_Free(fieldSystem->unk5C);
		fieldSystem->unk5C = NULL;
	}
}
