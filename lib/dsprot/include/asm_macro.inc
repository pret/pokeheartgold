#pragma once
#include "encoding_constants.h"

	.macro arm_func_start name
	.balign  4, 0
	.global  \name
	.type    \name, @function
	.arm
	.endm

	.macro local_arm_func_start name
	.balign  4, 0
	.type    \name, @function
	.arm
	.endm

	.macro arm_func_end name
	.size  \name, .-\name
	.endm


	.macro sinit sinit_func
	.type  NitroStaticInit_, @object
NitroStaticInit_:
	.word  \sinit_func
	.size  NitroStaticInit_, .-NitroStaticInit_
	.endm


	.public DSProt_BSS
	.public Encryptor_DecryptFunction
	.public Encryptor_EncryptFunction

	.macro run_encrypted_func func, length, key
	stmfd  sp!, {r4-r7}               ; `r0`-`r3` contain the arguments that must be passed into the inner function.
	stmfd  sp!, {r0-r3}               ; Stack manipulation to move `r0`-`r3` into `r4`-`r7` for storage.
	ldmfd  sp!, {r4-r7}               ; Original values of `r4`-`r7` get pushed onto the stack.
	ldr    r1, func_\@                ; Get second function decrypter argument, obfuscated function address.
	adr    r3, storage_\@             ; `lr` cannot be stored on the stack when we call the inner function,
	str    lr, [r3]                   ; so it is stored in the pool below.
	ldr    r2, length_\@              ; Get third function decrypter argument, obfuscated length.
	ldr    r0, key_\@                 ; Get first function decrypter argument, obfuscated key.
	bl     Encryptor_DecryptFunction  ; Call function decrypter with args (key, addr, len).
	mov    ip, r0                     ; Function decrypter returns the de-obfuscated function address. Save it in `ip`.
	stmfd  sp!, {r4-r7}               ; Stack manipulation again to restore the original `r0`-`r3`.
	ldmfd  sp!, {r0-r3}               ; 
	ldmfd  sp!, {r4-r7}               ; Stack is now restored, so `sp` is correct for the inner function call.
	blx    ip                         ; Call inner function.
	stmfd  sp!, {r4}                  ; `r4` about to be used as storage space for the inner function return, so save it on the stack.
	mov    r4, r0                     ; Copy the return from the inner function into `r4` so we can can run the function re-encrypter.
	ldr    r1, func_\@                ; Get second function encrypter argument, obfuscated function address.
	ldr    r2, length_\@              ; Get third function encrypter argument, obfuscated length.
	ldr    r0, key_\@                 ; Get first function encrypter argument, obfuscated key.
	bl     Encryptor_EncryptFunction  ; Call function encrypter.
	str    r0, key_\@                 ; Function encrypter returns the new key it used, store this back into the pool for next time.
	mov    r0, r4                     ; Restore the return value from the inner function from `r4` to `r0`.
	ldmfd  sp!, {r4}                  ; Restore the original value of `r4` from the stack.
	ldr    lr, storage_\@             ; Load `lr` return address back from the storage space in the pool.
	str    pc, storage_\@             ; Store `pc` in its place, presumably just to overwrite the return address.
	bx     lr                         ; Return with return value from inner function.
storage_\@:
	.word  DSProt_BSS + 1
length_\@:
	.word  DSProt_BSS + \length + ENC_VAL_1
key_\@:
	.word  DSProt_BSS + \key + ENC_VAL_1
func_\@:
	.word  \func + ENC_VAL_1
	.endm


	.public Encryptor_DecodeFunctionTable

	.macro decode_func_table table
	stmdb  sp!, {lr}
	adr    r0, \table
	bl     Encryptor_DecodeFunctionTable
	ldmia  sp!, {pc}
	.endm

	.macro func_table_entry func, size
	.word  \func + ENC_VAL_1, DSProt_BSS + \size + ENC_VAL_1
	.endm

	.macro func_table_end
	.word  0, 0
	.endm

	.macro garbage_ref ref
	.word  \ref + ENC_VAL_1
	.endm
