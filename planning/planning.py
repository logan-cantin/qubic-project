
from src.qubic import Qubic
import numpy as np


for index in np.ndindex(3, 3, 3):
    print(f'cell{"".join([str(x) for x in index])} ', end="")
print()

def number_to_base(n, b, l = 3):
    '''From https://stackoverflow.com/questions/2267362/how-to-convert-an-integer-to-a-string-in-any-base'''
    if n == 0:
        return [0] * l
    digits = []
    while n:
        digits.append(int(n % b))
        n //= b
    if len(digits) < 3:
        digits.extend([0] * (l - len(digits)))
    return digits[::-1] 

triples = [(0, 1, 2), (3, 4, 5), (6, 7, 8), (0, 3, 6), (1, 4, 7), (2, 5, 8), (0, 4, 8), (2, 4, 6)]
for triple in triples:
    i1, i2, i3 = [''.join(str(x) for x in number_to_base(x, 3, l=2)) for x in triple]
    mark = 'o'
    cellmarks = ''.join([f"(cell-mark cell{i} mark-{mark})" for i in (i1, i2, i3)])
    print(f'(when (and {cellmarks}) (won mark-o))')

'''
triples = Qubic.generate_triples()
for triple in triples:
    i1, i2, i3 = [''.join(str(x) for x in number_to_base(x, 3)) for x in triple]
    mark = 'o'
    cellmarks = ''.join([f"(cell-mark cell{i} mark={mark})" for i in (i1, i2, i3)])
    print(f'(when (and {cellmarks}) (won mark-o))')
''' 

"""print('(and\n    (or')
for triple in triples:
    i1, i2, i3 = [''.join(str(x) for x in number_to_base(x, 3)) for x in triple]
    mark = 'x'
    print(f'''        (and
            (cell-mark cell{i1} mark-{mark})
            (cell-mark cell{i2} mark-{mark})
            (cell-mark cell{i3} mark-{mark})
        )''')
print('    )\n    (not(or')
for triple in triples:
    i1, i2, i3 = [''.join(str(x) for x in number_to_base(x, 3)) for x in triple]
    mark = 'o'
    print(f'''        (and
            (cell-mark cell{i1} mark-{mark})
            (cell-mark cell{i2} mark-{mark})
            (cell-mark cell{i3} mark-{mark})
        )''')
print('    ))')
"""

