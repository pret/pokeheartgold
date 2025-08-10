# Encoding and Obfuscation

## Values and references

Frequently throughout the library, values and references are obfuscated until their time of use.

For literal values, the value is obfuscated as:

```c
value + &BSS + 0x1300
```

where `&BSS` is the address of the start of the `.bss` region of library (where uninitialized data is stored). This obfuscation is likely intended to make values, such as a size of 140 bytes, appear to actually be addresses which point to some unknown location.

For references, the value is obfuscated as:

```c
reference + 0x1300
```

This is likely simply to obscure the actual value of the reference.

## Function encoding and encrypting

Used extensively by the library is the following function encoding scheme. It is designed to not fully scramble the instructions into apparent random noise, but rather to distort them into other, valid instructions such that a reverse engineer may not even realize they were encoded.

There are two types of function encoding: unkeyed and keyed (encryption).

Unkeyed encoding is decoded using a static initializer, which is run automatically as soon as the overlay is loaded. Therefore, for almost all of the time the library is loaded into RAM, the unkeyed encoding is already removed.

Keyed encoding, by contrast, is only removed immediately before the function is called, via a decryption wrapper function. Immediately after the function returns, it is re-encrypted using a new modified key. This new key is then written back into the decryption wrapper.

The included tool `elfcoder` is capable of both encoding and decoding, keyed and unkeyed, to this specification, as well as outputting an assembly file containing either the decryption wrappers or the static initializer decoder.

### Background

ARM instructions are 32 bits wide. This version of the library does not support Thumb.

When encoding and decoding, the most significant byte is treated separately from the three least-significant bytes, which are treated together as a single 24-bit unsigned integer.

As an example, the instruction:

```
08 50 80 E0    (add r5, r0, r8)
```

Would have a most significant byte of `0xE0`, and three least-significant bytes of `0x805008`.

The following instruction classification system, shared by both keyed and unkeyed encoding, will determine the exact nature of encoding the instruction will receive. The classification is based on the most significant byte of the instruction:

- If the most significant byte is `0xFA` or `0xFB`, it is a **type-1 instruction**. No valid instructions will match this.

- If the least significant nybble of the most significant byte is `0xB`, it is a **type-2 instruction**. This will match all branch and link (`bl`) instructions.

- If the least significant nybble of the most significant byte is `0xA`, it is a **type-3 instruction**. This will match all branch without link (`b`) instructions.

- If none of the other conditions matched, it is a **type-0 instruction**. This will match all instructions which are not branches, and therefore the majority of instructions.

The size of the function body as reported by the ELF symbol table is not the size used for encoding. Data at the foot of the instructions is left plain. To do this, the end of the function is scanned backwards for instructions that resemble `pop` or `bx`, and the first instance of this is demarcated as the end of the function. This is done during the original encoding processing stage, and the length of the function that was encoded is written into the decryption wrappers or decoding initializer (with obfuscation as discussed previously).

### Unkeyed encoding

For a **type-0** instruction:

- The most significant byte is exclusive-ored with the value `0xF0`.

- The three least significant bytes are split apart:

	- The least significant byte is exclusive-ored with the value `0x56`.
	- The second-least-significant byte is exclusive-ored with the value `0x65`.
	- The third-least-significant byte is exclusive-ored with the value `0x56`.

For both a **type-1** and **type-2** instruction:

- The most significant byte is exclusive-ored with the value `0x01`.

- The three least significant bytes are incremented by the value `0x4C2`.

- A relocation for this instruction has its addend incremented by `0x1300` (and subtraction by 8 removed).

For a **type-3** instruction:

- The most significant byte is exclusive-ored with the value `0x01`.

- The three least significant bytes are incremented by the value `0x1300`.

Note that, after encoding, a type-2 instruction becomes a type-3 instruction, and vice versa. This is due to flipping the branch link bit, which will change the instruction from a `b` to a `bl` and vice versa.

Type-0 and type-1 instructions will both remain so after encoding. This is fine for type-0 instructions, as their encoding procedure is its own inverse. However, type-1 instructions will not decode properly; and this may be intentional or an oversight as the upper byte of `0xFA` / `0xFB` would never appear in typical ARM instructions, nor appear as a result of encoding any typical ARM instructions.

Decoding applies the reverse procedure based on the new instruction type:

For a **type-0** instruction (this is the same as encoding):

- The most significant byte is exclusive-ored with the value `0xF0`.

- The three least significant bytes are split apart:

	- The least significant byte is exclusive-ored with the value `0x56`.
	- The second-least-significant byte is exclusive-ored with the value `0x65`.
	- The third-least-significant byte is exclusive-ored with the value `0x56`.

For both a **type-1** and **type-2** instruction:

- The most significant byte is exclusive-ored with the value `0x01`.

- The three least significant bytes are decremented by the value `0x1300`.


For a **type-3** instruction:

- The most significant byte is exclusive-ored with the value `0x01`.

- The three least significant bytes are decremented by the value `0x4C2`.

### Keyed encoding

A modified version of the RC4 stream cipher algorithm is used to generate pseudorandom bytes for keyed encoding.

The keyed encoding and decoding process for type-1, -2, and -3 instructions is identical to the unkeyed process. Only the process for **type-0** instructions differs:

- The most significant byte is left unmodified.

