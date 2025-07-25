#ifndef POKEHEARTGOLD_PHONEBOOK_DAT_H
#define POKEHEARTGOLD_PHONEBOOK_DAT_H

#include "heap.h"

struct PhoneBookEntry;

struct PhoneBook *AllocAndReadPhoneBook(enum HeapID heapID);
void FreePhoneBook(struct PhoneBook *phoneBook);
u8 LoadPhoneBookEntryI(u16 idx, struct PhoneBookEntry *dest, enum HeapID heapID);
int GetPhoneMessageGmm(int idx);
BOOL sub_02095FF8(int x);

#endif // POKEHEARTGOLD_PHONEBOOK_DAT_H
