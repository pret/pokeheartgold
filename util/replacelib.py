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

import re
import csv
from wcmatch import glob as wcmatch_glob
from contextlib import contextmanager
import json
import pathlib
import io
import sys
import os

CONFIG_FILENAME = "renames/config.txt"
FILE_CODE_REPLACEMENTS_CSV = "renames/file_code_replacements.csv"
FILE_RENAMES_CSV = "renames/file_renames.csv"
LSF_RENAMES_CSV = "renames/lsf_renames.csv"
MESON_RENAMES_CSV = "renames/meson_renames.csv"
REPLACEMENTS_CSV = "renames/replacements.csv"

ALL_CSVS = [FILE_CODE_REPLACEMENTS_CSV, FILE_RENAMES_CSV, LSF_RENAMES_CSV, MESON_RENAMES_CSV, REPLACEMENTS_CSV]

# prefer simple key: value store over json
# to make it easier to add in values

def read_config():
    config = {}

    try:
        with open(CONFIG_FILENAME, "r") as f:
            for line in f:
                if line.strip() == "":
                    continue

                key, value = line.split(":", maxsplit=1)
                key = key.strip()
                value = value.strip()

                config[key] = value

    except Exception as e:
        raise RuntimeError(f"Error when trying to read config file {CONFIG_FILENAME}!")

    return config

def read_in_all_code_files(config):
    glob_specifier = config["code_files_glob_specifier"]

    return wcmatch_glob.glob(glob_specifier, flags=(wcmatch_glob.GLOBSTAR | wcmatch_glob.BRACE | wcmatch_glob.NEGATE))

def get_game_lsf(config):
    repo_game = config["repo_game"]

    if repo_game == "hgss":
        return "main.lsf"
    elif repo_game == "platinum":
        return "platinum.us/main.lsf"
    else:
        raise RuntimeError(f"Unknown repo game {repo_game}!")

def open_l(filename, mode, newline="\n"):
    return open(filename, mode, encoding="utf-8", newline=newline)

def csv_write_row(filename, row):
    with open_l(filename, "a", newline="") as f:
        f.write("\n")
        csv_writer = csv.writer(f)
        csv_writer.writerow(row)

class StringContainer:
    __slots__ = ("value", "num_replacements")

    def __init__(self, value):
        self.value = value
        self.num_replacements = 0

WORD_CHARACTERS = set("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_")

#class File:
#    __slots__ = ("name"
#class FileManager:
#    __slots__ = ("files"

class Replacer:
    @staticmethod
    def boundarize_str(query):
        if query[0] in WORD_CHARACTERS:
            pattern_start = "\\b"
        else:
            pattern_start = ""

        if query[-1] in WORD_CHARACTERS:
            pattern_end = "\\b"
        else:
            pattern_end = ""

        pattern_str = f"{pattern_start}{re.escape(query)}{pattern_end}"
        return pattern_str

    @staticmethod
    def single_find(input, query):
        pattern_str = Replacer.boundarize_str(query)
        pattern = re.compile(pattern_str)
        return pattern.search(input) is not None

    @staticmethod
    def single_replace(input, replace_from, replace_to):
        pattern_str = Replacer.boundarize_str(replace_from)
        pattern = re.compile(pattern_str)
        return pattern.subn(replace_to, input)

    @staticmethod
    def create_multiple_find_pattern(rep_dict):
        sorted_rep_dict_values = sorted(rep_dict, key=len, reverse=True)
        pattern_parts = []
        for replace_from in sorted_rep_dict_values:
            pattern_part = Replacer.boundarize_str(replace_from)
            
            if replace_from[0] in WORD_CHARACTERS:
                pattern_start = "\\b"
            else:
                pattern_start = ""

            if replace_from[-1] in WORD_CHARACTERS:
                pattern_end = "\\b"
            else:
                pattern_end = ""

            pattern_parts.append(pattern_part)

        pattern_str = "|".join(pattern_parts)

        pattern = re.compile(pattern_str, flags=re.DOTALL)
        #print(f"multiple_replace pattern_str: {pattern_str}")
        return pattern

    @staticmethod
    def multiple_find(input, pattern):
        return pattern.search(input) is not None

    @staticmethod
    def multiple_replace(input, pattern, rep_dict):
        if len(rep_dict) == 0:
            return input, 0

        def multiple_replace_lambda(x):
            return rep_dict[x.group(0)]

        return pattern.subn(multiple_replace_lambda, input)

    @contextmanager
    @staticmethod
    def open_and_write(filename):
        file_obj = open_l(filename, "r+")
        string_container = StringContainer(file_obj.read())
        try:
            yield string_container
        except Exception as e:
            file_obj.close()
            raise e
        finally:
            if string_container.num_replacements != 0:
                file_obj.truncate(size=0)
                file_obj.write(string_container.value)
            file_obj.close()

    @staticmethod
    def single_find_for_file(filename, query):
        with open_l(filename, "r") as f:
            contents = f.read()

        return Replacer.single_find(contents, query)

    @staticmethod
    def single_replace_for_file(filename, replace_from, replace_to):
        with open_and_write(filename) as string_container:
            string_container.value, string_container.num_replacements = Replacer.single_replace(string_container.value, replace_from, replace_to)

    @staticmethod
    def single_replace_for_file_result_only(filename, replace_from, replace_to):
        try:
            with open_l(filename, "r") as f:
                contents = f.read()
        except UnicodeDecodeError as e:
            raise RuntimeError(f"filename: {filename}") from e

        return Replacer.single_replace(contents, replace_from, replace_to)

    @staticmethod
    def multiple_find_for_file(filename, pattern):
        with open_l(filename, "r") as f:
            contents = f.read()

        return Replacer.multiple_find(contents, pattern)

    @staticmethod
    def multiple_replace_for_file(filename, pattern, rep_dict):
        with open_and_write(filename) as string_container:
            string_container.value, string_container.num_replacements = Replacer.multiple_replace(string_container.value, pattern, rep_dict)

    @staticmethod
    def multiple_replace_for_file_result_only(filename, pattern, rep_dict):
        with open_l(filename, "r") as f:
            contents = f.read()

        return Replacer.multiple_replace(contents, pattern, rep_dict)

