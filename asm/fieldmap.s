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
_020FAC94:
	.byte 0x03, 0x19, 0x0D, 0x06, 0x04, 0x0D, 0x1F, 0x02
_020FAC9C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00
_020FACB0:
	.byte 0x14, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00
_020FACC4:
	.byte 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07
	.byte 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07
_020FACDC:
	.byte 0x00, 0x30, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x00, 0x00, 0xD0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x04, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00
gScriptCmdTable:
	.word sub_02040890
	.word sub_02040894
	.word sub_02040898
	.word sub_020408A4
	.word sub_02040918
	.word sub_02040930
	.word sub_0204094C
	.word sub_02040968
	.word sub_02040980
	.word sub_0204099C
	.word sub_020409BC
	.word sub_020409E8
	.word sub_02040A18
	.word sub_02040A40
	.word sub_02040A68
	.word sub_02040A90
	.word sub_02040AAC
	.word sub_02040ACC
	.word sub_02040AF8
	.word sub_02040B30
	.word sub_02040B68
	.word sub_02040BFC
	.word sub_02040C2C
	.word sub_02040C44
	.word sub_02040C7C
	.word sub_02040CAC
	.word sub_02040CE0
	.word sub_02040CF8
	.word sub_02040D04
	.word sub_02040D38
	.word sub_02040D6C
	.word sub_02040D84
	.word sub_02040D9C
	.word sub_02040DF4
	.word sub_02040E1C
	.word sub_02040DB8
	.word sub_02040E44
	.word sub_02040E68
	.word sub_02040E8C
	.word sub_02040EB4
	.word sub_02040EE4
	.word sub_02040F14
	.word sub_02040F38
	.word sub_02040F68
	.word ov01_021EF050
	.word ov01_021EF31C
	.word ov01_021EF35C
	.word ov01_021EF3E0
	.word sub_02040F94
	.word sub_02040FF0
	.word sub_02041064
	.word sub_020410E0
	.word sub_02041110
	.word sub_02041168
	.word sub_020411A4
	.word sub_02041328
	.word sub_020413D4
	.word sub_02041410
	.word sub_0204142C
	.word sub_0204146C
	.word sub_020415C4
	.word sub_02041674
	.word sub_020411D8
	.word sub_02041684
	.word sub_020417EC
	.word sub_02041808
	.word sub_02041824
	.word sub_02041890
	.word sub_02041950
	.word sub_0204196C
	.word sub_02041988
	.word sub_020419E8
	.word sub_02041A98
	.word sub_02049228
	.word sub_02049244
	.word sub_02049260
	.word sub_020492A0
	.word sub_020492E0
	.word sub_02049304
	.word sub_02049320
	.word sub_02049134
	.word sub_02049144
	.word sub_02049158
	.word sub_02049170
	.word sub_02049188
	.word sub_020491C4
	.word sub_020491E8
	.word sub_02049204
	.word sub_02049214
	.word sub_02049344
	.word sub_0204937C
	.word sub_020493B4
	.word sub_020493C0
	.word sub_020493D4
	.word sub_02041B04
	.word sub_02041C98
	.word sub_02041D40
	.word sub_02041F50
	.word sub_02041F60
	.word sub_02041F8C
	.word sub_02041FB8
	.word sub_02042000
	.word sub_02042034
	.word sub_020420CC
	.word sub_0204219C
	.word sub_020422B4
	.word sub_020422F8
	.word sub_02042394
	.word sub_02042478
	.word sub_020424AC
	.word sub_0204CA50
	.word sub_0204CA74
	.word sub_0204CAC8
	.word ov01_02203138
	.word ov01_02203188
	.word ov01_022031A0
	.word ov20_022598C0
	.word ov22_0225991C
	.word ov22_02259934
	.word ov22_02259960
	.word ov22_0225998C
	.word ov22_022599B8
	.word ov22_02259ADC
	.word ov22_02259B08
	.word ov22_02259B34
	.word sub_0204E9D8
	.word sub_0204EA30
	.word sub_0204EA88
	.word sub_0204EAE0
	.word sub_0204EB7C
	.word sub_0204EBB0
	.word sub_02043964
	.word ov01_021EF41C
	.word ov01_02202674
	.word ov01_022026B4
	.word ov01_0220271C
	.word sub_02042530
	.word sub_0204D088
	.word sub_0204D248
	.word sub_0204D2D0
	.word sub_0204D328
	.word sub_0204D3CC
	.word sub_020428D8
	.word sub_020431E4
	.word sub_02046F34
	.word sub_02046F6C
	.word sub_02046FC8
	.word sub_02046FFC
	.word sub_020472C4
	.word sub_020472E8
	.word sub_02042A10
	.word sub_02042AB0
	.word sub_02042AC0
	.word sub_02042ACC
	.word sub_02042D00
	.word sub_02042D58
	.word sub_02042E48
	.word sub_02042E5C
	.word sub_02042F04
	.word sub_02042F5C
	.word sub_02042F78
	.word sub_02042F88
	.word sub_02042F98
	.word sub_02042FC4
	.word sub_02042FDC
	.word sub_02043044
	.word sub_020430A4
	.word sub_020430C4
	.word sub_02049460
	.word sub_0204952C
	.word sub_0204959C
	.word sub_020495C4
	.word sub_020431B4
	.word sub_02043214
	.word sub_02043400
	.word sub_02043448
	.word sub_0204346C
	.word sub_020435E8
	.word sub_02043618
	.word sub_02043648
	.word sub_02043678
	.word sub_020436C4
	.word sub_020436F4
	.word sub_02043724
	.word sub_020437B4
	.word sub_020437E4
	.word sub_02043884
	.word sub_0204389C
	.word sub_020438C4
	.word sub_020438DC
	.word sub_02048414
	.word sub_02048448
	.word sub_0204846C
	.word sub_02048490
	.word sub_02048510
	.word sub_02048548
	.word sub_02048580
	.word sub_020485BC
	.word sub_020485F4
	.word sub_020486F0
	.word sub_02048794
	.word sub_020487CC
	.word sub_02048818
	.word sub_020488A4
	.word sub_020488F4
	.word sub_02048944
	.word sub_02043938
	.word sub_02048994
	.word sub_020489CC
	.word sub_020489F4
	.word sub_02048A1C
	.word sub_020438EC
	.word sub_02049618
	.word sub_02049648
	.word sub_02043990
	.word sub_02049750
	.word sub_020497D8
	.word sub_02049860
	.word sub_02049894
	.word sub_020498C8
	.word sub_020498D4
	.word sub_02049904
	.word sub_02049980
	.word sub_020499AC
	.word sub_020499D8
	.word sub_02049A00
	.word sub_02043A28
	.word sub_02043AC0
	.word sub_02043B58
	.word sub_02043B64
	.word sub_02043B70
	.word sub_02043BA0
	.word sub_0206BB2C
	.word sub_0206BB5C
	.word sub_0206BBAC
	.word sub_0206BC2C
	.word sub_0206BC64
	.word sub_0206BC8C
	.word sub_0204DB3C
	.word sub_0204DBA0
	.word sub_02043BA4
	.word sub_02043C24
	.word sub_02043C54
	.word sub_02043CB4
	.word sub_02043CE4
	.word sub_02043D14
	.word sub_02043D44
	.word sub_02043D74
	.word sub_02043D78
	.word sub_02043E08
	.word sub_02043F0C
	.word sub_02043F48
	.word sub_02043F54
	.word sub_02043F70
	.word sub_02043FC4
	.word sub_02042DC0
	.word sub_02042DFC
	.word sub_02044024
	.word sub_02044070
	.word sub_0204407C
	.word sub_020440AC
	.word sub_020440E4
	.word sub_0204435C
	.word sub_0204436C
	.word sub_02044124
	.word sub_02044190
	.word sub_020441A0
	.word sub_020441D8
	.word sub_02044270
	.word sub_020442FC
	.word sub_02044348
	.word sub_02044380
	.word sub_020443BC
	.word sub_02044418
	.word sub_020442AC
	.word sub_02048060
	.word sub_02048158
	.word sub_02048194
	.word sub_020481DC
	.word sub_020445C0
	.word sub_020445CC
	.word sub_020445F8
	.word sub_02044628
	.word sub_02044640
	.word sub_0204468C
	.word sub_0204469C
	.word sub_02044480
	.word sub_02044490
	.word sub_020444CC
	.word sub_0204458C
	.word sub_0204E610
	.word sub_0204E640
	.word sub_0204E654
	.word sub_0204E684
	.word sub_0204E6A0
	.word sub_0204E6E8
	.word sub_0204E748
	.word sub_0204E71C
	.word sub_0204E774
	.word sub_0204E788
	.word sub_0204E7B4
	.word sub_0204E7C8
	.word sub_0204E838
	.word sub_0204E864
	.word sub_0204E878
	.word sub_0204E88C
	.word sub_0204E8B8
	.word sub_02044954
	.word sub_020449AC
	.word sub_020449C4
	.word sub_020449DC
	.word sub_020449F4
	.word sub_0204CB5C
	.word sub_0204CB7C
	.word sub_02044A0C
	.word sub_02044A1C
	.word sub_02044A44
	.word sub_02044A6C
	.word sub_02044AA8
	.word sub_02044AB8
	.word sub_02044AE0
	.word sub_02044AF0
	.word sub_02044B10
	.word sub_02044B40
	.word sub_02044B50
	.word sub_02044B60
	.word sub_02044B70
	.word sub_02044B80
	.word sub_02044B9C
	.word sub_02044BB8
	.word sub_02044BC8
	.word sub_02044BD8
	.word sub_0204D95C
	.word sub_020430D4
	.word sub_02043124
	.word sub_020446AC
	.word sub_02048A7C
	.word sub_02048AF4
	.word sub_020446EC
	.word sub_0204473C
	.word sub_020447CC
	.word sub_02044804
	.word sub_0204483C
	.word sub_0204488C
	.word sub_020448DC
	.word sub_02041728
	.word sub_02041758
	.word sub_02044928
	.word sub_02041018
	.word sub_02042574
	.word sub_020425D4
	.word sub_020425F8
	.word sub_02042860
	.word sub_0204280C
	.word sub_0204D180
	.word sub_0204D1DC
	.word sub_0204D988
	.word sub_0204D9E0
	.word sub_0204DA68
	.word sub_0204DAE4
	.word sub_0204CA98
	.word sub_0204CBF8
	.word sub_02045394
	.word sub_020453D0
	.word sub_0204D154
	.word sub_0204CBAC
	.word sub_0204CBC4
	.word sub_0204CC58
	.word sub_0204CB0C
	.word sub_02044C54
	.word sub_02043164
	.word sub_0204CCAC
	.word sub_0204CCFC
	.word sub_0204CD34
	.word sub_02044C64
	.word sub_02044C98
	.word sub_02044CCC
	.word sub_02044CFC
	.word sub_02044D28
	.word sub_02044D68
	.word sub_02044D8C
	.word sub_02044DC4
	.word sub_0204D6C0
	.word sub_0204D708
	.word sub_0204D7D8
	.word sub_0204CD74
	.word sub_0204236C
	.word sub_0204CE00
	.word sub_0204CE30
	.word sub_0204DF54
	.word ov20_02259A88
	.word ov20_02259B40
	.word ov20_02259BF4
	.word ov20_02259B88
	.word sub_0204EBE8
	.word sub_0204EC30
	.word sub_0204DBE8
	.word sub_0204DC90
	.word sub_0204DCD4
	.word sub_02048B64
	.word sub_0204E8CC
	.word sub_0204E928
	.word sub_0204E980
	.word sub_02044DFC
	.word sub_02044E40
	.word sub_02044E9C
	.word sub_02044F00
	.word sub_02044F30
	.word sub_02042E8C
	.word sub_02049CD8
	.word sub_02049CA8
	.word sub_02049CE8
	.word sub_02049D04
	.word sub_02049FC8
	.word sub_0204A048
	.word sub_0204A070
	.word sub_0204A098
	.word sub_0204A184
	.word sub_0204A230
	.word sub_0204A27C
	.word sub_02045040
	.word sub_02045060
	.word sub_020450B8
	.word sub_02044F74
	.word sub_02044FAC
	.word sub_02044FE4
	.word sub_0204DD34
	.word sub_02045028
	.word sub_0204DEE4
	.word ov20_022598C0
	.word sub_02047060
	.word sub_020470F4
	.word ov21_0225990C
	.word ov21_02259960
	.word sub_0204D4D0
	.word sub_0204D48C
	.word sub_02042A20
	.word sub_02040900
	.word ov01_021EF064
	.word ov01_021EF0A4
	.word ov01_021EF0F0
	.word ov01_021EF154
	.word ov01_021EF194
	.word ov01_021EF1E0
	.word ov01_021EF268
	.word sub_02043548
	.word sub_02043574
	.word sub_02045188
	.word sub_020434DC
	.word sub_02043538
	.word sub_02042E2C
	.word sub_02042AFC
	.word sub_02042B1C
	.word sub_02042C2C
	.word sub_02042CA8
	.word ov01_021EF488
	.word sub_0204523C
	.word sub_0204D5C0
	.word sub_0204D634
	.word sub_02045230
	.word sub_02047120
	.word sub_02047168
	.word sub_0204720C
	.word sub_02045254
	.word sub_02045264
	.word sub_02049A6C
	.word sub_0204EC7C
	.word sub_0204ED3C
	.word sub_0204ED7C
	.word sub_0204EDDC
	.word sub_0204527C
	.word sub_020452B0
	.word sub_020452E0
	.word sub_02045340
	.word sub_02045374
	.word sub_02045428
	.word sub_0204542C
	.word sub_02045440
	.word sub_0204E150
	.word sub_0204E1C4
	.word sub_0204E26C
	.word sub_0204E2D8
	.word sub_02048BCC
	.word sub_020454A4
	.word sub_02045540
	.word sub_02045568
	.word sub_02040894
	.word sub_02045588
	.word sub_020455B0
	.word sub_0204BDA4
	.word sub_0204EE20
	.word sub_0204EE38
	.word sub_020432FC
	.word sub_0204335C
	.word sub_020433BC
	.word sub_020455F0
	.word sub_0204D8A0
	.word sub_0204D8F0
	.word sub_0204560C
	.word sub_020456D8
	.word sub_02045780
	.word sub_0204579C
	.word sub_020457B8
	.word sub_02048EE0
	.word sub_02048F10
	.word sub_0204908C
	.word sub_02048738
	.word sub_0204583C
	.word sub_0204C874
	.word sub_0204C8D4
	.word sub_0204C91C
	.word sub_0204C9C0
	.word sub_02045868
	.word sub_0204588C
	.word sub_020458A4
	.word sub_020458CC
	.word sub_02048B2C
	.word sub_020458EC
	.word sub_0204592C
	.word sub_020459AC
	.word sub_02045A60
	.word sub_02045A74
	.word sub_02045A88
	.word sub_02045AAC
	.word sub_02045B40
	.word sub_02045BA4
	.word sub_02045BCC
	.word ov01_021EF2E0
	.word sub_02045C64
	.word sub_0204D8C8
	.word sub_02045C84
	.word sub_02045CC4
	.word ov22_02259A10
	.word ov22_02259A9C
	.word sub_02045CFC
	.word sub_0204D564
	.word sub_02045D28
	.word sub_02045D6C
	.word sub_02045D7C
	.word sub_02045E1C
	.word sub_02045DE8
	.word sub_0204863C
	.word sub_0204D840
	.word sub_02045E54
	.word sub_020493E4
	.word sub_02045EA8
	.word sub_02045ED8
	.word sub_02042BAC
	.word sub_02042C44
	.word sub_02042C5C
	.word sub_02045F18
	.word sub_02045F80
	.word sub_02045FC4
	.word sub_02046038
	.word sub_0204A2EC
	.word sub_0204A31C
	.word sub_0204A360
	.word sub_0204A3A4
	.word sub_02044534
	.word sub_0204184C
	.word sub_02046078
	.word ov01_02201A50
	.word sub_020496DC
	.word sub_02041B74
	.word sub_02046108
	.word sub_02046130
	.word sub_020425A4
	.word sub_0204E5BC
	.word sub_0204615C
	.word ov22_022599E4
	.word ov22_02259A50
	.word sub_020461A0
	.word ov01_02202648
	.word sub_02046290
	.word sub_020424E8
	.word sub_0204910C
	.word sub_020462A8
	.word sub_020462D8
	.word sub_020462E4
	.word sub_020462F0
	.word sub_02048C10
	.word sub_02041E84
	.word sub_02046300
	.word sub_02046360
	.word sub_0204E338
	.word sub_020418DC
	.word sub_02044230
	.word sub_02044674
	.word sub_02049950
	.word sub_02043E5C
	.word sub_0204639C
	.word sub_02043870
	.word ov01_021EF398
	.word sub_020463C4
	.word sub_020463F4
	.word sub_02046420
	.word sub_02046B1C
	.word sub_02046B48
	.word sub_02046B64
	.word sub_02046BB4
	.word sub_02046BC4
	.word sub_02046BDC
	.word sub_02046CB4
	.word sub_02046CF0
	.word sub_02046D10
	.word sub_02046D5C
	.word sub_02046DA8
	.word sub_02046DF8
	.word sub_02046E38
	.word sub_02046E5C
	.word sub_02046E80
	.word sub_02046E9C
	.word sub_02045310
	.word sub_0204723C
	.word sub_0204727C
	.word sub_02047304
	.word sub_0204731C
	.word sub_02047348
	.word ov01_02202308
	.word sub_0204E7DC
	.word sub_0204E808
	.word sub_02047358
	.word sub_020473D8
	.word sub_0204BC98
	.word sub_0204BCCC
	.word sub_0204BD04
	.word sub_02048C80
	.word sub_02046438
	.word sub_0204EE50
	.word sub_020432A0
	.word sub_020432CC
	.word sub_020464E0
	.word sub_0204DFE4
	.word sub_0204EF40
	.word sub_0204F1AC
	.word sub_02042644
	.word sub_0204F174
	.word sub_0204F8DC
	.word sub_0204FAD4
	.word sub_020426C4
	.word sub_0204F9DC
	.word sub_02043FEC
	.word sub_02043FFC
	.word sub_0204FE78
	.word sub_02050014
	.word sub_02042768
	.word sub_0204FF78
	.word sub_0204E0BC
	.word ov01_02200AF0
	.word sub_02046554
	.word sub_02046584
	.word sub_020465A0
	.word ov01_02202B00
	.word ov01_02202E68
	.word ov01_02202B78
	.word ov01_02202BD0
	.word ov01_02202C28
	.word ov01_022011D4
	.word sub_020483D8
	.word ov01_02201424
	.word sub_02048C48
	.word sub_0204869C
	.word sub_020465FC
	.word sub_02046674
	.word sub_02049418
	.word sub_0204941C
	.word sub_02049440
	.word sub_020466A8
	.word sub_020484D8
	.word sub_0204EB38
	.word ov01_02201594
	.word ov01_0220178C
	.word ov01_022017DC
	.word sub_020466E0
	.word ov01_02201470
	.word ov01_02201518
	.word ov01_02201844
	.word sub_02041A48
	.word sub_02042110
	.word sub_02042184
	.word sub_020468F4
	.word sub_02042CE0
	.word sub_02046914
	.word sub_02049A44
	.word sub_02042948
	.word sub_02044BE8
	.word sub_02043EB8
	.word sub_02045818
	.word sub_0204E3CC
	.word ov01_02201304
	.word sub_0204CFB8
	.word sub_02046970
	.word sub_0204F500
	.word sub_0204F6D0
	.word sub_0204F778
	.word sub_02041A0C
	.word sub_020469B4
	.word sub_0204F7FC
	.word sub_02046A1C
	.word ov01_0220188C
	.word ov01_0220192C
	.word sub_0204E470
	.word ov01_0220197C
	.word ov01_02201990
	.word sub_0204512C
	.word sub_02045160
	.word sub_02043008
	.word ov01_022019B0
	.word ov01_022019F0
	.word ov01_02201A40
	.word ov03_02256B88
	.word sub_02047414
	.word sub_02047424
	.word sub_0204749C
	.word ov01_02201B14
	.word sub_0204CE60
	.word ov03_0225894C
	.word ov03_02258978
	.word ov03_02258998
	.word ov03_022589D4
	.word ov03_02258A18
	.word ov03_02258BDC
	.word sub_020474D8
	.word sub_02047518
	.word ov01_02201B40
	.word ov01_02201C08
	.word ov01_02201C60
	.word sub_02047570
	.word sub_0204759C
	.word sub_020475C0
	.word sub_020475F0
	.word sub_02047634
	.word sub_02047644
	.word sub_02047664
	.word sub_0204769C
	.word ov01_02201C70
	.word ov01_02201C9C
	.word ov01_02201CB4
	.word ov01_02201CE0
	.word ov01_02201D1C
	.word ov01_02201D4C
	.word ov01_02201DA4
	.word ov01_02203094
	.word ov01_02201F10
	.word ov01_02201F30
	.word ov01_02202480
	.word sub_020476B4
	.word sub_0204771C
	.word sub_02047790
	.word sub_020477F8
	.word sub_02047814
	.word sub_02047830
	.word sub_02047888
	.word sub_02047AE8
	.word sub_02047B38
	.word sub_02047B5C
	.word sub_02047B6C
	.word sub_02047B7C
	.word sub_02047B8C
	.word sub_02047BA4
	.word sub_02047BB4
	.word sub_02047BC4
	.word sub_02047BDC
	.word sub_02047BF4
	.word sub_02047C04
	.word sub_02047C14
	.word sub_02047C24
	.word sub_02047C34
	.word sub_02047C44
	.word sub_02047C54
	.word ov01_0220205C
	.word sub_02048218
	.word sub_02048298
	.word sub_02047558
	.word ov01_02201A18
	.word ov01_02201AB8
	.word ov01_022020CC
	.word ov01_022021AC
	.word ov01_022021F8
	.word ov01_0220233C
	.word ov01_02202430
	.word sub_0204DDE4
	.word sub_0204812C
	.word sub_02047C64
	.word sub_02047C80
	.word ov01_02202930
	.word ov01_02202980
	.word ov01_022029B0
	.word ov01_02202A28
	.word ov01_02202A70
	.word ov01_02202ABC
	.word ov03_02258C00
	.word ov03_02258CDC
	.word sub_02047964
	.word sub_02047CBC
	.word ov01_02205164
	.word ov01_022051B4
	.word ov01_022051CC
	.word sub_02047CFC
	.word sub_02047D24
	.word sub_02047D58
	.word sub_02047D7C
	.word sub_02047DB0
	.word sub_02047DC8
	.word sub_02046FAC
	.word sub_02047E14
	.word sub_02047E20
	.word sub_0206DC50
	.word ov01_022053EC
	.word ov25_02259A30
	.word sub_02047E30
	.word ov01_022024B8
	.word ov01_022024FC
	.word sub_0204C83C
	.word sub_02047E40
	.word sub_02047778
	.word sub_02047E54
	.word sub_02047E64
	.word sub_02047E7C
	.word sub_02047E8C
	.word sub_02047E9C
	.word ov01_02202510
	.word sub_02047EB4
	.word sub_02047EC4
	.word sub_02047F14
	.word ov01_022025A8
	.word ov01_022025EC
	.word sub_0204E4E0
	.word sub_0204E528
	.word sub_02047F54
	.word sub_02047F84
	.word sub_02047FB4
	.word sub_02047FD4
	.word sub_02048004
	.word sub_020482F4
	.word sub_0204839C
	.word ov01_02202834
	.word sub_0204802C
	.word sub_02047A7C
	.word ov01_02202908
	.word sub_02043598
	.word sub_02041AC4
	.word sub_02041AE4
	.word sub_02048CBC
	.word sub_02048CF4
	.word sub_02048D2C
	.word sub_02048D74
	.word sub_02048DBC
	.word sub_02048DF0
	.word sub_02048E28
	.word sub_02048E60
	.word sub_02048E98
	.word sub_02048EB8

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
	bl sub_020401B4
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
	mov r0, #0xc
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

	thumb_func_start sub_020401B4
