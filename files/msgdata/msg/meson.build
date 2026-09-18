build_dir = meson.current_build_dir()

# This list will be what's used hereafter when referring to any-and-all generated banks.
trainer_text_bank_names = [
    'msg_0729.json',
]

generated_text_banks = [
    trainer_text_bank_names
]

# 2. All other files must be static. Pull these from `generated/text_banks.txt`. This allows us
# to circumvent needing to build an NAIX, which reduces overall build depenedencies and speeds
# up compilation times when a user just wants to edit an *existing* text bank.
text_bank_consts = fs.read(text_banks_txt).splitlines()
text_bank_files = []
foreach text_bank : text_bank_consts
    text_bank_name = (text_bank.replace('NARC_msg_', '').replace('_bin', '') + '.json')
    if not generated_text_banks.contains(text_bank_name)
        text_bank_files += files(text_bank_name)
    endif
endforeach

# 3. Generate the ordering for `pl_msg.narc` from `generated/text_banks.txt`.
text_banks_order = custom_target('text_banks.order',
    output: 'text_banks.order',
    input: text_banks_txt,
    command: [ ordergen_text_banks_py, '@INPUT@', '@OUTPUT@' ],
)