class Replacement:
    __slots__ = ("replace_from", "replace_to")

    def __init__(self, replace_from, replace_to):
        self.replace_from = replace_from
        self.replace_to = replace_to

class ReplacementData:

    @staticmethod
    def read_in(replacements_filename):
        replacements_filepath = pathlib.Path(replacements_filename)
        replacements_filepath.parent.mkdir(exist_ok=True, parents=True)
        if not replacements_filepath.is_file():
            replacements_filepath.touch()

        with open_l(replacements_filename, "r") as f:
            replacements_reader = csv.reader(f)
            data = [x for x in list(replacements_reader) if len(x) != 0]

        return data

    @staticmethod
    # main logic was mostly generated by GPT-4 wtf
    def validate_and_resolve(replacements_data, print_errors=True, throw_error=False, throw_error_message_prefix=None):
        resolved_replacements_data_dict = {}
        errors = False

        for parent, child in replacements_data:
            for node, p_child in list(resolved_replacements_data_dict.items()):
                if p_child == parent:
                    parent = node
                    del resolved_replacements_data_dict[node]
                    break
    
            node_already_in_graph = False
    
            for cur_parent, cur_child in resolved_replacements_data_dict.items():
                if child == cur_child or parent == cur_child:
                    node_already_in_graph = True
                    if print_errors:
                        print(f"Cannot do '{parent}' -> '{child}'\n     when '{cur_parent}' -> '{cur_child}' has been done.\n")
                    errors = True
                    break
    
            if not node_already_in_graph:
                p_child = resolved_replacements_data_dict.get(parent)
                if p_child is not None:
                    if print_errors:
                        print(f"Cannot do '{parent}' -> '{child}'\n     when '{parent}' -> '{p_child}' has been done.\n")
                    errors = True
                else:
                    resolved_replacements_data_dict[parent] = child

        resolved_replacements_data = list(resolved_replacements_data_dict.items())
        #print(f"resolved_replacements_data: {resolved_replacements_data}")
        if errors and throw_error:
            if throw_error_message_prefix is None:
                throw_error_message_prefix = "Parsing errors occurred in replacement file. Below is the file trimmed to remove errors."

            output = io.StringIO()
            csv_writer = csv.writer(output)
            csv_writer.writerows(resolved_replacements_data)
            print(f"\n\n{throw_error_message_prefix}\n== Processed file ==\n{output.getvalue()}")
            sys.exit(1)

        return resolved_replacements_data, errors

