	.macro exception what, size, data
	.section .exceptix,4,1,2
	.balign 4, 0
	.type ?exc$\what, @object
	.global ?exc$\what
	.size ?exc$\what, 12
?exc$\what:
	.word \what
	.short \size
	.word \data
	.previous
	.endm
