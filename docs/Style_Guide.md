# PokeHeartgold Style guide
The following text consists of examples on styling code properly. Keep using this style in your code to make it consistent with the rest of the repo 
When not sure how to style a specific code, ask in the pret discord!

## Spacing
- No space between cast closing parenthesis and expression being cast
```diff
- return function((u16) u8arg);
+ return function((u16)u8arg); 
```
- Insert space between control flow keywords (`if`, `for`, `while` etc) and opening parenthesis, as well as between closing parenthesis and opening brace
```diff
- if(foo == 23){
+ if (foo == 23) {
```
- This also applies to functions
```diff
- void foo(){
+ void foo() {
```
- To evaluate boolean variables inside `if`s either use the BOOL macros or don't use the `==` operator.
```diff
- if (isShiny == 0)
+ if (!isShiny)
```
```diff
- if (isShiny == 1)
+ if (isShiny == TRUE)
```
-`if` blocks that contain a single statement should still use brackets
```diff
- if (ptr->Unk_var44 < 0xf)
-     ptr->Unk_var44 = 0xf;
+ if (ptr->Unk_var44 < 0xf) {
+     ptr->Unk_var44 = 0xf;
+ }
```
- There should be a space between typedef struct's name and it's closing brace
```diff
- }UnkStruct32;
+ } UnkStruct32;
```
- Assignments and comparison operators should use space on both sides
```diff
- if (a<b) {
+ if (a < b) {
```
```diff
- int a=0;
+ int a = 0;
```
##Naming
- Identified functions and typedef structs should have PascalCase names
```diff
- BOOL isSEPlaying(u32 soundeffect);
+ BOOL IsSEPlaying(u32 soundeffect);
```
```diff
- typedef struct unkStruct32 {
+ typedef struct UnkStruct32 {
```
- local variables, struct fields and function arguments should use either camelCase or snake_case names
```diff
- int UnkArg = 0;
+ int unkArg = 0;
```
```diff
- void foo(int UnkArg);
+ void foo(int unk_arg);
```
- Constants should be defined as/replaced by macros inside `include/constants/<relevant header file>.h`
```diff
-    MapMatrix_Load(0x3c, matrix);
+    MapMatrix_Load(MAP_T20, matrix); // from "constants/maps.h"
```
- Small values (less than 30) should be represented as decimal. Representing larger ones in hexadecimal is fine. (Bitfield variables can be the exception to this rule)
```diff
-    if (Unkarg1 >= 0xa) {
+    if (Unkarg1 >= 10) {
```
##Misc
- No explicit cast required when passing an integer to a parameter of a narrower type. The only casts required in this project are between integer and pointer types, or between otherwise incompatible pointer types (`u8 *` to struct `FooStruct *`, or `const u8` * to `u8 *`, etc.).
```diff
- foo((u16)u32arg); 
+ foo(u32arg);
```
- `for` variables should be declared outside the statement
```diff
- for (u8 i = 0; i < 5; i++) {
+ u8 i;
+ for (i = 0; i < 5; i++) {
```