	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

sScriptBankMapping:
	.short 0x28FA, 0x0107, 0x01B1
	.short 0x28D2, 0x0108, 0x0013
	.short 0x28C8, 0x0002, 0x02EC
	.short 0x28A0, 0x0097, 0x00F6
	.short 0x286E, 0x03B8, 0x02D6
	.short 0x283C, 0x02DE, 0x01BC
	.short 0x27D8, 0x0090, 0x00D1
	.short 0x27A6, 0x03BB, 0x02DC
	.short 0x2774, 0x03BA, 0x02DD
	.short 0x2710, 0x0092, 0x00D3
	.short 0x26DE, 0x0094, 0x029A
	.short 0x26AC, 0x0088, 0x0028
	.short 0x267A, 0x00A7, 0x0138
	.short 0x2648, 0x00A6, 0x002B
	.short 0x25E4, 0x00A3, 0x010A
	.short 0x2580, 0x0095, 0x0028
	.short 0x251C, 0x0109, 0x01B7
	.short 0x2454, 0x008F, 0x00CC
	.short 0x23F0, 0x00A4, 0x010B
	.short 0x238C, 0x0000, 0x000E
	.short 0x2328, 0x0004, 0x002E
	.short 0x22C4, 0x00A5, 0x010C
	.short 0x2260, 0x0106, 0x01AB
	.short 0x1F40, 0x0091, 0x00D2
	.short 0x1B58, 0x008D, 0x00C7
	.short 0x1388, 0x03B9, 0x0028
	.short 0x0BB8, 0x03B9, 0x0028
	.short 0x0AF0, 0x0096, 0x0017
	.short 0x09C4, 0x0001, 0x0014
	.short 0x07D0, 0x0003, 0x0028
_020FA558:
	.byte 0x11, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE1, 0x00
	.byte 0x11, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x11, 0x00, 0x28, 0x00, 0x01, 0x00, 0x00, 0x00, 0x12, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6C, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x92, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0x93, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x95, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x96, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x97, 0x00
	.byte 0x16, 0x00, 0x01, 0x00, 0x00, 0x00, 0x98, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9A, 0x00
	.byte 0x3B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x99, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9B, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x31, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9D, 0x00
	.byte 0x5D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x61, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1C, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1E, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00
	.byte 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD3, 0x00
	.byte 0x4F, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD4, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD5, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD6, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD7, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x16, 0x00, 0x01, 0x00, 0x00, 0x00, 0x34, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x35, 0x00, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x43, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x44, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x45, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x15, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0B, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x22, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x23, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x2E, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA0, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x84, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x85, 0x00
	.byte 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x13, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x00
	.byte 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x41, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7E, 0x00
	.byte 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x80, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x81, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3E, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00
	.byte 0x2D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x16, 0x00, 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x62, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x87, 0x00, 0x39, 0x00, 0x01, 0x00, 0x00, 0x00, 0x88, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x17, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x89, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x42, 0x00, 0x2E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x56, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA1, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x18, 0x00, 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x63, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAB, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAD, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x49, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4A, 0x00
	.byte 0x4C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC0, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4B, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x19, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1A, 0x00
	.byte 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD1, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x27, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x28, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE2, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x82, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x83, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2A, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2C, 0x00
	.byte 0x4D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2E, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8D, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x00
	.byte 0x2D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8F, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x31, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x32, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x33, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x36, 0x00, 0x3E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x37, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x24, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x25, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x66, 0x00, 0x28, 0x00, 0x01, 0x00, 0x00, 0x00, 0x64, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x46, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x48, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE4, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x47, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x51, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x52, 0x00
	.byte 0x29, 0x00, 0x01, 0x00, 0x00, 0x00, 0x53, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x65, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB6, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB8, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x50, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBA, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBB, 0x00
	.byte 0x34, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBC, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBE, 0x00
	.byte 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x54, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x67, 0x00
	.byte 0x5D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA2, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA4, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x38, 0x00, 0x31, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE0, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x39, 0x00, 0x3D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3A, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x68, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3B, 0x00
	.byte 0x3A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3D, 0x00
	.byte 0x2D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC5, 0x00
	.byte 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x69, 0x00, 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6A, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7A, 0x00
	.byte 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x29, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6E, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x86, 0x00, 0x31, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6F, 0x00
	.byte 0x28, 0x00, 0x01, 0x00, 0x00, 0x00, 0x70, 0x00, 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x55, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x57, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD8, 0x00
	.byte 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDA, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDC, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x37, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC7, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE3, 0x00, 0x5B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x91, 0x00
	.byte 0x5B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC3, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC4, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x71, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC2, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAE, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAF, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x72, 0x00
	.byte 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x5B, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA7, 0x00
	.byte 0x4E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x58, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x59, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5B, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD2, 0x00
	.byte 0x34, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDF, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB4, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB2, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB3, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCF, 0x00, 0x29, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD0, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x73, 0x00, 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x74, 0x00
	.byte 0x38, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4D, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC9, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA5, 0x00
	.byte 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCD, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCA, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCB, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDE, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5D, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5F, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x75, 0x00
	.byte 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0x76, 0x00, 0x34, 0x00, 0x01, 0x00, 0x00, 0x00, 0x77, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x78, 0x00, 0x2E, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDD, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x79, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7B, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7C, 0x00, 0xE2, 0x00, 0x01, 0x00, 0x00, 0x00, 0x26, 0x00
	.byte 0xE3, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE5, 0x00, 0x35, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE6, 0x00
sNumScriptCmds:
	.word 0x00000355
	.public _020FAC94
_020FAC94:
	.byte 0x03, 0x19, 0x0D, 0x06, 0x04, 0x0D, 0x1F, 0x02
	.public _020FAC9C
_020FAC9C:
	.byte 0x01, 0x00, 0x00
	.byte 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01
	.byte 0x01, 0x01, 0x00
	.byte 0x00, 0x01, 0x01
	.byte 0x01, 0x00, 0x01
	.public _020FACB0
	.balign 4, 0
_020FACB0:
	.word SDK_OVERLAY_OVY_20_ID
	.word SDK_OVERLAY_OVY_24_ID
	.word SDK_OVERLAY_OVY_21_ID
	.word SDK_OVERLAY_OVY_22_ID
	.word SDK_OVERLAY_OVY_25_ID
	.public _020FACC4
_020FACC4:
	.byte 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07
	.byte 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07
	.public _020FACDC
_020FACDC:
	.byte 0x00, 0x30, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x00, 0x00, 0xD0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x04, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00