class FileRenameData:
    @staticmethod
    def validate_rename_file_and_data(cur_filename, new_filename, file_renames_filename):
        FileRenameData.validate_rename_file(cur_filename, new_filename)

        file_renames_data = ReplacementData.read_in(file_renames_filename)
        ReplacementData.validate_and_resolve(file_renames_data, print_errors=True, throw_error=True)

        file_renames_data.append((cur_filename, new_filename))
        ReplacementData.validate_and_resolve(file_renames_data, print_errors=True, throw_error=True, throw_error_message_prefix=f"Renaming \"{cur_filename}\" to \"{new_filename}\" would have resulted in errors! Below would have been the resulting replacements file trimmed to remove errors.")

    @staticmethod
    def validate_rename_file(cur_filename, new_filename, throw_error=True):
        cur_filepath = pathlib.Path(cur_filename)
        new_filepath = pathlib.Path(new_filename)
        error_occurred = False

        if not cur_filepath.is_file():
            if throw_error:
                raise RuntimeError(f"{cur_filename} does not exist!")
            else:
               print(f"Warning: {cur_filename} does not exist.")
               error_occurred = True

        if new_filepath.exists():
            if throw_error:
                raise RuntimeError(f"Target filename {new_filename} already exists!")
            else:
                print(f"Warning: Target filename {new_filename} already exists!")
                error_occurred = True
    
        return error_occurred

    @staticmethod
    def rename_file(cur_filename, new_filename):
        pathlib.Path(new_filename).parent.mkdir(parents=True, exist_ok=True)
        os.rename(cur_filename, new_filename)

    @staticmethod
    def update_file_renames(cur_filename, new_filename, file_renames_filename):
        csv_write_row(file_renames_filename, (cur_filename, new_filename))

    @staticmethod
    def rename_all_from_file(file_renames_filename, swapped, ignored_files=None):
        file_renames_data = ReplacementData.read_in(file_renames_filename)
        resolved_file_renames_data, errors = ReplacementData.validate_and_resolve(file_renames_data, print_errors=True, throw_error=True)
        #print(f"resolved_file_renames_data: {resolved_file_renames_data}")
        
        if ignored_files is None:
            ignored_files = set()

        if swapped:
            resolved_file_renames_data = [(new_filename, cur_filename) for cur_filename, new_filename in resolved_file_renames_data if new_filename not in ignored_files]
        else:
            resolved_file_renames_data = [(cur_filename, new_filename) for cur_filename, new_filename in resolved_file_renames_data if cur_filename not in ignored_files]

        for cur_filename, new_filename in resolved_file_renames_data:
            errors_occurred = FileRenameData.validate_rename_file(cur_filename, new_filename, throw_error=False)
            if not errors_occurred:
                FileRenameData.rename_file(cur_filename, new_filename)

