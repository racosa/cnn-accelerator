import re

input_name = 'coeff.txt'
output_name = 'new_coeff.py'

with open(input_name, 'r', encoding='ascii') as input:
    for line in input:
        new_line = re.sub(r'(?<=\d)\s', ',', line)
        new_line = re.sub(r'[]]\s', '],', new_line)
        new_line = re.sub(r'[]]]]][,]', ']]]])', new_line)
        print(new_line)
        with open(output_name, 'a', encoding='ascii') as output:
            output.write(new_line+'\n')
