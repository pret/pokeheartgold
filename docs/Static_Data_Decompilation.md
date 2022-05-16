Static data is any variable that the compiler decides to permanently store in the ROM (usually ones marked with the `static` keyword in C). They get stored in the memory, and can be accessed anytime inside their scope.

In a DS ROM binary these variables are stored in three sections:
- .bss: static variables with no values when initialized (they take the value of 0 in startup)
Example: `static int a;`
- .data: static variables with a value when initialized. their value can change in runtime 
Example: `static int a = 23;`
- .rodata: static variables using the keyword `const` when initialized, they have a constant value that can't be changed.
Example: `static const int pi = 3.141592`

In the pokeheartgold repo, these sections have been split alongside the Assembly subroutines, with each .asm file only containing static data used by its functions.

### General workflow of decomping static data

1. See how the data is referenced inside functions. This will give you an idea of what the data type might be (e.g. a struct, or an u8 array).
Note: this can be tricky when looking at functions referencing a member of a struct from a struct array, as the assembly code might specify the struct's member before specifying the struct member
2. Draft the structure of the data (based on how it's manipulated in the subroutines), then migrate it over to C code.
3. Keep decompiling the data until there's none left in the .asm file.
4. If there are multiple .rodata variables, then you have to initialize them in the order they're stored in the ROM, which can be done by trial and error. Alternatively you can back up the `build/heartgold.us/main.nef.xMAP` file from your last matching build and look the data's address up inside it to find the order they're stored in.
