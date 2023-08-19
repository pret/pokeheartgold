# =============================================================================
# MIT License
# 
# Copyright (c) 2023 luckytyphlosion
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# =============================================================================

import argparse
import replacelib
import pathlib

def replace_filename_in_code_and_rename(cur_filename, new_filename):
    replacelib.FileRenameData.validate_rename_file_and_data(cur_filename, new_filename, "renames/file_renames.csv")
    config = replacelib.read_config()

    cur_filepath = pathlib.Path(cur_filename)
    new_filepath = pathlib.Path(new_filename)

    found_replacement_args = False

    text_section_type = None
    
    if cur_filename.startswith("include/"):
        replace_from = f'"{cur_filename.replace("include/", "")}"'
        replace_to = f'"{new_filename.replace("include/", "")}"'
        found_replacement_args = True
    elif cur_filename.startswith("asm/include/"):
        replace_from = f'"{cur_filename.replace("asm/include/", "")}"'
        replace_to = f'"{new_filename.replace("asm/include/", "")}"'
        found_replacement_args = True
    elif cur_filename.startswith("asm/"):
        if cur_filepath.suffix == ".inc":
            replace_from = cur_filename
            replace_to = new_filename
            found_replacement_args = True
        elif cur_filepath.suffix == ".s":
            text_section_type = "asm"
        else:
            raise RuntimeError(f"Current filename {cur_filename} extension not .s or .inc!")
    elif cur_filename.startswith("src/"):
        if cur_filepath.suffix == ".h":
            raise RuntimeError("TODO: pokeheartgold maintainers should decide on a consistent include style for .h files defined in src")
        elif cur_filepath.suffix != ".c":
            raise RuntimeError(f"Current filename {cur_filename} is not a C file!")
        else:
            text_section_type = "src"
    else:
        raise RuntimeError("Only src and include replacements are supported right now!")
    #    cur_include_filename = f'"{cur_filename.replace("include/", "")}"'
    #elif "/src/include/" in cur_filename:
    #    raise RuntimeError("Replacing library 
    #    #cur_filename_include_parts = cur_filename.split("/src/include/")
    #    #if len(cur_filename_include_parts) != 2:
    #    #    raise RuntimeError(f"Multiple instances of /src/include/ in current filename {cur_filename}! (Not allowed by build organization)")
    #    #
    #    #cur_include_filename = f'"include/{cur_filename_include_parts[1]}"'
    #
    #elif "/include/" in cur_filename:
    #    cur_filename_include_parts = cur_filename.split("/include/")
    #    if len(cur_filename_include_parts) != 2:
    #        raise RuntimeError(f"Multiple instances of /include/ in current filename {cur_filename}! (Not allowed by build organization)")
    #    cur_include_filename = cur_filename_include_parts[1]

    repo_game = config["repo_game"]

    if text_section_type is not None:
        replace_from = cur_filepath.name
        replace_to = new_filepath.name
        replace_from_2 = cur_filename
        replace_to_2 = new_filename

        lsf_filename = replacelib.get_game_lsf(config)

        if repo_game == "hgss":
            lsf_replace_from = str(cur_filepath.with_suffix(".o"))
            lsf_replace_to = str(new_filepath.with_suffix(".o"))
        elif repo_game == "platinum":
            lsf_replace_from = f"main.nef.p/{cur_filename.replace('/', '_')}.o"
            lsf_replace_to = f"main.nef.p/{new_filename.replace('/', '_')}.o"
        else:
            raise RuntimeError(f"Unknown repo game {repo_game}!")

    code_filenames = replacelib.read_in_all_code_files(config)
    if text_section_type is None:
        replacelib.FilesSingleReplacer.replace_single(code_filenames, replace_from, replace_to, "renames/file_code_replacements.csv")
    else:
        files_multi_replacer = replacelib.FilesMultiReplacer("renames/file_code_replacements.csv")
        files_multi_replacer.add_replacements_and_replace_multiple(code_filenames,
            [
                (replace_from, replace_to),
                (replace_from_2, replace_to_2)
            ]
        )

        # really, there should be some system to chain replacements and then commit the results in the end
        # the lsf and meson.build shouldn't really have any conflicts though
        replacelib.FilesSingleReplacer.replace_single([lsf_filename], lsf_replace_from, lsf_replace_to, "renames/lsf_renames.csv", is_subsequent_file_rename_replacement=True)
        if repo_game == "platinum":
            meson_filename_from = cur_filename.replace("src/", "")
            meson_filename_to = new_filename.replace("src/", "")
            replacelib.FilesSingleReplacer.replace_single(["src/meson.build"], f"'{meson_filename_from}'", f"'{meson_filename_to}'", "renames/meson_renames.csv", is_subsequent_file_rename_replacement=True)

    replacelib.FileRenameData.rename_file(cur_filename, new_filename)
    replacelib.FileRenameData.update_file_renames(cur_filename, new_filename, "renames/file_renames.csv")

def main():
    ap = argparse.ArgumentParser(description="Rename a file and store the results to CSV files")
    ap.add_argument("cur_filename", help="Current filename")
    ap.add_argument("new_filename", help="New filename")

    args = ap.parse_args()

    replace_filename_in_code_and_rename(args.cur_filename, args.new_filename)

if __name__ == "__main__":
    main()