gScriptCmdTable:
	.word ScrCmd_Nop                                    ; 000
	.word ScrCmd_Dummy                                  ; 001
	.word ScrCmd_End                                    ; 002
	.word ScrCmd_Wait                                   ; 003
	.word ScrCmd_LoadByte                               ; 004
	.word ScrCmd_LoadWord                               ; 005
	.word ScrCmd_LoadByteFromAddr                       ; 006
	.word ScrCmd_WriteByteToAddr                        ; 007
	.word ScrCmd_SetPtrByte                             ; 008
	.word ScrCmd_CopyLocal                              ; 009
	.word ScrCmd_CopyByte                               ; 010
	.word ScrCmd_CompareLocalToLocal                    ; 011
	.word ScrCmd_CompareLocalToValue                    ; 012
	.word ScrCmd_CompareLocalToAddr                     ; 013
	.word ScrCmd_CompareAddrToLocal                     ; 014
	.word ScrCmd_CompareAddrToValue                     ; 015
	.word ScrCmd_CompareAddrToAddr                      ; 016
	.word ScrCmd_CompareVarToValue                      ; 017
	.word ScrCmd_CompareVarToVar                        ; 018
	.word ScrCmd_RunScript                              ; 019
	.word ScrCmd_RunScriptWait                          ; 020
	.word ScrCmd_RestartCurrentScript                   ; 021
	.word ScrCmd_GoTo                                   ; 022
	.word ScrCmd_ObjectGoTo                             ; 023
	.word ScrCmd_BgGoTo                                 ; 024
	.word ScrCmd_DirectionGoTo                          ; 025
	.word ScrCmd_Call                                   ; 026
	.word ScrCmd_Return                                 ; 027
	.word ScrCmd_GoToIf                                 ; 028
	.word ScrCmd_CallIf                                 ; 029
	.word ScrCmd_SetFlag                                ; 030
	.word ScrCmd_ClearFlag                              ; 031
	.word ScrCmd_CheckFlag                              ; 032
	.word ScrCmd_SetFlagVar                             ; 033
	.word ScrCmd_ClearFlagVar                           ; 034
	.word ScrCmd_CheckFlagVar                           ; 035
	.word ScrCmd_SetTrainerFlag                         ; 036
	.word ScrCmd_ClearTrainerFlag                       ; 037
	.word ScrCmd_CheckTrainerFlag                       ; 038
	.word ScrCmd_AddVar                                 ; 039
	.word ScrCmd_SubVar                                 ; 040
	.word ScrCmd_SetVar                                 ; 041
	.word ScrCmd_CopyVar                                ; 042
	.word ScrCmd_SetOrCopyVar                           ; 043
	.word ScrCmd_Message                                    ; 044
	.word ScrCmd_045                                    ; 045
	.word ScrCmd_046                                    ; 046
	.word ScrCmd_047                                    ; 047
	.word ScrCmd_048                                    ; 048
	.word ScrCmd_049                                    ; 049
	.word ScrCmd_050                                    ; 050
	.word ScrCmd_051                                    ; 051
	.word ScrCmd_052                                    ; 052
	.word ScrCmd_053                                    ; 053
	.word ScrCmd_054                                    ; 054
	.word ScrCmd_055                                    ; 055
	.word ScrCmd_056                                    ; 056
	.word ScrCmd_057                                    ; 057
	.word ScrCmd_058                                    ; 058
	.word ScrCmd_059                                    ; 059
	.word ScrCmd_060                                    ; 060
	.word ScrCmd_061                                    ; 061
	.word ScrCmd_062                                    ; 062
	.word ScrCmd_063                                    ; 063
	.word ScrCmd_064                                    ; 064
	.word ScrCmd_065                                    ; 065
	.word ScrCmd_066                                    ; 066
	.word ScrCmd_067                                    ; 067
	.word ScrCmd_068                                    ; 068
	.word ScrCmd_069                                    ; 069
	.word ScrCmd_070                                    ; 070
	.word ScrCmd_071                                    ; 071
	.word ScrCmd_072                                    ; 072
	.word ScrCmd_073                                    ; 073
	.word ScrCmd_074                                    ; 074
	.word ScrCmd_075                                    ; 075
	.word ScrCmd_076                                    ; 076
	.word ScrCmd_077                                    ; 077
	.word ScrCmd_078                                    ; 078
	.word ScrCmd_079                                    ; 079
	.word ScrCmd_080                                    ; 080
	.word ScrCmd_081                                    ; 081
	.word ScrCmd_082                                    ; 082
	.word ScrCmd_083                                    ; 083
	.word ScrCmd_084                                    ; 084
	.word ScrCmd_085                                    ; 085
	.word ScrCmd_086                                    ; 086
	.word ScrCmd_087                                    ; 087
	.word ScrCmd_088                                    ; 088
	.word ScrCmd_089                                    ; 089
	.word ScrCmd_090                                    ; 090
	.word ScrCmd_091                                    ; 091
	.word ScrCmd_092                                    ; 092
	.word ScrCmd_093                                    ; 093
	.word ScrCmd_094                                    ; 094
	.word ScrCmd_095                                    ; 095
	.word ScrCmd_096                                    ; 096
	.word ScrCmd_097                                    ; 097
	.word ScrCmd_098                                    ; 098
	.word ScrCmd_099                                    ; 099
	.word ScrCmd_100                                    ; 100
	.word ScrCmd_101                                    ; 101
	.word ScrCmd_102                                    ; 102
	.word ScrCmd_103                                    ; 103
	.word ScrCmd_104                                    ; 104
	.word ScrCmd_105                                    ; 105
	.word ScrCmd_106                                    ; 106
	.word ScrCmd_107                                    ; 107
	.word ScrCmd_108                                    ; 108
	.word ScrCmd_109                                    ; 109
	.word ScrCmd_110                                    ; 110
	.word ScrCmd_111                                    ; 111
	.word ScrCmd_112                                    ; 112
	.word ScrCmd_113                                    ; 113
	.word ScrCmd_114                                    ; 114
	.word ScrCmd_115                                    ; 115
	.word ScrCmd_116                                    ; 116
	.word ScrCmd_117                                    ; 117
	.word ScrCmd_118                                    ; 118
	.word ScrCmd_119                                    ; 119
	.word ScrCmd_120                                    ; 120
	.word ScrCmd_121                                    ; 121
	.word ScrCmd_122                                    ; 122
	.word ScrCmd_123                                    ; 123
	.word ScrCmd_124                                    ; 124
	.word ScrCmd_125                                    ; 125
	.word ScrCmd_126                                    ; 126
	.word ScrCmd_127                                    ; 127
	.word ScrCmd_128                                    ; 128
	.word ScrCmd_129                                    ; 129
	.word ScrCmd_130                                    ; 130
	.word ScrCmd_131                                    ; 131
	.word ScrCmd_132                                    ; 132
	.word ScrCmd_133                                    ; 133
	.word ScrCmd_134                                    ; 134
	.word ScrCmd_135                                    ; 135
	.word ScrCmd_136                                    ; 136
	.word ScrCmd_137                                    ; 137
	.word ScrCmd_138                                    ; 138
	.word ScrCmd_139                                    ; 139
	.word ScrCmd_140                                    ; 140
	.word ScrCmd_141                                    ; 141
	.word ScrCmd_142                                    ; 142
	.word ScrCmd_143                                    ; 143
	.word ScrCmd_144                                    ; 144
	.word ScrCmd_145                                    ; 145
	.word ScrCmd_146                                    ; 146
	.word ScrCmd_147                                    ; 147
	.word ScrCmd_148                                    ; 148
	.word ScrCmd_149                                    ; 149
	.word ScrCmd_150                                    ; 150
	.word ScrCmd_151                                    ; 151
	.word ScrCmd_152                                    ; 152
	.word ScrCmd_153                                    ; 153
	.word ScrCmd_154                                    ; 154
	.word ScrCmd_155                                    ; 155
	.word ScrCmd_156                                    ; 156
	.word ScrCmd_157                                    ; 157
	.word ScrCmd_158                                    ; 158
	.word ScrCmd_159                                    ; 159
	.word ScrCmd_160                                    ; 160
	.word ScrCmd_161                                    ; 161
	.word ScrCmd_162                                    ; 162
	.word ScrCmd_163                                    ; 163
	.word ScrCmd_164                                    ; 164
	.word ScrCmd_165                                    ; 165
	.word ScrCmd_166                                    ; 166
	.word ScrCmd_167                                    ; 167
	.word ScrCmd_168                                    ; 168
	.word ScrCmd_169                                    ; 169
	.word ScrCmd_170                                    ; 170
	.word ScrCmd_171                                    ; 171
	.word ScrCmd_172                                    ; 172
	.word ScrCmd_173                                    ; 173
	.word ScrCmd_174                                    ; 174
	.word ScrCmd_175                                    ; 175
	.word ScrCmd_176                                    ; 176
	.word ScrCmd_177                                    ; 177
	.word ScrCmd_178                                    ; 178
	.word ScrCmd_179                                    ; 179
	.word ScrCmd_180                                    ; 180
	.word ScrCmd_181                                    ; 181
	.word ScrCmd_182                                    ; 182
	.word ScrCmd_183                                    ; 183
	.word ScrCmd_184                                    ; 184
	.word ScrCmd_185                                    ; 185
	.word ScrCmd_186                                    ; 186
	.word ScrCmd_187                                    ; 187
	.word ScrCmd_188                                    ; 188
	.word ScrCmd_189                                    ; 189
	.word ScrCmd_190                                    ; 190
	.word ScrCmd_191                                    ; 191
	.word ScrCmd_192                                    ; 192
	.word ScrCmd_193                                    ; 193
	.word ScrCmd_194                                    ; 194
	.word ScrCmd_195                                    ; 195
	.word ScrCmd_196                                    ; 196
	.word ScrCmd_197                                    ; 197
	.word ScrCmd_198                                    ; 198
	.word ScrCmd_199                                    ; 199
	.word ScrCmd_200                                    ; 200
	.word ScrCmd_201                                    ; 201
	.word ScrCmd_202                                    ; 202
	.word ScrCmd_203                                    ; 203
	.word ScrCmd_204                                    ; 204
	.word ScrCmd_205                                    ; 205
	.word ScrCmd_206                                    ; 206
	.word ScrCmd_207                                    ; 207
	.word ScrCmd_208                                    ; 208
	.word ScrCmd_209                                    ; 209
	.word ScrCmd_210                                    ; 210
	.word ScrCmd_211                                    ; 211
	.word ScrCmd_212                                    ; 212
	.word ScrCmd_213                                    ; 213
	.word ScrCmd_214                                    ; 214
	.word ScrCmd_215                                    ; 215
	.word ScrCmd_216                                    ; 216
	.word ScrCmd_217                                    ; 217
	.word ScrCmd_218                                    ; 218
	.word ScrCmd_219                                    ; 219
	.word ScrCmd_220                                    ; 220
	.word ScrCmd_221                                    ; 221
	.word ScrCmd_222                                    ; 222
	.word ScrCmd_223                                    ; 223
	.word ScrCmd_224                                    ; 224
	.word ScrCmd_225                                    ; 225
	.word ScrCmd_226                                    ; 226
	.word ScrCmd_227                                    ; 227
	.word ScrCmd_228                                    ; 228
	.word ScrCmd_229                                    ; 229
	.word ScrCmd_230                                    ; 230
	.word ScrCmd_231                                    ; 231
	.word ScrCmd_232                                    ; 232
	.word ScrCmd_233                                    ; 233
	.word ScrCmd_234                                    ; 234
	.word ScrCmd_235                                    ; 235
	.word ScrCmd_236                                    ; 236
	.word ScrCmd_237                                    ; 237
	.word ScrCmd_238                                    ; 238
	.word ScrCmd_239                                    ; 239
	.word ScrCmd_240                                    ; 240
	.word ScrCmd_241                                    ; 241
	.word ScrCmd_242                                    ; 242
	.word ScrCmd_243                                    ; 243
	.word ScrCmd_244                                    ; 244
	.word ScrCmd_245                                    ; 245
	.word ScrCmd_246                                    ; 246
	.word ScrCmd_247                                    ; 247
	.word ScrCmd_248                                    ; 248
	.word ScrCmd_249                                    ; 249
	.word ScrCmd_250                                    ; 250
	.word ScrCmd_251                                    ; 251
	.word ScrCmd_252                                    ; 252
	.word ScrCmd_253                                    ; 253
	.word ScrCmd_254                                    ; 254
	.word ScrCmd_255                                    ; 255
	.word ScrCmd_256                                    ; 256
	.word ScrCmd_257                                    ; 257
	.word ScrCmd_258                                    ; 258
	.word ScrCmd_259                                    ; 259
	.word ScrCmd_260                                    ; 260
	.word ScrCmd_261                                    ; 261
	.word ScrCmd_262                                    ; 262
	.word ScrCmd_263                                    ; 263
	.word ScrCmd_264                                    ; 264
	.word ScrCmd_265                                    ; 265
	.word ScrCmd_266                                    ; 266
	.word ScrCmd_267                                    ; 267
	.word ScrCmd_268                                    ; 268
	.word ScrCmd_269                                    ; 269
	.word ScrCmd_270                                    ; 270
	.word ScrCmd_271                                    ; 271
	.word ScrCmd_272                                    ; 272
	.word ScrCmd_273                                    ; 273
	.word ScrCmd_274                                    ; 274
	.word ScrCmd_275                                    ; 275
	.word ScrCmd_276                                    ; 276
	.word ScrCmd_277                                    ; 277
	.word ScrCmd_278                                    ; 278
	.word ScrCmd_279                                    ; 279
	.word ScrCmd_280                                    ; 280
	.word ScrCmd_281                                    ; 281
	.word ScrCmd_282                                    ; 282
	.word ScrCmd_283                                    ; 283
	.word ScrCmd_284                                    ; 284
	.word ScrCmd_285                                    ; 285
	.word ScrCmd_286                                    ; 286
	.word ScrCmd_287                                    ; 287
	.word ScrCmd_288                                    ; 288
	.word ScrCmd_289                                    ; 289
	.word ScrCmd_290                                    ; 290
	.word ScrCmd_291                                    ; 291
	.word ScrCmd_292                                    ; 292
	.word ScrCmd_293                                    ; 293
	.word ScrCmd_294                                    ; 294
	.word ScrCmd_295                                    ; 295
	.word ScrCmd_296                                    ; 296
	.word ScrCmd_297                                    ; 297
	.word ScrCmd_298                                    ; 298
	.word ScrCmd_299                                    ; 299
	.word ScrCmd_300                                    ; 300
	.word ScrCmd_301                                    ; 301
	.word ScrCmd_302                                    ; 302
	.word ScrCmd_303                                    ; 303
	.word ScrCmd_304                                    ; 304
	.word ScrCmd_305                                    ; 305
	.word ScrCmd_306                                    ; 306
	.word ScrCmd_307                                    ; 307
	.word ScrCmd_308                                    ; 308
	.word ScrCmd_309                                    ; 309
	.word ScrCmd_310                                    ; 310
	.word ScrCmd_311                                    ; 311
	.word ScrCmd_312                                    ; 312
	.word ScrCmd_313                                    ; 313
	.word ScrCmd_314                                    ; 314
	.word ScrCmd_315                                    ; 315
	.word ScrCmd_316                                    ; 316
	.word ScrCmd_317                                    ; 317
	.word ScrCmd_318                                    ; 318
	.word ScrCmd_319                                    ; 319
	.word ScrCmd_320                                    ; 320
	.word ScrCmd_321                                    ; 321
	.word ScrCmd_322                                    ; 322
	.word ScrCmd_323                                    ; 323
	.word ScrCmd_324                                    ; 324
	.word ScrCmd_325                                    ; 325
	.word ScrCmd_326                                    ; 326
	.word ScrCmd_327                                    ; 327
	.word ScrCmd_328                                    ; 328
	.word ScrCmd_329                                    ; 329
	.word ScrCmd_330                                    ; 330
	.word ScrCmd_331                                    ; 331
	.word ScrCmd_332                                    ; 332
	.word ScrCmd_333                                    ; 333
	.word ScrCmd_334                                    ; 334
	.word ScrCmd_335                                    ; 335
	.word ScrCmd_336                                    ; 336
	.word ScrCmd_337                                    ; 337
	.word ScrCmd_338                                    ; 338
	.word ScrCmd_339                                    ; 339
	.word ScrCmd_340                                    ; 340
	.word ScrCmd_341                                    ; 341
	.word ScrCmd_342                                    ; 342
	.word ScrCmd_343                                    ; 343
	.word ScrCmd_344                                    ; 344
	.word ScrCmd_345                                    ; 345
	.word ScrCmd_346                                    ; 346
	.word ScrCmd_347                                    ; 347
	.word ScrCmd_348                                    ; 348
	.word ScrCmd_349                                    ; 349
	.word ScrCmd_350                                    ; 350
	.word ScrCmd_351                                    ; 351
	.word ScrCmd_352                                    ; 352
	.word ScrCmd_353                                    ; 353
	.word ScrCmd_354                                    ; 354
	.word ScrCmd_355                                    ; 355
	.word ScrCmd_356                                    ; 356
	.word ScrCmd_357                                    ; 357
	.word ScrCmd_358                                    ; 358
	.word ScrCmd_359                                    ; 359
	.word ScrCmd_360                                    ; 360
	.word ScrCmd_361                                    ; 361
	.word ScrCmd_362                                    ; 362
	.word ScrCmd_363                                    ; 363
	.word ScrCmd_364                                    ; 364
	.word ScrCmd_365                                    ; 365
	.word ScrCmd_366                                    ; 366
	.word ScrCmd_367                                    ; 367
	.word ScrCmd_368                                    ; 368
	.word ScrCmd_369                                    ; 369
	.word ScrCmd_370                                    ; 370
	.word ScrCmd_371                                    ; 371
	.word ScrCmd_372                                    ; 372
	.word ScrCmd_373                                    ; 373
	.word ScrCmd_374                                    ; 374
	.word ScrCmd_375                                    ; 375
	.word ScrCmd_376                                    ; 376
	.word ScrCmd_377                                    ; 377
	.word ScrCmd_378                                    ; 378
	.word ScrCmd_379                                    ; 379
	.word ScrCmd_380                                    ; 380
	.word ScrCmd_381                                    ; 381
	.word ScrCmd_382                                    ; 382
	.word ScrCmd_383                                    ; 383
	.word ScrCmd_384                                    ; 384
	.word ScrCmd_385                                    ; 385
	.word ScrCmd_386                                    ; 386
	.word ScrCmd_387                                    ; 387
	.word ScrCmd_388                                    ; 388
	.word ScrCmd_389                                    ; 389
	.word ScrCmd_390                                    ; 390
	.word ScrCmd_391                                    ; 391
	.word ScrCmd_392                                    ; 392
	.word ScrCmd_393                                    ; 393
	.word ScrCmd_394                                    ; 394
	.word ScrCmd_395                                    ; 395
	.word ScrCmd_396                                    ; 396
	.word ScrCmd_397                                    ; 397
	.word ScrCmd_398                                    ; 398
	.word ScrCmd_399                                    ; 399
	.word ScrCmd_400                                    ; 400
	.word ScrCmd_401                                    ; 401
	.word ScrCmd_402                                    ; 402
	.word ScrCmd_403                                    ; 403
	.word ScrCmd_404                                    ; 404
	.word ScrCmd_405                                    ; 405
	.word ScrCmd_406                                    ; 406
	.word ScrCmd_407                                    ; 407
	.word ScrCmd_408                                    ; 408
	.word ScrCmd_409                                    ; 409
	.word ScrCmd_410                                    ; 410
	.word ScrCmd_411                                    ; 411
	.word ScrCmd_412                                    ; 412
	.word ScrCmd_413                                    ; 413
	.word ScrCmd_414                                    ; 414
	.word ScrCmd_415                                    ; 415
	.word ScrCmd_416                                    ; 416
	.word ScrCmd_417                                    ; 417
	.word ScrCmd_418                                    ; 418
	.word ScrCmd_419                                    ; 419
	.word ScrCmd_420                                    ; 420
	.word ScrCmd_421                                    ; 421
	.word ScrCmd_422                                    ; 422
	.word ScrCmd_423                                    ; 423
	.word ScrCmd_424                                    ; 424
	.word ScrCmd_425                                    ; 425
	.word ScrCmd_426                                    ; 426
	.word ScrCmd_427                                    ; 427
	.word ScrCmd_428                                    ; 428
	.word ScrCmd_116                                    ; 429
	.word ScrCmd_430                                    ; 430
	.word ScrCmd_431                                    ; 431
	.word ScrCmd_432                                    ; 432
	.word ScrCmd_433                                    ; 433
	.word ScrCmd_434                                    ; 434
	.word ScrCmd_435                                    ; 435
	.word ScrCmd_436                                    ; 436
	.word ScrCmd_DebugWatch                             ; 437
	.word ScrCmd_438                                    ; 438
	.word ScrCmd_439                                    ; 439
	.word ScrCmd_440                                    ; 440
	.word ScrCmd_441                                    ; 441
	.word ScrCmd_442                                    ; 442
	.word ScrCmd_443                                    ; 443
	.word ScrCmd_444                                    ; 444
	.word ScrCmd_445                                    ; 445
	.word ScrCmd_446                                    ; 446
	.word ScrCmd_447                                    ; 447
	.word ScrCmd_448                                    ; 448
	.word ScrCmd_449                                    ; 449
	.word ScrCmd_450                                    ; 450
	.word ScrCmd_451                                    ; 451
	.word ScrCmd_452                                    ; 452
	.word ScrCmd_453                                    ; 453
	.word ScrCmd_454                                    ; 454
	.word ScrCmd_455                                    ; 455
	.word ScrCmd_456                                    ; 456
	.word ScrCmd_457                                    ; 457
	.word ScrCmd_458                                    ; 458
	.word ScrCmd_459                                    ; 459
	.word ScrCmd_460                                    ; 460
	.word ScrCmd_461                                    ; 461
	.word ScrCmd_462                                    ; 462
	.word ScrCmd_463                                    ; 463
	.word ScrCmd_464                                    ; 464
	.word ScrCmd_465                                    ; 465
	.word ScrCmd_466                                    ; 466
	.word ScrCmd_467                                    ; 467
	.word ScrCmd_468                                    ; 468
	.word ScrCmd_469                                    ; 469
	.word ScrCmd_470                                    ; 470
	.word ScrCmd_471                                    ; 471
	.word ScrCmd_472                                    ; 472
	.word ScrCmd_473                                    ; 473
	.word ScrCmd_474                                    ; 474
	.word ScrCmd_475                                    ; 475
	.word ScrCmd_476                                    ; 476
	.word ScrCmd_477                                    ; 477
	.word ScrCmd_478                                    ; 478
	.word ScrCmd_479                                    ; 479
	.word ScrCmd_480                                    ; 480
	.word ScrCmd_481                                    ; 481
	.word ScrCmd_482                                    ; 482
	.word ScrCmd_483                                    ; 483
	.word ScrCmd_484                                    ; 484
	.word ScrCmd_485                                    ; 485
	.word ScrCmd_Dummy                                  ; 486
	.word ScrCmd_487                                    ; 487
	.word ScrCmd_488                                    ; 488
	.word ScrCmd_489                                    ; 489
	.word ScrCmd_490                                    ; 490
	.word ScrCmd_491                                    ; 491
	.word ScrCmd_492                                    ; 492
	.word ScrCmd_493                                    ; 493
	.word ScrCmd_494                                    ; 494
	.word ScrCmd_495                                    ; 495
	.word ScrCmd_496                                    ; 496
	.word ScrCmd_497                                    ; 497
	.word ScrCmd_498                                    ; 498
	.word ScrCmd_499                                    ; 499
	.word ScrCmd_500                                    ; 500
	.word ScrCmd_501                                    ; 501
	.word ScrCmd_502                                    ; 502
	.word ScrCmd_503                                    ; 503
	.word ScrCmd_504                                    ; 504
	.word ScrCmd_505                                    ; 505
	.word ScrCmd_506                                    ; 506
	.word ScrCmd_507                                    ; 507
	.word ScrCmd_508                                    ; 508
	.word ScrCmd_509                                    ; 509
	.word ScrCmd_510                                    ; 510
	.word ScrCmd_511                                    ; 511
	.word ScrCmd_512                                    ; 512
	.word ScrCmd_513                                    ; 513
	.word ScrCmd_514                                    ; 514
	.word ScrCmd_515                                    ; 515
	.word ScrCmd_516                                    ; 516
	.word ScrCmd_517                                    ; 517
	.word ScrCmd_518                                    ; 518
	.word ScrCmd_519                                    ; 519
	.word ScrCmd_520                                    ; 520
	.word ScrCmd_521                                    ; 521
	.word ScrCmd_522                                    ; 522
	.word ScrCmd_523                                    ; 523
	.word ScrCmd_524                                    ; 524
	.word ScrCmd_525                                    ; 525
	.word ScrCmd_526                                    ; 526
	.word ScrCmd_527                                    ; 527
	.word ScrCmd_528                                    ; 528
	.word ScrCmd_529                                    ; 529
	.word ScrCmd_530                                    ; 530
	.word ScrCmd_531                                    ; 531
	.word ScrCmd_532                                    ; 532
	.word ScrCmd_533                                    ; 533
	.word ScrCmd_534                                    ; 534
	.word ScrCmd_535                                    ; 535
	.word ScrCmd_536                                    ; 536
	.word ScrCmd_537                                    ; 537
	.word ScrCmd_538                                    ; 538
	.word ScrCmd_539                                    ; 539
	.word ScrCmd_540                                    ; 540
	.word ScrCmd_541                                    ; 541
	.word ScrCmd_542                                    ; 542
	.word ScrCmd_543                                    ; 543
	.word ScrCmd_544                                    ; 544
	.word ScrCmd_545                                    ; 545
	.word ScrCmd_546                                    ; 546
	.word ScrCmd_547                                    ; 547
	.word ScrCmd_548                                    ; 548
	.word ScrCmd_549                                    ; 549
	.word ScrCmd_550                                    ; 550
	.word ScrCmd_551                                    ; 551
	.word ScrCmd_552                                    ; 552
	.word ScrCmd_553                                    ; 553
	.word ScrCmd_554                                    ; 554
	.word ScrCmd_555                                    ; 555
	.word ScrCmd_556                                    ; 556
	.word ScrCmd_557                                    ; 557
	.word ScrCmd_558                                    ; 558
	.word ScrCmd_559                                    ; 559
	.word ScrCmd_560                                    ; 560
	.word ScrCmd_561                                    ; 561
	.word ScrCmd_562                                    ; 562
	.word ScrCmd_563                                    ; 563
	.word ScrCmd_564                                    ; 564
	.word ScrCmd_565                                    ; 565
	.word ScrCmd_566                                    ; 566
	.word ScrCmd_567                                    ; 567
	.word ScrCmd_568                                    ; 568
	.word ScrCmd_569                                    ; 569
	.word ScrCmd_570                                    ; 570
	.word ScrCmd_571                                    ; 571
	.word ScrCmd_572                                    ; 572
	.word ScrCmd_573                                    ; 573
	.word ScrCmd_574                                    ; 574
	.word ScrCmd_575                                    ; 575
	.word ScrCmd_576                                    ; 576
	.word ScrCmd_577                                    ; 577
	.word ScrCmd_578                                    ; 578
	.word ScrCmd_579                                    ; 579
	.word ScrCmd_580                                    ; 580
	.word ScrCmd_581                                    ; 581
	.word ScrCmd_582                                    ; 582
	.word ScrCmd_583                                    ; 583
	.word ScrCmd_584                                    ; 584
	.word ScrCmd_585                                    ; 585
	.word ScrCmd_586                                    ; 586
	.word ScrCmd_587                                    ; 587
	.word ScrCmd_588                                    ; 588
	.word ScrCmd_589                                    ; 589
	.word ScrCmd_590                                    ; 590
	.word ScrCmd_591                                    ; 591
	.word ScrCmd_592                                    ; 592
	.word ScrCmd_593                                    ; 593
	.word ScrCmd_594                                    ; 594
	.word ScrCmd_595                                    ; 595
	.word ScrCmd_596                                    ; 596
	.word ScrCmd_597                                    ; 597
	.word ScrCmd_598                                    ; 598
	.word ScrCmd_599                                    ; 599
	.word ScrCmd_600                                    ; 600
	.word ScrCmd_601                                    ; 601
	.word ScrCmd_602                                    ; 602
	.word ScrCmd_603                                    ; 603
	.word ScrCmd_604                                    ; 604
	.word ScrCmd_605                                    ; 605
	.word ScrCmd_606                                    ; 606
	.word ScrCmd_607                                    ; 607
	.word ScrCmd_608                                    ; 608
	.word ScrCmd_609                                    ; 609
	.word ScrCmd_610                                    ; 610
	.word ScrCmd_611                                    ; 611
	.word ScrCmd_612                                    ; 612
	.word ScrCmd_613                                    ; 613
	.word ScrCmd_614                                    ; 614
	.word ScrCmd_615                                    ; 615
	.word ScrCmd_616                                    ; 616
	.word ScrCmd_617                                    ; 617
	.word ScrCmd_618                                    ; 618
	.word ScrCmd_619                                    ; 619
	.word ScrCmd_620                                    ; 620
	.word ScrCmd_621                                    ; 621
	.word ScrCmd_622                                    ; 622
	.word ScrCmd_623                                    ; 623
	.word ScrCmd_624                                    ; 624
	.word ScrCmd_625                                    ; 625
	.word ScrCmd_626                                    ; 626
	.word ScrCmd_627                                    ; 627
	.word ScrCmd_628                                    ; 628
	.word ScrCmd_629                                    ; 629
	.word ScrCmd_630                                    ; 630
	.word ScrCmd_631                                    ; 631
	.word ScrCmd_632                                    ; 632
	.word ScrCmd_633                                    ; 633
	.word ScrCmd_634                                    ; 634
	.word ScrCmd_635                                    ; 635
	.word ScrCmd_636                                    ; 636
	.word ScrCmd_637                                    ; 637
	.word ScrCmd_638                                    ; 638
	.word ScrCmd_639                                    ; 639
	.word ScrCmd_640                                    ; 640
	.word ScrCmd_641                                    ; 641
	.word ScrCmd_642                                    ; 642
	.word ScrCmd_643                                    ; 643
	.word ScrCmd_644                                    ; 644
	.word ScrCmd_645                                    ; 645
	.word ScrCmd_646                                    ; 646
	.word ScrCmd_647                                    ; 647
	.word ScrCmd_648                                    ; 648
	.word ScrCmd_649                                    ; 649
	.word ScrCmd_650                                    ; 650
	.word ScrCmd_651                                    ; 651
	.word ScrCmd_652                                    ; 652
	.word ScrCmd_653                                    ; 653
	.word ScrCmd_654                                    ; 654
	.word ScrCmd_655                                    ; 655
	.word ScrCmd_656                                    ; 656
	.word ScrCmd_657                                    ; 657
	.word ScrCmd_658                                    ; 658
	.word ScrCmd_659                                    ; 659
	.word ScrCmd_660                                    ; 660
	.word ScrCmd_661                                    ; 661
	.word ScrCmd_662                                    ; 662
	.word ScrCmd_663                                    ; 663
	.word ScrCmd_664                                    ; 664
	.word ScrCmd_665                                    ; 665
	.word ScrCmd_666                                    ; 666
	.word ScrCmd_667                                    ; 667
	.word ScrCmd_668                                    ; 668
	.word ScrCmd_669                                    ; 669
	.word ScrCmd_670                                    ; 670
	.word ScrCmd_671                                    ; 671
	.word ScrCmd_672                                    ; 672
	.word ScrCmd_673                                    ; 673
	.word ScrCmd_674                                    ; 674
	.word ScrCmd_675                                    ; 675
	.word ScrCmd_676                                    ; 676
	.word ScrCmd_677                                    ; 677
	.word ScrCmd_678                                    ; 678
	.word ScrCmd_679                                    ; 679
	.word ScrCmd_680                                    ; 680
	.word ScrCmd_681                                    ; 681
	.word ScrCmd_682                                    ; 682
	.word ScrCmd_683                                    ; 683
	.word ScrCmd_684                                    ; 684
	.word ScrCmd_685                                    ; 685
	.word ScrCmd_686                                    ; 686
	.word ScrCmd_687                                    ; 687
	.word ScrCmd_688                                    ; 688
	.word ScrCmd_689                                    ; 689
	.word ScrCmd_690                                    ; 690
	.word ScrCmd_691                                    ; 691
	.word ScrCmd_692                                    ; 692
	.word ScrCmd_693                                    ; 693
	.word ScrCmd_694                                    ; 694
	.word ScrCmd_695                                    ; 695
	.word ScrCmd_696                                    ; 696
	.word ScrCmd_697                                    ; 697
	.word ScrCmd_698                                    ; 698
	.word ScrCmd_699                                    ; 699
	.word ScrCmd_700                                    ; 700
	.word ScrCmd_701                                    ; 701
	.word ScrCmd_702                                    ; 702
	.word ScrCmd_703                                    ; 703
	.word ScrCmd_704                                    ; 704
	.word ScrCmd_705                                    ; 705
	.word ScrCmd_706                                    ; 706
	.word ScrCmd_707                                    ; 707
	.word ScrCmd_708                                    ; 708
	.word ScrCmd_709                                    ; 709
	.word ScrCmd_710                                    ; 710
	.word ScrCmd_711                                    ; 711
	.word ScrCmd_712                                    ; 712
	.word ScrCmd_713                                    ; 713
	.word ScrCmd_714                                    ; 714
	.word ScrCmd_715                                    ; 715
	.word ScrCmd_716                                    ; 716
	.word ScrCmd_717                                    ; 717
	.word ScrCmd_718                                    ; 718
	.word ScrCmd_719                                    ; 719
	.word ScrCmd_720                                    ; 720
	.word ScrCmd_721                                    ; 721
	.word ScrCmd_722                                    ; 722
	.word ScrCmd_723                                    ; 723
	.word ScrCmd_724                                    ; 724
	.word ScrCmd_725                                    ; 725
	.word ScrCmd_726                                    ; 726
	.word ScrCmd_727                                    ; 727
	.word ScrCmd_728                                    ; 728
	.word ScrCmd_729                                    ; 729
	.word ScrCmd_730                                    ; 730
	.word ScrCmd_731                                    ; 731
	.word ScrCmd_732                                    ; 732
	.word ScrCmd_733                                    ; 733
	.word ScrCmd_734                                    ; 734
	.word ScrCmd_735                                    ; 735
	.word ScrCmd_736                                    ; 736
	.word ScrCmd_737                                    ; 737
	.word ScrCmd_738                                    ; 738
	.word ScrCmd_739                                    ; 739
	.word ScrCmd_740                                    ; 740
	.word ScrCmd_741                                    ; 741
	.word ScrCmd_742                                    ; 742
	.word ScrCmd_743                                    ; 743
	.word ScrCmd_744                                    ; 744
	.word ScrCmd_745                                    ; 745
	.word ScrCmd_746                                    ; 746
	.word ScrCmd_747                                    ; 747
	.word ScrCmd_748                                    ; 748
	.word ScrCmd_749                                    ; 749
	.word ScrCmd_750                                    ; 750
	.word ScrCmd_751                                    ; 751
	.word ScrCmd_752                                    ; 752
	.word ScrCmd_753                                    ; 753
	.word ScrCmd_754                                    ; 754
	.word ScrCmd_755                                    ; 755
	.word ScrCmd_756                                    ; 756
	.word ScrCmd_757                                    ; 757
	.word ScrCmd_758                                    ; 758
	.word ScrCmd_759                                    ; 759
	.word ScrCmd_760                                    ; 760
	.word ScrCmd_761                                    ; 761
	.word ScrCmd_762                                    ; 762
	.word ScrCmd_763                                    ; 763
	.word ScrCmd_764                                    ; 764
	.word ScrCmd_765                                    ; 765
	.word ScrCmd_766                                    ; 766
	.word ScrCmd_767                                    ; 767
	.word ScrCmd_768                                    ; 768
	.word ScrCmd_769                                    ; 769
	.word ScrCmd_770                                    ; 770
	.word ScrCmd_771                                    ; 771
	.word ScrCmd_772                                    ; 772
	.word ScrCmd_773                                    ; 773
	.word ScrCmd_774                                    ; 774
	.word ScrCmd_775                                    ; 775
	.word ScrCmd_776                                    ; 776
	.word ScrCmd_777                                    ; 777
	.word ScrCmd_778                                    ; 778
	.word ScrCmd_779                                    ; 779
	.word ScrCmd_780                                    ; 780
	.word ScrCmd_781                                    ; 781
	.word ScrCmd_782                                    ; 782
	.word ScrCmd_783                                    ; 783
	.word ScrCmd_784                                    ; 784
	.word ScrCmd_785                                    ; 785
	.word ScrCmd_786                                    ; 786
	.word ScrCmd_787                                    ; 787
	.word ScrCmd_788                                    ; 788
	.word ScrCmd_789                                    ; 789
	.word ScrCmd_790                                    ; 790
	.word ScrCmd_791                                    ; 791
	.word ScrCmd_792                                    ; 792
	.word ScrCmd_793                                    ; 793
	.word ScrCmd_794                                    ; 794
	.word ScrCmd_795                                    ; 795
	.word ScrCmd_796                                    ; 796
	.word ScrCmd_797                                    ; 797
	.word ScrCmd_798                                    ; 798
	.word ScrCmd_799                                    ; 799
	.word ScrCmd_800                                    ; 800
	.word ScrCmd_801                                    ; 801
	.word ScrCmd_802                                    ; 802
	.word ScrCmd_803                                    ; 803
	.word ScrCmd_804                                    ; 804
	.word ScrCmd_805                                    ; 805
	.word ScrCmd_806                                    ; 806
	.word ScrCmd_807                                    ; 807
	.word ScrCmd_808                                    ; 808
	.word ScrCmd_809                                    ; 809
	.word ScrCmd_810                                    ; 810
	.word ScrCmd_811                                    ; 811
	.word ScrCmd_812                                    ; 812
	.word ScrCmd_813                                    ; 813
	.word ScrCmd_814                                    ; 814
	.word ScrCmd_815                                    ; 815
	.word ScrCmd_816                                    ; 816
	.word ScrCmd_817                                    ; 817
	.word ScrCmd_818                                    ; 818
	.word ScrCmd_819                                    ; 819
	.word ScrCmd_820                                    ; 820
	.word ScrCmd_821                                    ; 821
	.word ScrCmd_822                                    ; 822
	.word ScrCmd_823                                    ; 823
	.word ScrCmd_824                                    ; 824
	.word ScrCmd_825                                    ; 825
	.word ScrCmd_826                                    ; 826
	.word ScrCmd_827                                    ; 827
	.word ScrCmd_828                                    ; 828
	.word ScrCmd_829                                    ; 829
	.word ScrCmd_830                                    ; 830
	.word ScrCmd_831                                    ; 831
	.word ScrCmd_832                                    ; 832
	.word ScrCmd_833                                    ; 833
	.word ScrCmd_834                                    ; 834
	.word ScrCmd_835                                    ; 835
	.word ScrCmd_836                                    ; 836
	.word ScrCmd_837                                    ; 837
	.word ScrCmd_838                                    ; 838
	.word ScrCmd_839                                    ; 839
	.word ScrCmd_840                                    ; 840
	.word ScrCmd_841                                    ; 841
	.word ScrCmd_842                                    ; 842
	.word ScrCmd_843                                    ; 843
	.word ScrCmd_844                                    ; 844
	.word ScrCmd_845                                    ; 845
	.word ScrCmd_846                                    ; 846
	.word ScrCmd_847                                    ; 847
	.word ScrCmd_848                                    ; 848
	.word ScrCmd_849                                    ; 849
	.word ScrCmd_850                                    ; 850
	.word ScrCmd_851                                    ; 851
	.word ScrCmd_852                                    ; 852

	.text

	thumb_func_start sub_0203FE74
