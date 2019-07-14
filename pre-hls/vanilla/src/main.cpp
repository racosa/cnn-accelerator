/* main.cpp
 * Main function that runs CNN over cifar10 images.
 * By default it is configured to run over 100 images but
 * more images can be download from Dropbox folder (see README
 * for more instructions)
 */

#include <iostream>
#include <iomanip>
#include "../include/cifar10.h"
#include "../include/kernels.h"
#include "../include/convolution.h"
#include "../include/maxpool.h"
#include "../include/print_array.h"
#include "../include/fc.h"
#include "../include/softmax.h"

int main() {
    float images[100*1728];
    float labels[100];
    float conv1_out[24*24*64];
    float conv2_out[12*12*32];
    float conv3_out[6*6*20];
    float mp1_out[12*12*64];
    float mp2_out[6*6*32];
    float mp3_out[3*3*20];
    float reshape_out[180];
    float fc_out[10];

    load_file("../db/100-normalized-images.out", images);
    load_file("../db/100-labels.out", labels);

    Convolution conv_relu_one(conv1_weights, conv1_biases, 64, 24, 3);
    Convolution conv_relu_two(conv2_weights, conv2_biases, 32, 12, 64);
    Convolution conv_relu_three(conv3_weights, conv3_biases, 20, 6, 32);
    Maxpool mp_one(24, 64);
    Maxpool mp_two(12, 32);
    Maxpool mp_three(6, 20);

    float analyzed = 0;
    float detected = 0;
    float assumption = 0;

    for (int n=0; n<100; n++) {
        conv_relu_one.conv_layer(images + n*1728, conv1_out);
        mp_one.maxpool_layer(conv1_out, mp1_out);

        conv_relu_two.conv_layer(mp1_out, conv2_out);
        mp_two.maxpool_layer(conv2_out, mp2_out);

        conv_relu_three.conv_layer(mp2_out, conv3_out);
        mp_three.maxpool_layer(conv3_out, mp3_out);

        reshape(mp3_out, reshape_out);

        fully_connected(reshape_out, local3_weights, fc_out, local3_biases);

        assumption = softmax(fc_out);

        analyzed += 1;
        if (assumption == labels[n]) {
            detected += 1;
        }
        std::cout << "# Analyzed: " << analyzed << "\n";
        std::cout << "# Detected: " << detected << "\n";
        std::cout << "# Rate: " << (detected/analyzed)*100 << "% \n";
    }

    return 0;
}
