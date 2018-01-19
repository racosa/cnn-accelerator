rm apply_conv1 input.txt output.txt
g++ -Wall -Werror -g convolution.h ac_fixed.h ac_int.h kernel.h image.h image.cpp kernel.cpp convolution.cpp main.cpp -o apply_conv1
./apply_conv1
diff input.txt output.txt