class FilesSingleReplacer:
    FILE_RENAME_CODE_REPLACE_LIMITATION_MESSAGE = """

The fact that the string exists in the file likely means that there is an error in your lsf or meson.build. Firstly, please correct the lsf or meson.build where the problem exists. Then, due to current program limitations, you will need to manually rollback parts of the files which the script has modified, probably by reverting the changes using git.

The first part of the script involves renaming any file mentions within code files. To elaborate with an example, the file rename src/pm_string.c -> src/strbuf.c would replace mentions of src/pm_string.c and pm_string.c with src/strbuf.c and strbuf.c in code files respectively, so if src/berry_data.c mentioned pm_string.c in a comment, it would be renamed to strbuf.c.

The second part of the script will rename the respective object file in the main.lsf. Note that this case only matters if your repo uses meson (currently only pokeplatinum), so you can ignore this part if it doesn't. If your repo does use meson, you may need to rollback any changes done to the main.lsf as well.

For both the first and second part of the script, you can either rollback these code changes by rolling back ALL file renames via `python3 util/unrename_files.py`, or by manually reverting only the affected files.

Finally, you will need to manually rollback the rename data in renames/file_code_replacements.csv, and renames/lsf_renames.csv (if the repo uses meson), such that it doesn't include the file rename you tried to perform.

Ideally, all replacements should be verified first before writing files, which should be implemented in a future update. This is the only case where the replacement state ends up in a broken state, and it is a very niche and unlikely mistake, so it is not going to be fixed immediately.
"""

    @staticmethod
    def replace_single(filenames, replace_from, replace_to, replacements_filename, error_if_exist=True, is_subsequent_file_rename_replacement=False):
        replacements_data = ReplacementData.read_in(replacements_filename)
        ReplacementData.validate_and_resolve(replacements_data, print_errors=True, throw_error=True)

        replacements_data.append((replace_from, replace_to))
        ReplacementData.validate_and_resolve(replacements_data,
            print_errors=True, throw_error=True,
            throw_error_message_prefix=f"Performing the replacement '{replace_from}' -> '{replace_to}' resulted in errors! Below would have been the resulting file trimmed to remove errors."
        )

        print(f"Verifying target string '{replace_to}' doesn't already exist in files!")
        target_found_filenames = []

        for filename in filenames:
            if Replacer.single_find_for_file(filename, replace_to):
                target_found_filenames.append(filename)

        if len(target_found_filenames) != 0:
            if error_if_exist:
                initial_error_message = f"\nERROR: Target string '{replace_to}' already exists in files, which would prevent the replacement scripts from properly rolling backwards. Please perform this replacement ('{replace_from}' -> '{replace_to}') as a separate pull request without using the replacement scripts."
                if is_subsequent_file_rename_replacement:
                    extra_error_message = FilesSingleReplacer.FILE_RENAME_CODE_REPLACE_LIMITATION_MESSAGE
                else:
                    extra_error_message = ""

                error_message = f"{initial_error_message} {extra_error_message}\nFiles where '{replace_to}' exists: {', '.join(target_found_filenames)}"

                print(error_message)
                sys.exit(1)
            else:
                print(f"\nWarning: target string '{replace_to}' already exists in files. This would prevent the replacement scripts from properly rolling backwards, but this has probably occurred via a rereplacement after a partial unreplacement, so it should be okay.\nFiles where '{replace_to}' exists: {', '.join(target_found_filenames)}")

        print(f"Searching through files!")
        replace_results = {}
        for filename in filenames:
            replace_result, num_replacements = Replacer.single_replace_for_file_result_only(filename, replace_from, replace_to)
            if num_replacements != 0:
                replace_results[filename] = replace_result

        print(f"Writing files, do not interrupt!")
        for filename, replace_result in replace_results.items():
            with open_l(filename, "w+") as f:
                f.write(replace_result)

        csv_write_row(replacements_filename, [replace_from, replace_to])

class FilesMultiReplacer:
    __slots__ = ("data", "resolved_data", "replacements_filename")

    def __init__(self, replacements_filename):
        data = ReplacementData.read_in(replacements_filename)
        self.resolved_data, errors = ReplacementData.validate_and_resolve(data, print_errors=True, throw_error=True)

        self.data = data
        self.replacements_filename = replacements_filename

    def create_rep_dict(self, given_data, swapped):
        if swapped:
            rep_dict = {replace_to: replace_from for replace_from, replace_to in given_data}
        else:
            rep_dict = {replace_from: replace_to for replace_from, replace_to in given_data}

        return rep_dict

    def replace_multiple(self, filenames, rep_dict, error_if_exist=False):
        target_strings = tuple(rep_dict.values())
        target_strings_str = ", ".join(f"'{target_string}'" for target_string in target_strings)
        print(f"Verifying target strings {target_strings_str} don't already exist in files!")
        target_found_filenames = []

        multiple_find_pattern = Replacer.create_multiple_find_pattern(target_strings)

        for filename in filenames:
            if Replacer.multiple_find_for_file(filename, multiple_find_pattern):
                target_found_filenames.append(filename)

        if len(target_found_filenames) != 0:
            if error_if_exist:
                replacements_str = "; ".join(f"'{replace_from} -> {replace_to}'" for replace_from, replace_to in rep_dict.items())
                print(f"\nERROR: One of target strings {target_strings_str} already exists in files, which would prevent the replacement scripts from properly rolling backwards. Please perform the replacements [{replacements_str}] as a separate pull request without using the replacement scripts.\nFiles where one of target strings exists: {', '.join(target_found_filenames)}")
                sys.exit(1)
            else:
                print(f"\nOne of target strings {target_strings_str} already exists in files, which would prevent the replacement scripts from properly rolling backwards. This would prevent the replacement scripts from properly rolling backwards, but this has probably occurred via a rereplacement after a partial unreplacement, so it should be okay.\nFiles where one of target strings exists: {', '.join(target_found_filenames)}")

        print(f"Searching through files!")
        replace_results = {}
        multiple_replace_pattern = Replacer.create_multiple_find_pattern(rep_dict)

        for filename in filenames:
            #print(f"filename: {filename}")
            replace_result, num_replacements = Replacer.multiple_replace_for_file_result_only(filename, multiple_replace_pattern, rep_dict)
            if num_replacements != 0:
                print(f"replaced in {filename}")
                replace_results[filename] = replace_result

        print(f"Writing files, do not interrupt!")
        for filename, replace_result in replace_results.items():
            with open_l(filename, "w+") as f:
                f.write(replace_result)

    @staticmethod
    def remove_ignored_files_from_filenames(filenames, ignored_files):
        if ignored_files is None:
            return filenames

        filenames_dict = {filename: True for filename in filenames if filename not in ignored_files}
        return list(filenames_dict.keys())

    def unreplace(self, filenames, ignored_files=None):
        filenames = FilesMultiReplacer.remove_ignored_files_from_filenames(filenames, ignored_files)
        rep_dict = self.create_rep_dict(self.resolved_data, True)
        self.replace_multiple(filenames, rep_dict)

    def rereplace(self, filenames, ignored_files=None):
        filenames = FilesMultiReplacer.remove_ignored_files_from_filenames(filenames, ignored_files)
        rep_dict = self.create_rep_dict(self.resolved_data, False)
        self.replace_multiple(filenames, rep_dict)

    def add_replacements_and_replace_multiple(self, filenames, data_to_add):
        new_data = self.data + data_to_add
        ReplacementData.validate_and_resolve(new_data, print_errors=True, throw_error=True, throw_error_message_prefix=f"Performing the replacements " + "; ".join(f"'{replace_from}' -> '{replace_to}'" for replace_from, replace_to in data_to_add) + " resulted in errors! Below would have been the resulting file trimmed to remove errors.")

        rep_dict = self.create_rep_dict(data_to_add, False)
        self.replace_multiple(filenames, rep_dict, True)

        with open_l(self.replacements_filename, "a", newline="") as f:
            f.write("\n")
            replacements_writer = csv.writer(f)
            replacements_writer.writerows(data_to_add)

    def clear_csv(self):
        with open_l(self.replacements_filename, "w+") as f:
            pass

