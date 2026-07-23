#!/usr/bin/env python3

import os
import platform
import re

BUILD_DIRECTORY  = os.environ["MESON_BUILD_ROOT"]
SOURCE_DIRECTORY = os.environ["MESON_SOURCE_ROOT"]
COMPILER_RULE_PATTERN = r'rule c_COMPILER[\r\n]+(?:\s\w+ =.+[\r\n]+){4}'


def backslash_to_forward_slash(fileString: str) -> str:
    return fileString.replace('\\\\', '/')


def fix_static_libs(fileString: str) -> str:
    '''Replace single quotes around linked libraries with double quotes'''
    return fileString.replace("'lib", '"lib').replace(".a'", '.a"')


def is_wsl_accessing_windows() -> bool:
    return ("microsoft" in platform.uname()[2].lower() and os.path.realpath(os.path.abspath(__file__)).startswith("/mnt/"))


def bytecode_scripts_order_only_deps(fileString: str) -> str:
    '''Express bytecode-script dependencies on generated headers as order-only'''
    return re.sub(
        r"build ([\w\/\.\-]+): (\w+) ([\w\/\.\-]+) \| ([\w\/\.\-]+\/make_script_bin\.sh) ((.*)(tools/enumproc/enumproc(\.exe)?)(.*))",
        r"build \1: \2 \3 | \4 \7 || \6\9",
        fileString
    )


def main():
    BUILD_NINJA         = f'{BUILD_DIRECTORY}/build.ninja'
    COMPILE_COMMANDS    = f'{BUILD_DIRECTORY}/compile_commands.json'

    with open(BUILD_NINJA, 'r') as build_ninja_in, open(COMPILE_COMMANDS, 'r') as compile_commands_in:
        build_ninja_string = build_ninja_in.read()
        compile_commands_string = compile_commands_in.read()

    # build.ninja edits
    build_ninja_string = backslash_to_forward_slash(build_ninja_string)
    build_ninja_string = fix_static_libs(build_ninja_string)
    build_ninja_string = nasm_to_asm(build_ninja_string)
    build_ninja_string = bytecode_scripts_order_only_deps(build_ninja_string)

    # compile_commands.json edits
    compile_commands_string = backslash_to_forward_slash(compile_commands_string)

    # For WSL accessing Windows, paths to PCH input files must be relative
    if is_wsl_accessing_windows():
        build_ninja_string = relativize_pch_paths(build_ninja_string)
        compile_commands_string = relativize_pch_paths(compile_commands_string)

    with open(BUILD_NINJA, 'w') as build_ninja_out, open(COMPILE_COMMANDS, 'w') as compile_commands_out:
        build_ninja_out.write(build_ninja_string)
        compile_commands_out.write(compile_commands_string)


def nasm_to_asm(fileString: str) -> str:
    return fileString.replace('Nasm', 'ASM')

def relativize_pch_paths(fileString: str) -> str:
    '''Make paths to headers to be precompiled relative (for WSL)'''
    return re.sub(r'c_PCH [\w/\-.]+?subprojects', r'c_PCH ../subprojects', fileString)


if __name__ == '__main__':
    main()
