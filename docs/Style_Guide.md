# PokeHeartgold Style guide
The following text consists of examples on styling code properly. Keep using this style in your code to make it consistent with the rest of the repo 
When not sure how to style a specific code, ask in the pret discord!

## Spacing
- No space between cast closing parenthesis and expression being cast
```c
 return function((u16) u8arg); //incorrect
 return function((u16)u8arg); //correct
```
- Insert space between control flow keywords (`if`, `for`, `while` etc) and opening parenthesis, as well as between closing parenthesis and opening brace
```c
 if(foo == 23){ //incorrect
 if (foo == 23) { //correct
```
- This also applies to functions
```c
 void foo(){ //incorrect
 void foo() { //correct
```
- To evaluate boolean variables inside `if`s either use the BOOL macros or don't use the `==` operator.
```c
 if (isShiny == 0) //incorrect
 if (!isShiny) //correct
```
```c
 if (isShiny == 1) //incorrect
 if (isShiny == TRUE) //correct
```
-`if` blocks that contain a single statement should still use brackets
```c
 if (ptr->Unk_var44 < 0xf)
     ptr->Unk_var44 = 0xf; //incorrect
 if (ptr->Unk_var44 < 0xf) {
     ptr->Unk_var44 = 0xf;
 } //correct
```
- There should be a space between typedef struct's name and it's closing brace
```c
 }UnkStruct32; //incorrect
 } UnkStruct32; //correct
```
- Assignments and comparison operators should use space on both sides
```c
 if (a<b) { //incorrect
 if (a < b) { //correct
```
```c
 int a=0; //incorrect
 int a = 0; //correct
```
## Naming
- Identified functions and typedef structs should have PascalCase names
```c
- BOOL isSEPlaying(u32 soundeffect); //incorrect
+ BOOL IsSEPlaying(u32 soundeffect); //correct
```
```c
 typedef struct unkStruct32 { //incorrect
 typedef struct UnkStruct32 { //correct
```
- local variables, struct fields and function arguments should use either camelCase or snake_case names
```c
 int UnkArg = 0; //incorrect
 int unkArg = 0; //correct
```
```c
 void foo(int UnkArg); //incorrect
 void foo(int unk_arg); //correct
```
- Constants should be defined as/replaced by macros inside `include/constants/<relevant header file>.h`
```c
    MapMatrix_Load(0x3c, matrix); //incorrect
    MapMatrix_Load(MAP_T20, matrix); //correct, macro is from "constants/maps.h"
```
- Small values (less than 30) should be represented as decimal. Representing larger ones in hexadecimal is fine. (Bitfield variables can be the exception to this rule)
```c
    if (Unkarg1 >= 0xa) { //incorrect
    if (Unkarg1 >= 10) { //correct
```
## Misc
- No explicit cast required when passing an integer to a parameter of a narrower type. The only casts required in this project are between integer and pointer types, or between otherwise incompatible pointer types (`u8 *` to struct `FooStruct *`, or `const u8` * to `u8 *`, etc.).
```c
 foo((u16)u32arg); //incorrect
 foo(u32arg); //correct
```
- `for` variables should be declared outside the statement
```c
 for (u8 i = 0; i < 5; i++) { //incorrect
 u8 i;
 for (i = 0; i < 5; i++) { //correct
```