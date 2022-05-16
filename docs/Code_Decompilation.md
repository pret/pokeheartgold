Let's say you want to decompile `unk_02091278.s`:

```asm
#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start LanguageToDexFlag
LanguageToDexFlag: ; 0x02091278
	ldr r3, _02091290 ; =_02106058
	mov r2, #0
_0209127C:
	ldrb r1, [r3]
	cmp r0, r1
	beq _0209128A
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #6
	blt _0209127C
_0209128A:
	add r0, r2, #0
	bx lr
	nop
_02091290: .word _02106058
	thumb_func_end LanguageToDexFlag

	thumb_func_start sub_02091294
sub_02091294: ; 0x02091294
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _020912A0
	bl GF_AssertFail
_020912A0:
	ldr r0, _020912A8 ; =_02106058
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_020912A8: .word _02106058
	thumb_func_end sub_02091294

	.rodata

_02106058:
 	.byte 0x01, 0x02, 0x03, 0x05, 0x04, 0x07, 0x00, 0x00
```

Assembly files are divided into multiple parts:
- .text: Contains function definitions
- .rodata: Read Only Data- these are the same as consts in C
- .bss: Block Starting Symbol- these are statically allocated variables with no values on initilizarions
- .data: Data- these are statically allocated variables with a specific value on initializations

(See [Static Data Decompilation](Static_Data_Decompilation.md) for more info on data segments)

Functions are the most important part of decompiling any assembly file, so it's important to know how to translate the assembly into C

This can be done either using the ARM instruction set (as found in the source files) or THUMB instruction set (as used in decomp.me, compiler explorer, or when using the -t flag with asmdiff.sh)

Examples of both in use will be used to determine equivalent c code for the first function, LanguageToDexFlag

# ARM Instruction Set

```asm
    thumb_func_start LanguageToDexFlag
LanguageToDexFlag: ; 0x02091278
	ldr r3, _02091290 ; =_02106058
	mov r2, #0
_0209127C:
	ldrb r1, [r3]
	cmp r0, r1
	beq _0209128A
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #6
	blt _0209127C
_0209128A:
	add r0, r2, #0
	bx lr
	nop
_02091290: .word _02106058
	thumb_func_end LanguageToDexFlag
```

# Equivalent THUMB Instruction Set

```asm
LanguageToDexFlag:
 ldr	r3, [pc, #20]	; (18 <LanguageToDexFlag+0x18>)
 movs	r2, #0
 ldrb	r1, [r3, #0]
 cmp	r0, r1
 beq.n	<LanguageToDexFlag+0x12>
 adds	r2, r2, #1
 adds	r3, r3, #1
 cmp	r2, #6
 blt.n	<LanguageToDexFlag+0x4>
 adds	r0, r2, #0
 bx	lr
 nop			; (mov r8, r8)
 .word	_02106058
```

Our first step to decompilation is to gather information:
- We know that `_02106058` is a constant array of some sort since it's defined in .rodata, and that it's pointer (address in memory) is loaded into registry 3
- Since `ldrb` is used when accessing a value of r3, we can tell that it's an 8 bit type
- This array is being read in a loop, and it terminates after 6 elements have been read. Furthermore, `_02106058` only has 6 non-zero values, leading us to believe it's of size 6

So our first bit of C code may look something like this:

```c
extern const u8 _02106058[6];

void LanguageToDexFlag(void) {
    int c;
    for (c = 0; c < sizeof(_02106058); c++) {
        _02106058[c];
    }
}
```

Which is a great start!

