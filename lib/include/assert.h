#ifndef _MSL_ASSERT_H_
#define _MSL_ASSERT_H_

#define assert(expr)                ((expr) ? (void)0 : __msl_assertion_failed(#expr, __FILE__, __func__, __LINE__))

// For matching
#define assert_ex(expr, file, line) ((expr) ? (void)0 : __msl_assertion_failed(#expr, file, __func__, line))

// Assertion (%s) failed in "%s", function "%s", line %d
extern void __msl_assertion_failed(
    const char *expr,
    const char *file,
    const char *func,
    int line
);

#endif //_MSL_ASSERT_H_