- The three least significant bytes are split apart:
	
	- The least significant byte is exclusive-ored with the next byte from the RC4 generator.
	- The second-least-significant byte is exclusive-ored with the next byte from the RC4 generator.
	- The third-least-significant byte is substituted via an [S-box](https://en.wikipedia.org/wiki/S-box). However, this S-box is very weak: `S[i] = i ⊕ 1`. It is unknown why this was implemented using an S-box instead of simply exclusive-oring the value `0x01` directly.

This process, as its own inverse, is identical for decoding.

### Encoding to instructions vs relocations

Note the association between the two values `0x1300` and `0x4C2`. When encoding, the addition of `0x1300` may be applied to the instruction directly, or to the relocation for that instruction. When the relocation is encoded this way and then applied to the instruction, the offset of `0x1300` bytes is converted into a offset of *instructions*, effectively dividing it by 4. ARM branches, like the ARM PC, are also always offset by 2: a branch of 0 (`EB000000`) is a jump forward by 8 bytes or 2 instructions (`bl #8`). So, when an addition of `0x1300` is applied from the relocation into the instruction, it is divided by 4 and then incremented by 2, resulting in an addition of `0x4C2` to the instruction.

Therefore, if the encoding procedure added `0x1300` to the *relocation*, the decoding procedure needs to subtract `0x4C2` from the instruction.

Meanwhile, if the encoding procedure added `0x1300` to the *instruction*, the decoding procedure needs to (obviously) subtract `0x1300` from the instruction.

*(In my opinion the smarter way to do this would have been to encode the relocation by incrementing it by `(0x1300 - 2) * 4 = 0x4BF8`, such that the resulting instruction would be incremented by `0x1300` and could then be decoded normally)*

### Encoding and linking

The encoding process has been specifically designed such that most instructions are encoded via exclusive-or, but branches are encoded using addition of a constant. The purpose of this is so the encoding can persist through linking.

For example, a function like this:

```c
void foo(void) {
    bar();
}
```

Might generate:

```
EB000000    bl  8     R_ARM_PC24:  bar-0x8
E12FFF1E    bx  lr
```

The resulting encoded instructions would then be:

```
EA0004C2    b   4880    R_ARM_PC24:  bar+0x1300
11799A48    cmnne sb, r8, asr #20
```

Where, as discussed in the previous section, incrementing the relocation by `0x1300` will increment the instruction by `0x4C2`.

Therefore, after the reference is linked and the relocation is applied, the branch destination can still be correctly decoded by subtracting `0x4C2`.

In hindsight this is obvious: in order to be able to encode, then link, then decode, the encoding/decoding procedure must be associative with linking. Linking uses addition modulo 2^24, and therefore encoding must also use addition modulo 2^24.

Note that non-relocated branches, such as ones generated by loops, do not actually need to be encoded this way.

## RC4

*See the [Wikipedia article on RC4](https://en.wikipedia.org/wiki/RC4) for background information on this algorithm.*

RC4 is initialized anew for each function that is being encoded, and bytes are generated by it as the instructions are encoded from top to bottom.

The authors have made one bizarre modification: during key scheduling, rather than counting the array `S` index `i` up from 0 to 255, it instead counts down from 255 to 0. Key indexing still starts at 0 and increments upwards normally.

The key size is always 128 bits.

### Key generation

The 128-bit RC4 key is derived from a 16-bit seed key, together with the size in bytes to be encrypted. This seed key is actually declared as 32 bits wide, however, in all instances, only 16-bit values are defined for it.

Four 32-bit values are generated as such:

```
expanded_key[0] := seed_key ⊕ size
expanded_key[1] := (seed_key <<< 8) ⊕ size
expanded_key[2] := (seed_key <<< 16) ⊕ size
expanded_key[3] := (seed_key <<< 24) ⊕ size
```

Where `⊕` represents exclusive-or and `<<<` represents a 32-bit bitwise left rotation.

The expanded key buffer is then treated as a little-endian array of 16 bytes, which makes up the resulting 128-bit key.

For example, a seed key of `0x6AB2` and a size of `0x68` would create the key:

```
DA 6A 00 00 68 B2 6A 00 68 00 B2 6A 02 00 00 B2
```

This key would then produce the RC4 keystream:

```
4E 73 C1 63 22 16 6E E5 FD B9 78 1F 11 AB 28 EB D3 19 D5 AC 6C 00 14 65 B7 1D 44 34 46 1D 85 44 ...
```

### Key changing

After each time a function is decrypted to be run, it is then re-encrypted using a new seed key. This new seed key is derived from the previous seed key:

```
new_seed_key = old_seed_key + (obfuscated_function_address >> 20) modulo 2^32
```

Where `obfuscated_function_address` is the function address of the target function that is to be encrypted, obfuscated by incrementation by `0x1300`, as described in the above reference obfuscation description.

Note most addresses are of the form `0x02XXXXXX`, which after a right shift of 20 bits would become `0x02X`, creating only a small actual change to the seed key.

This newly modified seed key is expanded into a 128-bit RC4 key as normal. It is also saved as the seed key (after obfuscating it via incrementing by `&BSS + 0x1300`) to be used for the next decryption of the function.

For example, if the library is conducting a ROM read test, it will perform 6 calls to the decryption wrapper function `RunEncrypted_ROMUtil_Read()`, which will change the key 6 times in total. If the original seed key is `0x0982`, and the address and size of the inner `ROMUtil_Read()` is `0x02260238` + `0x17C`, then the subsequent seed keys and expanded keys will be:

```
09A4    D8 08 00 00 7C A5 09 00 7C 01 A4 09 75 01 00 A4
09C6    BA 08 00 00 7C C7 09 00 7C 01 C6 09 75 01 00 C6
09E8    94 08 00 00 7C E9 09 00 7C 01 E8 09 75 01 00 E8
0A0A    76 0B 00 00 7C 0B 0A 00 7C 01 0A 0A 76 01 00 0A
0A2C    50 0B 00 00 7C 2D 0A 00 7C 01 2C 0A 76 01 00 2C
0A4E    32 0B 00 00 7C 4F 0A 00 7C 01 4E 0A 76 01 00 4E
...                           ...
```
