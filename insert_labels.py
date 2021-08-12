import sys

with open(sys.argv[1], 'rb') as fp:
    data = fp.read()
with open(sys.argv[2]) as offfile:
    offsets = [int(x, 0) for x in offfile.read().split()]
vma = int(sys.argv[3], 0)
offsets = sorted(set(offsets))
offsets.append(vma + len(data))
for start, end in zip(offsets[:-1], offsets[1:]):
    print(f'_{start:08X}:')
    aligned = (start + 15) & ~15
    if start < aligned:
        print('\t.byte ' + ', '.join(f'0x{byte:02X}' for byte in data[start - vma:aligned-vma]))
    for i in range(aligned, end, 16):
        print('\t.byte ' + ', '.join(f'0x{byte:02X}' for byte in data[i - vma:min(i + 16, end) - vma]))
