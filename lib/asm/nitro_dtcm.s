	.public OS_IrqDummy
	.public OSi_IrqDma0
	.public OSi_IrqDma1
	.public OSi_IrqDma2
	.public OSi_IrqDma3
	.public OSi_IrqTimer0
	.public OSi_IrqTimer1
	.public OSi_IrqTimer2
	.public OSi_IrqTimer3

	.section .dtcm,4

	.public OS_IRQTable
OS_IRQTable: ; 0x027E0000
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OSi_IrqTimer0
	.word OSi_IrqTimer1
	.word OSi_IrqTimer2
	.word OSi_IrqTimer3
	.word OS_IrqDummy
	.word OSi_IrqDma0
	.word OSi_IrqDma1
	.word OSi_IrqDma2
	.word OSi_IrqDma3
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy

	.bss

	.public OSi_IrqThreadQueue
OSi_IrqThreadQueue: ; 0x027E0060
	.space 0x20
