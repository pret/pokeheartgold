#ifndef NITRO_OS_CACHE_H_
#define NITRO_OS_CACHE_H_

void DC_FlushAll(void);
void DC_InvalidateRange(register void * startAddr, register u32 nBytes);
void DC_StoreRange(register void * startAddr, register u32 nBytes);
void DC_InvalidateAll(void);
void DC_StoreAll(void);
void IC_InvalidateAll(void);
void IC_InvalidateRange(register void *startAddr, register u32 nBytes);
void DC_WaitWriteBufferEmpty(void);
void DC_FlushRange(const void *data, u32 size);

#endif //NITRO_OS_CACHE_H_
