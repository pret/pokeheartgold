# Core functionality

DS Protect has two methods of antipiracy detection:

1. System info check. It will check the DS's MAC address and the system owner information for either of these situations:
	- A MAC address of `00:00:00:00:00:00` (indicating an emulator that is not emulating a MAC address at all)
	- A MAC address of `00:09:BF:00:00:31`, coupled with an owner birthday of 1/1 and an empty owner name (indicating the use of No$GBA)

2. ROM read check. It will conduct six reads of the cartridge ROM at these locations:
	- `0x1000 - 0x11FF`
	- `0x1200 - 0x13FF`
	- `0x1400 - 0x15FF`
	- `0x8000 - 0x81FF`
	- `0x8200 - 0x83FF`
	- `0x8400 - 0x85FF`
	
	Because a DS cartridge will redirect ROM reads below address `0x8000` to `0x8000 + (address & 0x1FF)`, the first four reads will all receive the same data. The last two reads, not receiving any redirection, will be different. A flashcart or low-effort reproduction cartridge meanwhile has no such behavior, and can read from any address. If the expected read pattern is not matched (`1 == 2 == 3 == 4` and `4 != 5 != 6`) it will report it is running on a flashcart.

3. Additionally, there is a third "dummy" method which does not actually do any antipiracy detection. This is apparently purely to confuse reverse engineering.

Note that modern emulators, such as [MelonDS](https://github.com/melonDS-emu/melonDS) and [DeSmuME](https://github.com/TASEmulators/desmume), correctly emulate both a MAC address and the ROM reading behavior and are therefore undetected by this library. Some flashcarts do correctly emulate the ROM reading behavior, but many still sold today do not.

## Exported functions

Each of the three methods exists as two copies, which are identical except for reversed return values. That is, there are six functions in total with these purposes:

- Detect flashcart
- Detect not flashcart
- Detect emulator
- Detect not emulator
- Detect dummy (always fails)
- Detect not dummy (always succeeds)

Each of these functions takes as argument an optional callback function, which will be run if the target detection succeeds. Meaning, `DetectFlashcart(callback)` will run the callback function only if a flashcart is detected. `DetectNotFlashcart(callback)` will inversely run the callback function only if a flashcart is *not* detected. They will also return `1` if the target detection succeeded, and `0` if it did not, regardless of whether a callback function was supplied.

## Obfuscation

The code has multiple layers of obfuscation present. Many of the core functions are written in convoluted ways intended to deter reverse engineering, and/or encrypted and accessible only through special decryption wrappers. Decryption wrappers will decrypt the function, run it with the specified arguments, re-encrypt the function (with a new key), and return. This is designed such that the raw code of the function spends as little time in RAM as possible.

Other functions are encoded using an unkeyed encoding scheme. These functions are decoded immediately upon being loaded, and remain decoded for as long as they remain in RAM. This is seemingly designed to deter reading dumps of the ROM.

Typically, a file will have some selected functions encrypted, then decryption wrappers are created for those functions, then those decryption wrappers are encoded, and included in the table to decode upon being loaded. Some functions are encoded directly without encryption, and other functions remain in plain code.

Values and references used throughout the file, such as sizes, keys, and function pointers, are often obfuscated by having other values added to them while they are at rest.

For technical details on the encoding and obfuscation, see [ENCODING.MD](./ENCODING.MD).

## Integrity

Before running any of the core check functions, it also conducts an integrity check of their decryption wrappers. It checks the first 16 bytes (4 instructions) of the code of the function against its own hardcoded record, and if it mismatches, it will automatically report that a flashcart or emulator was detected. There is no integrity check on the dummy detection functions.

## Dummy data

As a final trick, the library also includes 24 bytes of data designed to appear as instructions, but which are actually dummy garbage data. A reference to this data is held elsewhere to prevent it from being stripped out during linking, but it is not read from, written to, nor executed at any point.

## Note on language

The majority of the library is written in C, but the decryption wrappers and decoder initializers are written in assembly. For details about this, see [ASSEMBLY.MD](./ASSEMBLY.MD).
