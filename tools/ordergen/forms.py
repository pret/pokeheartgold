#!/usr/bin/env python3

import argparse
import json
import sys

ANSI_BOLD_WHITE = "\033[1;37m"
ANSI_BOLD_RED = "\033[1;31m"
ANSI_RED = "\033[31m"
ANSI_CLEAR = "\033[0m"

argp = argparse.ArgumentParser(
    description="Process a forms registry into a listing of res/pokemon subdirectories"
)
argp.add_argument("FORM_REGISTRY", help="Path to the forms registry")
argp.add_argument("DATA_OUT", help="Path to the data-type output registry")
argp.add_argument("ICON_OUT", help="Path to the icon-type output registry")
argp.add_argument("SPRITE_OUT", help="Path to the sprite-type output registry")

args = argp.parse_args()

with (
    open(args.FORM_REGISTRY, "r", encoding="utf-8") as form_reg_f,
    open(args.DATA_OUT, "w", encoding="utf-8") as data_out,
    open(args.ICON_OUT, "w", encoding="utf-8") as icon_out,
    open(args.SPRITE_OUT, "w", encoding="utf-8") as sprite_out,
):
    try:
        form_reg: dict[str, dict[str, str | bool]] = json.load(form_reg_f)
    except json.decoder.JSONDecodeError as e:
        doc_lines = e.doc.splitlines()
        start_line = max(e.lineno - 2, 0)
        end_line = min(e.lineno + 1, len(doc_lines))

        error_lines = [f"{line_num:>4} | {line}" for line_num, line in zip(list(range(start_line + 1, end_line + 1)), doc_lines[start_line : end_line])][ : end_line - start_line]
        error_line_index = e.lineno - start_line - 1
        error_lines[error_line_index] = error_lines[error_line_index][ : 5] + f"{ANSI_RED}{error_lines[error_line_index][5 : ]}{ANSI_CLEAR}"
        error_out = "\n".join(error_lines)

        print(f"{ANSI_BOLD_WHITE}{args.FORM_REGISTRY}:{e.lineno}:{e.colno}: {ANSI_BOLD_RED}error: {ANSI_BOLD_WHITE}{e.msg}{ANSI_CLEAR}\n{error_out}", file=sys.stderr)
        sys.exit(1)

    all_sprite_lines = []
    all_palette_lines = []
    last_sprite_lines = []
    last_palette_lines = []

    for species, form_set in form_reg.items():
        shared_palette = form_set.get("__shared_palette", False)
        dupe_base_icon = form_set.get("__dupe_base_icon", False)
        all_back_then_front = form_set.get("__all_back_then_front", False)
        all_normal_then_shiny = form_set.get("__all_normal_then_shiny", False)
        front_only = form_set.get("__front_only", False)
        last_sprite = form_set.get("__last_sprite", False)

        if dupe_base_icon:
            print(f"{species}", file=icon_out)

        forms_back = [f"{species}/forms/base/back.png"]
        forms_front = [f"{species}/forms/base/front.png"]
        forms_normal = [f"{species}/forms/base/normal.png"]
        forms_shiny = [f"{species}/forms/base/shiny.pal"]
        for form_name, form_type in form_set.items():
            if form_name.startswith("__"):
                continue

            if form_type == "data":
                print(f"{species}/forms/{form_name}", file=data_out)
                print(f"{species}/forms/{form_name}", file=icon_out)
            elif form_type == "icon":
                print(f"{species}/forms/{form_name}", file=icon_out)

            if not front_only:
                forms_back.append(f"{species}/forms/{form_name}/back.png")
                forms_shiny.append(f"{species}/forms/{form_name}/shiny.pal")
            forms_front.append(f"{species}/forms/{form_name}/front.png")
            forms_normal.append(f"{species}/forms/{form_name}/normal.pal")

        sprite_lines = []
        palette_lines = []
        if all_back_then_front:
            sprite_lines.extend(forms_back)
            sprite_lines.extend(forms_front)
        else:  # form back then form front for each form
            [
                sprite_lines.extend((back, front))
                for (back, front) in zip(forms_back, forms_front)
            ]

        if shared_palette:
            palette_lines.append(forms_normal[0])
            palette_lines.append(forms_shiny[0])
        elif all_normal_then_shiny:
            palette_lines.extend(forms_normal)
            palette_lines.extend(forms_shiny)
        else:  # form normal then form shiny for each form
            [
                palette_lines.extend((normal, shiny))
                for (normal, shiny) in zip(forms_normal, forms_shiny)
            ]

        if last_sprite:
            last_sprite_lines = sprite_lines
            last_palette_lines = palette_lines
        else:
            all_sprite_lines.extend(sprite_lines)
            all_palette_lines.extend(palette_lines)

    if last_sprite_lines:
        all_sprite_lines.extend(last_sprite_lines)
        all_palette_lines.extend(last_palette_lines)

    [print(sprite, file=sprite_out) for sprite in all_sprite_lines]
    [print(palette, file=sprite_out) for palette in all_palette_lines]
    print(".shared/substitute_back.png", file=sprite_out)
    print(".shared/substitute_front.png", file=sprite_out)
    print(".shared/substitute.pal", file=sprite_out)
    print(".shared/shadows.png", file=sprite_out)
    print(".shared/shadows.pal", file=sprite_out)