sub_020401B4: ; 0x020401B4
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
	thumb_func_end sub_020401B4

	thumb_func_start sub_020402F0
sub_020402F0: ; 0x020402F0
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
	bl sub_020401B4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040318: .word 0x0003643F
	thumb_func_end sub_020402F0

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
	bl sub_020402F0
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

	thumb_func_start sub_020403C0
sub_020403C0: ; 0x020403C0
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
	thumb_func_end sub_020403C0

	thumb_func_start sub_020403D8
sub_020403D8: ; 0x020403D8
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
	thumb_func_end sub_020403D8

	thumb_func_start sub_020403FC
sub_020403FC: ; 0x020403FC
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	add r1, r4, #0
	bl CheckFlagInArray
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020403FC

	thumb_func_start sub_02040410
sub_02040410: ; 0x02040410
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	add r1, r4, #0
	bl SetFlagInArray
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040410

	thumb_func_start sub_02040424
sub_02040424: ; 0x02040424
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl SavArray_Flags_get
	add r1, r4, #0
	bl ClearFlagInArray
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040424

	thumb_func_start sub_02040438
sub_02040438: ; 0x02040438
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
	thumb_func_end sub_02040438

	thumb_func_start sub_02040470
sub_02040470: ; 0x02040470
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
	thumb_func_end sub_02040470

	thumb_func_start sub_02040490
sub_02040490: ; 0x02040490
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x2a
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020402F0
	strh r4, [r0]
	add r0, r5, #0
	mov r1, #0x2b
	bl sub_020402F0
	strh r6, [r0]
	add r0, r5, #0
	mov r1, #0x2c
	bl sub_020402F0
	strh r7, [r0]
	add r0, r5, #0
	mov r1, #0x2d
	bl sub_020402F0
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

	thumb_func_start sub_02040514
sub_02040514: ; 0x02040514
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
	thumb_func_end sub_02040514

	thumb_func_start sub_0204052C
sub_0204052C: ; 0x0204052C
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
	thumb_func_end sub_0204052C

	thumb_func_start sub_02040544
sub_02040544: ; 0x02040544
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
	thumb_func_end sub_02040544

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
	bl sub_020401B4
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x2b
	bl sub_020401B4
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2c
	bl sub_020401B4
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
	bl sub_020403FC
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