sub_0203FE74: ; 0x0203FE74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_0204001C
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0204005C
	ldr r1, _0203FEA0 ; =sub_0203FF44
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203FEA0: .word sub_0203FF44
	thumb_func_end sub_0203FE74

	thumb_func_start sub_0203FEA4
sub_0203FEA4: ; 0x0203FEA4
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02050650
	ldr r2, [sp, #0x1c]
	mov r1, #0x1c
	add r3, r2, #0
	add r0, #0x54
	mul r3, r1
	add r1, r0, r3
	str r4, [r0, r3]
	ldr r0, [sp, #0x10]
	str r6, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0xc]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x10]
	str r5, [r1, #0x14]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203FEA4

	thumb_func_start sub_0203FED4
sub_0203FED4: ; 0x0203FED4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #4]
	add r5, r3, #0
	bl sub_0205064C
	str r0, [sp, #8]
	bl sub_0204001C
	add r4, r0, #0
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	add r1, r4, #0
	add r2, r7, #0
	str r5, [sp]
	bl sub_0204005C
	ldr r1, _0203FF08 ; =sub_0203FF44
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050530
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FF08: .word sub_0203FF44
	thumb_func_end sub_0203FED4

	thumb_func_start sub_0203FF0C
sub_0203FF0C: ; 0x0203FF0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_0205064C
	str r0, [sp, #4]
	bl sub_0204001C
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0204005C
	ldr r1, _0203FF40 ; =sub_0203FF44
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02050510
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FF40: .word sub_0203FF44
	thumb_func_end sub_0203FF0C

	thumb_func_start sub_0203FF44
sub_0203FF44: ; 0x0203FF44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	ldrb r1, [r4, #4]
	str r0, [sp]
	cmp r1, #0
	beq _0203FF64
	cmp r1, #1
	beq _0203FF9A
	b _02040016
_0203FF64:
	ldrh r1, [r4, #0xa]
	bl CreateScriptContext
	str r0, [r4, #0x38]
	mov r0, #1
	strb r0, [r4, #9]
	mov r0, #8
	mov r1, #0x40
	mov r2, #0xb
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x44]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x4c]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
_0203FF9A:
	mov r0, #0
	add r7, r4, #0
	str r0, [sp, #4]
	add r5, r4, #0
	add r7, #9
_0203FFA4:
	ldr r6, [r5, #0x38]
	cmp r6, #0
	beq _0203FFCE
	add r0, r6, #0
	bl RunScriptCommand
	cmp r0, #0
	bne _0203FFCE
	add r0, r6, #0
	bl sub_02040044
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0203FFC4
	bl GF_AssertFail
_0203FFC4:
	mov r0, #0
	str r0, [r5, #0x38]
	ldrb r0, [r7]
	sub r0, r0, #1
	strb r0, [r7]
_0203FFCE:
	ldr r0, [sp, #4]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #3
	blt _0203FFA4
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02040016
	add r0, r4, #0
	add r0, #0xa8
	ldr r5, [r0]
	ldr r0, [r4, #0x44]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x48]
	bl String_dtor
	ldr r0, [r4, #0x4c]
	bl String_dtor
	mov r0, #0
	str r0, [r4]
	add r0, r4, #0
	bl FreeToHeap
	cmp r5, #0
	beq _02040010
	ldr r0, [sp]
	blx r5
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02040010:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02040016:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203FF44

	thumb_func_start sub_0204001C
sub_0204001C: ; 0x0204001C
	push {r4, lr}
	mov r0, #0xb
	mov r1, #0xe0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0204002E
	bl GF_AssertFail
_0204002E:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xe0
	bl memset
	ldr r0, _02040040 ; =0x0003643F
	str r0, [r4]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02040040: .word 0x0003643F
	thumb_func_end sub_0204001C

	thumb_func_start sub_02040044
sub_02040044: ; 0x02040044
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	bl DestroyMsgData
	ldr r0, [r4, #0x7c]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02040044

	thumb_func_start sub_0204005C
sub_0204005C: ; 0x0204005C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x37
	add r4, r2, #0
	add r6, r3, #0
	bl FieldSysGetAttrAddrInternal
	str r0, [sp]
	ldr r0, [r7, #0x40]
	bl sub_0205C654
	str r0, [r5, #0x28]
	str r6, [r5, #0x2c]
	ldr r0, [sp, #0x18]
	strh r4, [r5, #0xa]
	str r0, [r5, #0x34]
	cmp r6, #0
	beq _0204008E
	add r0, r6, #0
	bl sub_0205F24C
	ldr r1, [sp]
	strh r0, [r1]
_0204008E:
	mov r0, #0x7d
	lsl r0, r0, #6
	cmp r4, r0
	blo _020400A4
	ldr r0, _020400A8 ; =0x0000225F
	cmp r4, r0
	bhi _020400A4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020405AC
_020400A4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020400A8: .word 0x0000225F
	thumb_func_end sub_0204005C

	thumb_func_start CreateScriptContext
CreateScriptContext: ; 0x020400AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x84
	bl AllocFromHeap
	add r4, r0, #0
	bne _020400C2
	bl GF_AssertFail
_020400C2:
	ldr r2, _020400E0 ; =sNumScriptCmds
	ldr r1, _020400E4 ; =gScriptCmdTable
	ldr r2, [r2]
	add r0, r4, #0
	bl InitScriptContext
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl SetUpScriptContextForMap
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_020400E0: .word sNumScriptCmds
_020400E4: .word gScriptCmdTable
	thumb_func_end CreateScriptContext

	thumb_func_start SetUpScriptContextForMap
SetUpScriptContextForMap: ; 0x020400E8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r3, r4, #0
	add r5, r0, #0
	add r3, #0x80
	str r5, [r3]
	bl LoadScriptsAndMessagesByMapId
	add r6, r0, #0
	ldr r1, [r4, #0x7c]
	add r0, r4, #0
	bl SetupBytecodeScript
	add r0, r4, #0
	add r1, r6, #0
	bl ScriptRunByIndex
	ldr r1, [r5, #0x10]
	add r0, r4, #0
	bl sub_0203FD68
	pop {r4, r5, r6, pc}
	thumb_func_end SetUpScriptContextForMap

	thumb_func_start LoadScriptsAndMessagesByMapId
LoadScriptsAndMessagesByMapId: ; 0x02040114
	push {r4, r5, r6, lr}
	ldr r6, _02040164 ; =sScriptBankMapping
	add r5, r2, #0
	mov r2, #0
	add r4, r6, #0
_0204011E:
	ldrh r3, [r4]
	cmp r5, r3
	blo _0204013E
	mov r3, #6
	add r4, r2, #0
	mul r4, r3
	add r3, r6, r4
	ldrh r2, [r3, #2]
	ldrh r3, [r3, #4]
	bl LoadScriptsAndMessagesParameterized
	ldrh r0, [r6, r4]
	sub r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0204013E:
	add r2, r2, #1
	add r4, r4, #6
	cmp r2, #0x1e
	blo _0204011E
	cmp r5, #1
	blo _02040156
	bl LoadScriptsAndMessagesForCurrentMap
	sub r0, r5, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_02040156:
	mov r2, #0x8c
	mov r3, #0xb8
	bl LoadScriptsAndMessagesParameterized
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02040164: .word sScriptBankMapping
	thumb_func_end LoadScriptsAndMessagesByMapId

	thumb_func_start LoadScriptsAndMessagesParameterized
LoadScriptsAndMessagesParameterized: ; 0x02040168
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	mov r0, #0xc ; NARC_fielddata_script_scr_seq
	mov r2, #0xb
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5, #0x7c]
	mov r0, #1
	mov r1, #0x1b
	add r2, r4, #0
	mov r3, #0xb
	bl NewMsgDataFromNarc
	str r0, [r5, #0x78]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end LoadScriptsAndMessagesParameterized

	thumb_func_start LoadScriptsAndMessagesForCurrentMap
LoadScriptsAndMessagesForCurrentMap: ; 0x0204018C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	ldr r0, [r0]
	bl LoadScriptsForCurrentMap
	str r0, [r4, #0x7c]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl GetCurrentMapMessageBank
	add r2, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0xb
	bl NewMsgDataFromNarc
	str r0, [r4, #0x78]
	pop {r3, r4, r5, pc}
	thumb_func_end LoadScriptsAndMessagesForCurrentMap

	thumb_func_start FieldSysGetAttrAddrInternal
FieldSysGetAttrAddrInternal: ; 0x020401B4
	push {r3, lr}
	cmp r1, #0x37
	bls _020401BC
	b _020402E8
_020401BC:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_020401C8: ; jump table
	.short _02040238 - _020401C8 - 2 ; case 0
	.short _0204023C - _020401C8 - 2 ; case 1
	.short _02040240 - _020401C8 - 2 ; case 2
	.short _02040244 - _020401C8 - 2 ; case 3
	.short _02040248 - _020401C8 - 2 ; case 4
	.short _0204024C - _020401C8 - 2 ; case 5
	.short _02040250 - _020401C8 - 2 ; case 6
	.short _02040254 - _020401C8 - 2 ; case 7
	.short _02040258 - _020401C8 - 2 ; case 8
	.short _0204025C - _020401C8 - 2 ; case 9
	.short _02040260 - _020401C8 - 2 ; case 10
	.short _02040264 - _020401C8 - 2 ; case 11
	.short _02040268 - _020401C8 - 2 ; case 12
	.short _0204026C - _020401C8 - 2 ; case 13
	.short _0204026C - _020401C8 - 2 ; case 14
	.short _0204026C - _020401C8 - 2 ; case 15
	.short _02040276 - _020401C8 - 2 ; case 16
	.short _0204027A - _020401C8 - 2 ; case 17
	.short _0204027E - _020401C8 - 2 ; case 18
	.short _02040282 - _020401C8 - 2 ; case 19
	.short _02040286 - _020401C8 - 2 ; case 20
	.short _0204028A - _020401C8 - 2 ; case 21
	.short _0204028E - _020401C8 - 2 ; case 22
	.short _02040292 - _020401C8 - 2 ; case 23
	.short _02040296 - _020401C8 - 2 ; case 24
	.short _0204029A - _020401C8 - 2 ; case 25
	.short _0204029E - _020401C8 - 2 ; case 26
	.short _020402A2 - _020401C8 - 2 ; case 27
	.short _020402A6 - _020401C8 - 2 ; case 28
	.short _020402AA - _020401C8 - 2 ; case 29
	.short _020402AE - _020401C8 - 2 ; case 30
	.short _020402B2 - _020401C8 - 2 ; case 31
	.short _020402B6 - _020401C8 - 2 ; case 32
	.short _020402BA - _020401C8 - 2 ; case 33
	.short _020402BE - _020401C8 - 2 ; case 34
	.short _020402C2 - _020401C8 - 2 ; case 35
	.short _020402C6 - _020401C8 - 2 ; case 36
	.short _020402CA - _020401C8 - 2 ; case 37
	.short _020402CE - _020401C8 - 2 ; case 38
	.short _020402D2 - _020401C8 - 2 ; case 39
	.short _020402D6 - _020401C8 - 2 ; case 40
	.short _020402DA - _020401C8 - 2 ; case 41
	.short _020402DE - _020401C8 - 2 ; case 42
	.short _020402DE - _020401C8 - 2 ; case 43
	.short _020402DE - _020401C8 - 2 ; case 44
	.short _020402DE - _020401C8 - 2 ; case 45
	.short _020402DE - _020401C8 - 2 ; case 46
	.short _020402DE - _020401C8 - 2 ; case 47
	.short _020402DE - _020401C8 - 2 ; case 48
	.short _020402DE - _020401C8 - 2 ; case 49
	.short _020402DE - _020401C8 - 2 ; case 50
	.short _020402DE - _020401C8 - 2 ; case 51
	.short _020402DE - _020401C8 - 2 ; case 52
	.short _020402DE - _020401C8 - 2 ; case 53
	.short _020402DE - _020401C8 - 2 ; case 54
	.short _020402DE - _020401C8 - 2 ; case 55
_02040238:
	add r0, #0x10
	pop {r3, pc}
_0204023C:
	add r0, #0x14
	pop {r3, pc}
_02040240:
	add r0, #0x24
	pop {r3, pc}
_02040244:
	add r0, r0, #5
	pop {r3, pc}
_02040248:
	add r0, r0, #6
	pop {r3, pc}
_0204024C:
	add r0, r0, #7
	pop {r3, pc}
_02040250:
	add r0, #8
	pop {r3, pc}
_02040254:
	add r0, #9
	pop {r3, pc}
_02040258:
	add r0, #0xa
	pop {r3, pc}
_0204025C:
	add r0, #0x28
	pop {r3, pc}
_02040260:
	add r0, #0x2c
	pop {r3, pc}
_02040264:
	add r0, #0x30
	pop {r3, pc}
_02040268:
	add r0, #0x34
	pop {r3, pc}
_0204026C:
	sub r1, #0xd
	add r0, #0x38
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
_02040276:
	add r0, #0x44
	pop {r3, pc}
_0204027A:
	add r0, #0x48
	pop {r3, pc}
_0204027E:
	add r0, #0x4c
	pop {r3, pc}
_02040282:
	add r0, #0x50
	pop {r3, pc}
_02040286:
	add r0, #0xac
	pop {r3, pc}
_0204028A:
	add r0, #0xb0
	pop {r3, pc}
_0204028E:
	add r0, #0xb4
	pop {r3, pc}
_02040292:
	add r0, #0xb8
	pop {r3, pc}
_02040296:
	add r0, #0xc
	pop {r3, pc}
_0204029A:
	add r0, #0x54
	pop {r3, pc}
_0204029E:
	add r0, #0x58
	pop {r3, pc}
_020402A2:
	add r0, #0x5c
	pop {r3, pc}
_020402A6:
	add r0, #0x60
	pop {r3, pc}
_020402AA:
	add r0, #0x64
	pop {r3, pc}
_020402AE:
	add r0, #0x68
	pop {r3, pc}
_020402B2:
	add r0, #0x6c
	pop {r3, pc}
_020402B6:
	add r0, #0x70
	pop {r3, pc}
_020402BA:
	add r0, #0x74
	pop {r3, pc}
_020402BE:
	add r0, #0x78
	pop {r3, pc}
_020402C2:
	add r0, #0x7c
	pop {r3, pc}
_020402C6:
	add r0, #0x80
	pop {r3, pc}
_020402CA:
	add r0, #0x84
	pop {r3, pc}
_020402CE:
	add r0, #0x88
	pop {r3, pc}
_020402D2:
	add r0, #0xbc
	pop {r3, pc}
_020402D6:
	add r0, #0xcc
	pop {r3, pc}
_020402DA:
	add r0, #0xdc
	pop {r3, pc}
_020402DE:
	sub r1, #0x2a
	add r0, #0x8c
	lsl r1, r1, #1
	add r0, r0, r1
	pop {r3, pc}
_020402E8:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end FieldSysGetAttrAddrInternal

	thumb_func_start FieldSysGetAttrAddr
FieldSysGetAttrAddr: ; 0x020402F0
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	bl sub_02050650
	add r4, r0, #0
	bne _02040302
	bl GF_AssertFail
_02040302:
	ldr r1, [r4]
	ldr r0, _02040318 ; =0x0003643F
	cmp r1, r0
	beq _0204030E
	bl GF_AssertFail
_0204030E:
	add r0, r4, #0
	add r1, r5, #0
	bl FieldSysGetAttrAddrInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040318: .word 0x0003643F
	thumb_func_end FieldSysGetAttrAddr

	thumb_func_start sub_0204031C
sub_0204031C: ; 0x0204031C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203BC10
	cmp r0, #1
	bne _02040338
	ldr r0, _0204033C ; =sub_0203BD64
	add r4, #0xa8
	str r0, [r4]
_02040338:
	pop {r3, r4, r5, pc}
	nop
_0204033C: .word sub_0203BD64
	thumb_func_end sub_0204031C

	thumb_func_start ScriptRunByIndex
ScriptRunByIndex: ; 0x02040340
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r4, #8]
	bl ScriptReadWord
	ldr r1, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ScriptRunByIndex

	thumb_func_start LoadScriptsForCurrentMap
LoadScriptsForCurrentMap: ; 0x02040358
	push {r3, lr}
	bl MapHeader_GetScriptsBank
	add r1, r0, #0
	mov r0, #0xc
	mov r2, #0xb
	bl AllocAndReadWholeNarcMemberByIdPair
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end LoadScriptsForCurrentMap

	thumb_func_start GetCurrentMapMessageBank
GetCurrentMapMessageBank: ; 0x0204036C
	ldr r3, _02040370 ; =MapHeader_GetMsgBank
	bx r3
	.balign 4, 0
_02040370: .word MapHeader_GetMsgBank
	thumb_func_end GetCurrentMapMessageBank

	thumb_func_start GetVarPointer
GetVarPointer: ; 0x02040374
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r4, r1
	bhs _0204038C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0204038C:
	lsl r1, r1, #1
	cmp r4, r1
	bhs _0204039A
	add r1, r4, #0
	bl GetVarAddr
	pop {r3, r4, r5, pc}
_0204039A:
	ldr r1, _020403A8 ; =0x00007FD6
	add r0, r5, #0
	sub r1, r4, r1
	bl FieldSysGetAttrAddr
	pop {r3, r4, r5, pc}
	nop
_020403A8: .word 0x00007FD6
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: ; 0x020403AC
	push {r4, lr}
	add r4, r1, #0
	bl GetVarPointer
	cmp r0, #0
	beq _020403BA
	ldrh r4, [r0]
_020403BA:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: ; 0x020403C0
	push {r4, lr}
	add r4, r2, #0
	bl GetVarPointer
	cmp r0, #0
	bne _020403D0
	mov r0, #0
	pop {r4, pc}
_020403D0:
	strh r4, [r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end VarSet

	thumb_func_start VarGetObjectEventGraphicsId
VarGetObjectEventGraphicsId: ; 0x020403D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x10
	blo _020403E6
	bl GF_AssertFail
_020403E6:
	ldr r1, _020403F8 ; =0x00004020
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl VarGet
	pop {r3, r4, r5, pc}
	nop
_020403F8: .word 0x00004020
	thumb_func_end VarGetObjectEventGraphicsId

	thumb_func_start FlagGet
FlagGet: ; 0x020403FC
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	add r1, r4, #0
	bl CheckFlagInArray
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FlagGet

	thumb_func_start FlagSet
FlagSet: ; 0x02040410
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	add r1, r4, #0
	bl SetFlagInArray
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FlagSet

	thumb_func_start FlagClear
FlagClear: ; 0x02040424
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	add r1, r4, #0
	bl ClearFlagInArray
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FlagClear

	thumb_func_start ClearTempFieldEventData
ClearTempFieldEventData: ; 0x02040438
	push {r4, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	mov r1, #1
	add r4, r0, #0
	bl GetFlagAddr
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl GetVarAddr
	mov r1, #0
	mov r2, #0x40
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ClearTempFieldEventData

	thumb_func_start ClearDailyFlags
ClearDailyFlags: ; 0x02040470
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	mov r1, #0xaa
	lsl r1, r1, #4
	bl GetFlagAddr
	mov r2, #0x18
	mov r1, #0
_02040484:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02040484
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ClearDailyFlags

	thumb_func_start sub_02040490
sub_02040490: ; 0x02040490
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x2a
	add r6, r2, #0
	add r7, r3, #0
	bl FieldSysGetAttrAddr
	strh r4, [r0]
	add r0, r5, #0
	mov r1, #0x2b
	bl FieldSysGetAttrAddr
	strh r6, [r0]
	add r0, r5, #0
	mov r1, #0x2c
	bl FieldSysGetAttrAddr
	strh r7, [r0]
	add r0, r5, #0
	mov r1, #0x2d
	bl FieldSysGetAttrAddr
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02040490

	thumb_func_start sub_020404C8
sub_020404C8: ; 0x020404C8
	ldr r1, _020404E4 ; =0x00001388
	cmp r0, r1
	bhs _020404D8
	ldr r1, _020404E8 ; =0x00000BB7
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_020404D8:
	sub r1, r1, #1
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_020404E4: .word 0x00001388
_020404E8: .word 0x00000BB7
	thumb_func_end sub_020404C8

	thumb_func_start sub_020404EC
sub_020404EC: ; 0x020404EC
	ldr r1, _020404FC ; =0x00001388
	cmp r0, r1
	blo _020404F6
	mov r0, #1
	bx lr
_020404F6:
	mov r0, #0
	bx lr
	nop
_020404FC: .word 0x00001388
	thumb_func_end sub_020404EC

	thumb_func_start sub_02040500
sub_02040500: ; 0x02040500
	push {r3, lr}
	mov r1, #9
	bl TrainerData_GetAttr
	cmp r0, #0
	beq _02040510
	mov r0, #1
	pop {r3, pc}
_02040510:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02040500

	thumb_func_start TrainerFlagCheck
TrainerFlagCheck: ; 0x02040514
	push {r4, lr}
	add r4, r1, #0
	bl SavArray_Flags_get
	mov r1, #0x55
	lsl r1, r1, #4
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl CheckFlagInArray
	pop {r4, pc}
	thumb_func_end TrainerFlagCheck

	thumb_func_start TrainerFlagSet
TrainerFlagSet: ; 0x0204052C
	push {r4, lr}
	add r4, r1, #0
	bl SavArray_Flags_get
	mov r1, #0x55
	lsl r1, r1, #4
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl SetFlagInArray
	pop {r4, pc}
	thumb_func_end TrainerFlagSet

	thumb_func_start TrainerFlagClear
TrainerFlagClear: ; 0x02040544
	push {r4, lr}
	add r4, r1, #0
	bl SavArray_Flags_get
	mov r1, #0x55
	lsl r1, r1, #4
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ClearFlagInArray
	pop {r4, pc}
	thumb_func_end TrainerFlagClear

	thumb_func_start sub_0204055C
sub_0204055C: ; 0x0204055C
	ldr r1, _02040568 ; =0x00001C20
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_02040568: .word 0x00001C20
	thumb_func_end sub_0204055C

	thumb_func_start sub_0204056C
sub_0204056C: ; 0x0204056C
	mov r1, #0x7d
	lsl r1, r1, #6
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end sub_0204056C

	thumb_func_start sub_02040578
sub_02040578: ; 0x02040578
	push {r4, lr}
	ldr r4, _020405A8 ; =_020FA558
	bl sub_0204056C
	mov r2, #0
	add r3, r4, #0
_02040584:
	ldrh r1, [r3, #6]
	cmp r0, r1
	beq _02040592
	add r2, r2, #1
	add r3, #8
	cmp r2, #0xe7
	blo _02040584
_02040592:
	cmp r2, #0xe7
	blo _0204059E
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0204059E:
	lsl r0, r2, #3
	add r0, r4, r0
	ldrb r0, [r0, #3]
	pop {r4, pc}
	nop
_020405A8: .word _020FA558
	thumb_func_end sub_02040578

	thumb_func_start sub_020405AC
sub_020405AC: ; 0x020405AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #0x2a
	bl FieldSysGetAttrAddrInternal
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x2b
	bl FieldSysGetAttrAddrInternal
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2c
	bl FieldSysGetAttrAddrInternal
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0204056C
	ldr r3, _02040610 ; =_020FA558
	add r2, r0, #0
	mov r1, #0
_020405DA:
	ldrh r0, [r3, #6]
	cmp r2, r0
	beq _020405E8
	add r1, r1, #1
	add r3, #8
	cmp r1, #0xe7
	blo _020405DA
_020405E8:
	cmp r1, #0xe7
	blo _020405F4
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020405F4:
	lsl r0, r1, #3
	ldr r1, _02040610 ; =_020FA558
	ldrh r1, [r1, r0]
	strh r1, [r7]
	ldr r1, _02040610 ; =_020FA558
	add r0, r1, r0
	ldrb r0, [r0, #2]
	strh r0, [r6]
	add r0, r5, #0
	bl sub_0204055C
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02040610: .word _020FA558
	thumb_func_end sub_020405AC

	thumb_func_start sub_02040614
sub_02040614: ; 0x02040614
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp]
	add r4, r1, #0
	mov r6, #0
	bl sub_0203B6E0
	add r5, r0, #0
	add r2, r5, #1
	mov r1, #6
	add r0, r4, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [sp, #0x1c]
	cmp r5, #0
	bne _02040646
	mov r2, #0xff
	add r1, r0, #0
	strb r2, [r1, #4]
	sub r2, r6, #1
	strh r2, [r1]
	strh r2, [r1, #2]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02040646:
	ldr r0, [sp]
	bl sub_0203B6D8
	add r4, r0, #0
	bne _02040660
	ldr r0, [sp, #0x1c]
	mov r1, #0xff
	strb r1, [r0, #4]
	sub r1, r6, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02040660:
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl sub_0205C67C
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl sub_0205C688
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x10]
	sub r0, #0x11
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0xc]
	add r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	sub r0, #0x11
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	add r0, #0x11
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _0204069E
	add r0, r6, #0
	str r0, [sp, #0x10]
_0204069E:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _020406A8
	mov r0, #0
	str r0, [sp, #8]
_020406A8:
	add r0, r5, #1
	mov r7, #0
	str r0, [sp, #0x20]
	cmp r0, #0
	ble _0204070E
	ldr r5, [sp, #0x1c]
_020406B4:
	ldrh r0, [r4, #2]
	cmp r0, #2
	bne _02040704
	ldrh r0, [r4]
	bl sub_0204055C
	add r1, r0, #0
	ldr r0, [sp]
	bl FlagGet
	cmp r0, #0
	bne _02040704
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _02040704
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _02040704
	ldr r1, [r4, #8]
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _02040704
	ldr r0, [sp, #4]
	cmp r1, r0
	bgt _02040704
	ldrh r0, [r4]
	bl sub_02040578
	strb r0, [r5, #4]
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	sub r0, r1, r0
	strh r0, [r5]
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	strh r0, [r5, #2]
	add r5, r5, #6
_02040704:
	ldr r0, [sp, #0x20]
	add r7, r7, #1
	add r4, #0x14
	cmp r7, r0
	blt _020406B4
_0204070E:
	mov r2, #6
	add r0, r6, #0
	mul r0, r2
	ldr r1, [sp, #0x1c]
	mov r4, #0xff
	add r3, r1, r0
	strb r4, [r3, #4]
	sub r2, r2, #7
	strh r2, [r1, r0]
	strh r2, [r3, #2]
	add r0, r1, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02040614

	thumb_func_start RunPokemonCenterScriptsInNewContext
RunPokemonCenterScriptsInNewContext: ; 0x02040728
	ldr r3, _02040730 ; =sub_02040734
	mov r1, #0x96
	lsl r1, r1, #6
	bx r3
	.balign 4, 0
_02040730: .word sub_02040734
	thumb_func_end RunPokemonCenterScriptsInNewContext

	thumb_func_start sub_02040734
sub_02040734: ; 0x02040734
	push {r4, lr}
	bl CreateScriptContext
	add r4, r0, #0
_0204073C:
	add r0, r4, #0
	bl RunScriptCommand
	cmp r0, #1
	beq _0204073C
	add r0, r4, #0
	bl sub_02040044
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040734

	thumb_func_start sub_02040750
sub_02040750: ; 0x02040750
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r1, #0xac
	ldr r1, [r1]
	cmp r1, #0
	beq _02040764
	mov r0, #0
	pop {r3, r4, r5, pc}
_02040764:
	bl MapEvents_GetLoadedLevelScripts
	add r1, r0, #0
	bne _02040770
	mov r0, #0
	pop {r3, r4, r5, pc}
_02040770:
	cmp r4, #1
	bne _0204077E
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0204080C
	b _02040784
_0204077E:
	add r1, r4, #0
	bl _020407E4
_02040784:
	add r1, r0, #0
	ldr r0, _020407A8 ; =0x0000FFFF
	cmp r1, r0
	bne _02040790
	mov r0, #0
	pop {r3, r4, r5, pc}
_02040790:
	cmp r4, #1
	bne _0204079E
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FE74
	b _020407A4
_0204079E:
	add r0, r5, #0
	bl sub_02040734
_020407A4:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020407A8: .word 0x0000FFFF
	thumb_func_end sub_02040750

	thumb_func_start sub_020407AC
sub_020407AC: ; 0x020407AC
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	cmp r1, #0
	beq _020407BE
	mov r0, #0
	pop {r4, pc}
_020407BE:
	bl MapEvents_GetLoadedLevelScripts
	add r1, r0, #0
	bne _020407CA
	mov r0, #0
	pop {r4, pc}
_020407CA:
	add r0, r4, #0
	mov r2, #1
	bl sub_0204080C
	ldr r1, _020407E0 ; =0x0000FFFF
	cmp r0, r1
	beq _020407DC
	mov r0, #1
	pop {r4, pc}
_020407DC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020407E0: .word 0x0000FFFF
_020407E4:
	ldrb r2, [r0]
	cmp r2, #0
	bne _020407EE
	ldr r0, _02040808 ; =0x0000FFFF
	bx lr
_020407EE:
	cmp r2, r1
	bne _02040800
	ldrb r1, [r0, #1]
	ldrb r0, [r0, #2]
	lsl r0, r0, #8
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_02040800:
	add r0, r0, #5
	b _020407E4
	thumb_func_end sub_020407AC

	thumb_func_start sub_02040804
sub_02040804: ; 0x02040804
	bx lr
	nop
_02040808: .word 0x0000FFFF
	thumb_func_end sub_02040804

	thumb_func_start sub_0204080C
sub_0204080C: ; 0x0204080C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
_02040812:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0204081C
	ldr r0, _0204088C ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_0204081C:
	cmp r0, r2
	bne _02040838
	ldrb r0, [r4, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	lsl r1, r0, #0x18
	ldrb r0, [r4, #3]
	lsl r2, r2, #8
	add r2, r3, r2
	lsl r0, r0, #0x10
	add r0, r0, r2
	add r1, r1, r0
	add r0, r4, #5
	b _0204083C
_02040838:
	add r4, r4, #5
	b _02040812
_0204083C:
	cmp r1, #0
	bne _02040844
	ldr r0, _0204088C ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_02040844:
	add r4, r0, r1
_02040846:
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	lsl r0, r0, #8
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	bne _02040858
	ldr r0, _0204088C ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_02040858:
	ldrb r0, [r4, #3]
	ldrb r2, [r4, #2]
	lsl r0, r0, #8
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, #0
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl VarGet
	cmp r7, r0
	bne _02040886
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	lsl r0, r0, #8
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02040886:
	add r4, r4, #6
	b _02040846
_0204088A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204088C: .word 0x0000FFFF
	thumb_func_end sub_0204080C
