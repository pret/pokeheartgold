There are many, *many* reasons why what you have decompiled might not match with the retail ROM, ranging from wrong order of statements, to too many/too few variables and parameters, to using the wrong way to do a thing in your code.

Documenting every reason your code might not match is out of the scope of this write-up, but there are ways to figure out exactly which part of your matching-decompilation went wrong. Which in turn can help you fix it.

### Decomp.me

Decomp.me is a 3rd party website that allows decompilers to throw an assembly function inside, set a compiler, and then try to write source code that matches said assembly function.

1. Go to Decomp.me, click "Start Decomping" to open a "New Scratch" window
2. Once in that window, set the platform to "Nintendo DS (ARMv4T)", and the Compiler preset to "Pokémon HeartGold/SoulSilver"
3. Copy paste the Assembly function into Target Assembly, and the function's name into Diff label
4. Use [m2ctx](../tools/m2ctx/README.md) to generate context for your function, paste it into the Context field in decomp.me
5. Click "Create a scratch". You'll be taken to the Scratch view. with a diff view of the target and compiled assembly on the right, and the source code view on the left
6. Add "#pragma thumb on" on top of the empty function, then replace the function with your non-matching function.

The current assembly view on the left will be filled with compiled code, where you can see where it doesn't match with the target assembly.

### Compiler Explorer
Compiler Explorer is a website that allows users to hook up compilers and explore the output of it alongside the source code. Its highly customizable UI as well as its diff view allows it to be morphed into a Decomp.me clone.

It has a slight advantage over Decomp.me in that users can set up local instances of the website and let it read context for compiled source code from a repo, eliminating step 4 of the process.

If you want to use the CExplorer instance for pokeheartgold you can join the pret discord and ask for a link and the password in #pokeheartgold.

### Asmdiff

Located in `tools/asmdiff/`, Asmdiff.sh is a shell script that will print out all the difference between the assembly of your nonmatching ROM and the retail ROM. To use it, you must put a copy of the matching ROM into the root folder and rename it to `baserom.nds`.

You can have it print out the assembly difference in the terminal using the command `./tools/asmdiff/asmdiff.sh -t | less`, or have it print out to a text file using `/tools/asmdiff/asmdiff.sh -t | less > diff.txt`.

Note that non-matching code that shifts the ROM (has more opcodes or less opcodes than the original code), will change the address of every branching opcode in the ROM, leading to a large output when using asmdiff.
You can output the print into a text file and search for your code there, or use `/`(forwards search) and `?`(backwards search) to search for a specific address if viewing the output in the terminal.