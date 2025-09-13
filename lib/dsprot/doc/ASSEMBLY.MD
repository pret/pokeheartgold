# Assembly functions

Decryption wrappers and decoding static initializers are both written at least partially in assembly. This can be proven. All other functions in the library may or may not be written partially or wholly in assembly, but they all may be decompiled to some C code which matches, and therefore can be assumed to have originally been written in C.

## Decryption wrappers

Decryption wrappers take the form:

```asm
	arm_func_start ov123_02260148
ov123_02260148:
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _022601BC
	adr r3, _022601B0
	str lr, [r3]
	ldr r2, _022601B4
	ldr r0, _022601B8
	bl ov123_0225FEA8  ; Function decryption routine
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip             ; Call decrypted function
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _022601BC
	ldr r2, _022601B4
	ldr r0, _022601B8
	bl ov123_0225FF30  ; Function re-encryption routine
	str r0, _022601B8
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _022601B0
	str pc, _022601B0
	bx lr
_022601B0: .word BSS + 1         ; Storage space for LR
_022601B4: .word 0xAC            ; Function size
_022601B8: .word 0x982           ; Key
_022601BC: .word ov123_0225FFE8  ; Function to decrypt-run-encrypt
	arm_func_end ov123_02260148
```

(Data obfuscation as described in [ENCODING.MD](./ENCODING.MD) has been removed for clarity)

All decryption wrappers are identical, save for different values at the foot: the address of the function, the number of bytes to decrypt/re-encrypt, and the key to use.

There are three giveaways that this is originally assembly:
- This is a seamless universal wrapper function. The registers `r0` through `r3` and the stack pointer are all preserved going into the inner function call, meaning this wrapper will wrap any inner function regardless of its arguments. This is impossible in C: functions that accept some fixed format of arguments will need specific wrappers sharing those arguments (or specific handling of the argument size and order), and functions which accept variable arguments such as `printf(char*, ...)` cannot be wrapped at all, and must have a varargs version of the function instead (`vprintf(char*, va_list)`).
- This function accesses both `lr` and `pc` to store into memory locations (for some reason). This is impossible in vanilla C. Some compilers support `__builtin_return_address()`, `__current_pc()`, or other similar intrinsics to do this, but mwccarm does not.
- The `lr`, `pc`, and new key, as returned by the re-encryption routine, are all written into the pool of instructional memory of the function. C would never do this; it would create a region in `.data` for persistent storage instead.

## Decoding initializers

Decoding initializers take the form:

```asm
	arm_func_start ov123_0226077C
ov123_0226077C:
	stmdb sp!, {lr}
	adr r0, _0226078C  ; Function table pointer
	bl ov123_0225FD98  ; Function decoding routine
	ldmia sp!, {pc}
_0226078C:
	.word ov123_0226068C, 0x68  ; (Function address, size) data pairs
	.word ov123_02260704, 0x68
	.word ov123_02260148, 0x68
	.word ov123_022601C0, 0x68
	.word ov123_02260414, 0x68
	.word ov123_0226048C, 0x68
	.word 0, 0                  ; End-of-data (0, 0)
	arm_func_end ov123_0226077C
```

(Data obfuscation as described in [ENCODING.MD](./ENCODING.MD) has been removed for clarity)

This has a similar assembly giveaway as the decryption wrapper. The function table data structure is stored in the pool of instructional memory, and a pointer to this region is passed into the decoding routine. C would never, ever do this: it would store the data in the instructional memory, then load the data into registers and push it onto the stack, and then finally pass a stack pointer through to the decoding routine. Alternatively, it could store the function table in a `.data` or `.rodata` region and pass a pointer to that.
