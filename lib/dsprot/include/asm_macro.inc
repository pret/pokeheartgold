#pragma once
#include "encoding_constants.h"

	.macro arm_func_start name
	.balign 4, 0
	.global \name
	.type \name, @function
	.arm
	.endm

	.macro local_arm_func_start name
	.balign 4, 0
	.arm
	.endm

	.macro arm_func_end name
	.size \name, .-\name
	.endm


	.public Encryptor_DecryptFunction
	.public Encryptor_EncryptFunction
	.public BSS

	.macro run_encrypted_func func, length, key
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, func_\@
	adr r3, storage_\@
	str lr, [r3]
	ldr r2, length_\@
	ldr r0, key_\@
	bl Encryptor_DecryptFunction
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, func_\@
	ldr r2, length_\@
	ldr r0, key_\@
	bl Encryptor_EncryptFunction
	str r0, key_\@
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, storage_\@
	str pc, storage_\@
	bx lr
storage_\@:
	.word BSS + 1
length_\@:
	.word BSS + \length + ENC_VAL_1
key_\@:
	.word BSS + \key + ENC_VAL_1
func_\@:
	.word \func + ENC_VAL_1
	.endm


	.public Encryptor_DecodeFunctionTable

	.macro decode_func_table table
	stmdb sp!, {lr}
	adr r0, \table
	bl Encryptor_DecodeFunctionTable
	ldmia sp!, {pc}
	.endm

	.macro func_table_entry func, size
	.word \func + ENC_VAL_1, BSS + \size + ENC_VAL_1
	.endm

	.macro func_table_end
	.word 0, 0
	.endm

	.macro garbage_ref ref
	.word \ref + ENC_VAL_1
	.endm
