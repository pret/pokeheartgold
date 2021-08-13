import sys

with open(sys.argv[1], 'rb') as fp:
    data = fp.read()
x = data.find(b'\x21\x06\xc0\xde')
if x != -1:
    x -= 28
print(x)