Next, we can see that the value stored in `_02106058[c]` is being compared to some value in registry 0 that hasn't previously been defined.
When registries get used before they get defined, it's likely that they're passed in as parameters to the function. (Note that the stack pointer can also be used to pass parameters if registries aren't available.)
Since a u8 value is being compares to the value in r0, we can assume it's also of type u8 unless proven otherwise.

Now our code looks something like this:

```c
extern const u8 _02106058[6];

void LanguageToDexFlag(u8 unk) {
    int c;
    for (c = 0; c < sizeof(_02106058); c++) {
        if (_02106058[c] == unk) {
        
        }
    }
}
```

The final thing to note is that return values are loaded into r0 towards the end of the function. 
When a function returns a variable, that variable will ALWAYS be passed through this r0 directory, so it being set is a strong indicator that something gets returned.
In this scenario, the value of r2 gets loaded in if the loop either terminates by reaching the end or reaches a state where `_02106058[c] == unk`.

Knowing this, we can then finish off the function like so:

```c
extern const u8 _02106058[6];

int LanguageToDexFlag(u8 unk) {
    int c;
    for (c = 0; c < sizeof(_02106058); c++) {
        if (_02106058[c] == unk) {
            break;
        }
    }
    return c;
}
```

And voilà! Our first decompiled function! But don't stop here, because the next step will be documenting what that function does.

In scenarios where the function name or usage is NOT known, here are some ways to determine its functionality:
- Check the Platinum source code leak for similar code, since HGSS and Platinum are very similar
- Find where the function is called/what other functions the function calls to try and figure out what context it's used in
- Use identified/easily identifiable data to relate the function to sprites, dates, sounds, specific pokemon dex numbers, etc.

Do note that sometimes we mislabel things, so if something is identified, make sure the code logically does what we thought it did.

Luckily, someone else previously named this function and determined that it takes in a language argument and returns the dex flag associated with it, meaning we can determine the following:
- `u8 unk` is a variable denoting language
- `u8 unk` is compared to values in `_02106058`, meaning `_02106058` is likely an array of languages
- `int c` is the dex flag that gets returned

Running `grep LANGUAGE -r ./*` in the `include/` directory tells us that language constants are already defined in `config.h`:
```c
#define LANGUAGE_JAPANESE    1
#define LANGUAGE_ENGLISH     2
#define LANGUAGE_FRENCH      3
#define LANGUAGE_ITALIAN     4
#define LANGUAGE_GERMAN      5
#define LANGUAGE_SPANISH     7
```

Also luckily, these seem to line up well with the values in `_02106058`, so we can transcribe the array from .rodata to our .c file like so:

```c
#include "config.h"

const u8 Languages[] = {
    LANGUAGE_JAPANESE, 
    LANGUAGE_ENGLISH, 
    LANGUAGE_FRENCH, 
    LANGUAGE_GERMAN, 
    LANGUAGE_ITALIAN, 
    LANGUAGE_SPANISH
};
```
(note that values in .rodata will need to be in the EXACT order as listed when transfering to c)

And after updating our main function, our final c file for this function should look like this:

```c
#include "config.h"

const u8 Languages[] = {
    LANGUAGE_JAPANESE, 
    LANGUAGE_ENGLISH, 
    LANGUAGE_FRENCH, 
    LANGUAGE_GERMAN, 
    LANGUAGE_ITALIAN, 
    LANGUAGE_SPANISH
};

int LanguageToDexFlag(u8 language) {
    int dexFlag;
    for (dexFlag = 0; dexFlag < 6; dexFlag++) {
        if (language == Languages[dexFlag]) {
            break;
        }
    }
    return dexFlag;
}
```

And there we go! A breakdown of what typically goes into decompiling a function.

In order to gain experience for both decompiling and identifying functions, you should try to decompile `sub_02091294`, the other function in `unk_02091278.s`
Knowing that `bl GF_AssertFail` will call the function GF_AssertFail(), you have all the information you need to do this.

If you're confused about what an instructions means, Google or any other search engine are your friends. 
Don't be afraid to ask for help in the #asm2c-help channel either, just make sure to provide your code when you do.

And if you use decomp.me to work in, please remember to include `#pragma thumb on` at the top of your code, as otherwise you will be comparing an ARM instruction set to decomp.me's THUMB target
(See [How to see nonmatching code sections](How_to_see_nonmatching_code_sections.md) for more info)