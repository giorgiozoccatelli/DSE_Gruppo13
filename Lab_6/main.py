import random

with open('file_input.txt', 'w') as output_file:
  for _ in range(1024):
    random_binary_string = ''.join(random.choices(['0', '1'], k=8))
    output_file.write(random_binary_string + '\n') 
