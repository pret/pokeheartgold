#ifndef NITRO_OS_EXCEPTION_H_
#define NITRO_OS_EXCEPTION_H_

typedef void (*OSExceptionHandler) (u32, void *);

void OS_InitException(void);

#endif //NITRO_OS_EXCEPTION_H_
