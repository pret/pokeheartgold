Figuring out compiled structs is difficult because in 90% of the cases the structs compile into dynamic stack allocations. And the only way you can figure out their exact structure is from context.

### How structs work in compiled code

During runtime, members of a struct are stored right next to each other in memory (specifically in the stack). When a function wants to access a member of this struct they do this by getting the address of the first member and adding an offset to it. then using a variant of the `ldr` opcode to load the content of the member:
- `ldrb r0 [r0+<offset>]` loads a byte member of a struct into r0 (`ldrsb` if it's a signed byte)
- `ldrh r0 [r0+<offset>]` loads a halfword (2 bytes) member of a struct into r0 (`ldrsh` if it's a signed halfword)
- `ldr r0 [r0+<offset>]` loads a word (4 bytes) member of a struct into r0 (`ldrs` if it's a signed word)

The same thing happens when functions want to store a value inside a struct member:
- `strb r0 [r0+<offset>]` stores r0 into a byte member of a struct
- `strh r0 [r0+<offset>]` stores r0 a halfword (2 bytes) member of a struct 
- `str r0 [r0+<offset>]` stores r0 into a word (4 bytes) member of a struct 

Using this context you can write what you think might be a struct and fill it in with context later.

### Example of struct decompilation
Let's say we want to decompile `sub_02092F64`:

```asm
thumb_func_start sub_02092F64
sub_02092F64: ; 0x02092F64
	push {r4, lr}
	mov r1, #0
	add r4, r0, #0
	bl sub_02093010
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldrb r2, [r4]
	mov r1, #1
	bic r2, r1
	strb r2, [r4]
	ldrb r2, [r4]
	mov r1, #2
	bic r2, r1
	strb r2, [r4]
	ldrb r2, [r4]
	mov r1, #8
	bic r2, r1
	strb r2, [r4]
	mov r1, #0xff
	strb r1, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #7]
	strb r1, [r4, #0x1c]
	mov r0, #0x32
	strh r0, [r4, #0x12]
	pop {r4, pc}
thumb_func_end sub_02092F64
```

This function takes in a single parameter, uses it to load multiple different things, and at different offsets. So r0 is most likely a pointer to a typedef struct.
Let's look at the offsets for storing and loading opcodes and write a dummy struct.

```c
typedef struct UnkStruct {
	//0x00
	//0x02
	//0x03
	//0x04
	//0x07
	//0x08
	//0x12
	//0x14
	//0x18
	//0x1c
} UnkStruct; //size: 0x1d
```

We can use the difference between offsets to figure out the type of the members, filling in any remaining gaps with "filler" members. (Keep in mind that a type like u64 is actually 64 bits, aka 8 bytes. and the hex offsets are in bytes)

```c
typedef struct UnkStruct{
	u16 unk00; //0x00
	u8 unk02; //0x02
	u8 unk03; //0x03
	u8 unk04; //0x04
	u8 filler_05[2];
	u8 unk07; //0x07
	u8 unk08; //0x08
	u8 filler_09[10];
	u16 unk12; //0x12
	u32 unk14; //0x14
	u64 unk18; //0x18
	u8 unk1c; //0x1c
} UnkStruct; //size: 0x1d
```

With that done, let's decompile `sub_02092F64` to see if we'll gain any more context for the struct:

```c
void sub_02092F64(Unk_Struct* ptr) {
	sub_02093010(ptr, 0);
	ptr->unk08 = 0;
	ptr->unk14 = 0;
	ptr->unk18 = 0;
	ptr->unk00 &= 1;
	ptr->unk00 &= 2;
	ptr->unk00 &= 8;
	ptr->unk02 = 0xff;
	ptr->unk03 = 0;
	ptr->unk04 = 0;
	ptr->unk07 = 0;
	ptr->unk1c = 0xff;
	ptr->unk12 = 50;
}
```

The multiple ANDs on unk00 with multiple powers of 2 show that it's a bitfield, so we have to update our struct and function:

```diff
typedef struct Unk_Struct{
- u16 unk00; //0x00
+ u16 unk00_0:1; //0x00
+ u16 unk00_1:1;
+ u16 unk00_2:1;
+ u16 unk00_3:13;
u8 unk02; //0x02
```

```diff
    ptr->unk18 = 0;
-   ptr->unk00 |= 1;
+   ptr->unk00_0 = 0;
-   ptr->unk00 |= 2;
+   ptr->unk00_1 = 0;
-   ptr->unk00 |= 8;
+   ptr->unk00_2 = 0;
    ptr->unk02 = 0xff;
```
That's all the context we can get regarding `Unk_Struct` from `sub_02092F64`!

### Some tips for decompiling structs
- Try to decompile as many functions involved with your structs as possible. The more context you have the more you can decompile and identify the structs.
- Giving your structs generic names such as `Unk_Struct` can make them conflict with the rest of the repo. Try appending the size of the struct to the name as well as some context to avoid that (such as `Unk_FsysSub_Struct_1C`).
- Always check the type of the struct members as you fill out your struct. An u32 might turn out to be a pointer, and an u64 might actually be a s64, and a u32 might actually be two separate u16s.
