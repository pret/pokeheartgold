# Generate a context file for decomp.me

[Decomp.me](https://decomp.me) requires a context file declaring any imported typedefs, structs, or constants that will be used in the decompiled function.
`m2ctx` generates this context file automatically.

## How to use

In this example, you are decompiling an asm file `asm/npc_trade.s` into a new C file `src/npc_trade.c`.
You've created the source file and may have added some imports you know you'll need.
Your file may look like this:

```
#include "pokemon.h"
```

Run `./tools/m2ctx/m2ctx.py src/npc_trade.c` to generate a context file, which will be output as `ctx.c`. 
Copy the contents of `ctx.c` into the "Context" section of the scratch.

### Adding imports

As you continue decompiling, you may realize that you need to add imports to your source file:
```diff
#include "pokemon.h"
+#include "party.h"
```

You can use `m2ctx` to generate an updated context file which will include declarations from the new imports.
First, comment out any function definitions in your source file.
Then re-generate the context file: `./tools/m2ctx/m2ctx.py src/npc_trade.c`.
