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

def main():
    ap = argparse.ArgumentParser(description="Replace a string with another string and store the results to renames/replacements.csv")
    ap.add_argument("replace_from", help="String to find")
    ap.add_argument("replace_to", help="String to replace with")

    args = ap.parse_args()
    config = replacelib.read_config()

    code_filenames = replacelib.read_in_all_code_files(config)
    replacelib.FilesSingleReplacer.replace_single(code_filenames, args.replace_from, args.replace_to, "renames/replacements.csv")

if __name__ == "__main__":
    main()