# pokeheartgold is "{asm,include,lib,src,sub}/**/*.{c,h,inc,s}"

def read_in_unreplaced_and_unrenamed_state():
    unreplaced_and_unrenamed_state_filepath = pathlib.Path("renames/unreplaced_unrenamed_state.txt")
    unreplaced_and_unrenamed_state_filepath.parent.mkdir(exist_ok=True, parents=True)

    if not unreplaced_and_unrenamed_state_filepath.is_file():
        with open(unreplaced_and_unrenamed_state_filepath, "w+b") as f:
            f.write(b"1 1")

        contents = bytearray(b"1 1")
        unreplaced_and_unrenamed_state_file = open(unreplaced_and_unrenamed_state_filepath, "rb+")
    else:
        unreplaced_and_unrenamed_state_file = open(unreplaced_and_unrenamed_state_filepath, "rb+")
        contents = bytearray(unreplaced_and_unrenamed_state_file.read())
        unreplaced_and_unrenamed_state_file.seek(0)

    return contents, unreplaced_and_unrenamed_state_file

def set_unreplaced_and_unrenamed_state(unreplaced_state=None, unrenamed_state=None, clear_if_no_unreplacements_nor_unrenames=False):
    contents, unreplaced_and_unrenamed_state_file = read_in_unreplaced_and_unrenamed_state()

    if unreplaced_state is not None:
        unreplaced_state_str = "1" if unreplaced_state else "0"
        contents[0] = ord(unreplaced_state_str)

    if unrenamed_state is not None:
        unrenamed_state_str = "1" if unrenamed_state else "0"
        contents[2] = ord(unrenamed_state_str)

    unreplaced_and_unrenamed_state_file.write(contents)
    unreplaced_and_unrenamed_state_file.close()
    if clear_if_no_unreplacements_nor_unrenames and contents == b"0 0":
        for csv_filename in ALL_CSVS:
            open(csv_filename, "w+").close()

def set_unreplaced_state(unreplaced_state, clear_if_no_unreplacements_nor_unrenames=False):
    set_unreplaced_and_unrenamed_state(unreplaced_state=unreplaced_state, clear_if_no_unreplacements_nor_unrenames=clear_if_no_unreplacements_nor_unrenames)

def set_unrenamed_state(unrenamed_state, clear_if_no_unreplacements_nor_unrenames=False):
    set_unreplaced_and_unrenamed_state(unrenamed_state=unrenamed_state, clear_if_no_unreplacements_nor_unrenames=clear_if_no_unreplacements_nor_unrenames)
