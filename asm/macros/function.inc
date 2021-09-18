#pragma once

	.macro arm_func_start name
	.balign 4, 0
	.global \name
	.type \name, @function
	.arm
	.endm

	.macro arm_func_end name
	.size \name, .-\name
	.endm

	.macro thumb_func_start name
	.balign 4, 0
	.global \name
	.type \name, @function
	.thumb
	.endm

	.macro non_word_aligned_thumb_func_start name
	.global \name
	.type \name, @function
	.thumb
	.endm

	.macro thumb_func_end name
	.size \name, .-\name
	.endm
