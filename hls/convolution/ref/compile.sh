rm apply_conv input.txt output.txt
g++ -Wall -Werror -g convolution.h ac_fixed.h ac_int.h kernel.h image.h image.cpp kernel.cpp convolution.cpp testbench.cpp -o apply_conv
./apply_conv

