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

def main():
    config = replacelib.read_config()

    code_filenames = replacelib.read_in_all_code_files(config)
    replacelib.set_unrenamed_state(True)

    files_multi_replacer = replacelib.FilesMultiReplacer("renames/file_code_replacements.csv")
    files_multi_replacer.unreplace(code_filenames)

    files_multi_replacer = replacelib.FilesMultiReplacer("renames/lsf_renames.csv")
    lsf_filename = replacelib.get_game_lsf(config)
    files_multi_replacer.unreplace([lsf_filename])

    if config["repo_game"] == "platinum":
        files_multi_replacer = replacelib.FilesMultiReplacer("renames/meson_renames.csv")
        files_multi_replacer.unreplace(["src/meson.build"])

    replacelib.FileRenameData.rename_all_from_file("renames/file_renames.csv", True)

if __name__ == "__main__":
    main()
