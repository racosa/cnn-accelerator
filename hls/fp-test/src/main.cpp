#include <iostream>
#include <iomanip>
#include "../include/cifar10.h"
#include "../include/kernels.h"
#include "../include/convolution.h"
#include "../include/maxpool.h"
#include "../include/print_array.h"
#include "../include/fc.h"
#include "../include/softmax.h"
#include "../include/fixed_point.h"

int main() {
    float ld_images[100*1728];
    float ld_labels[100];
    ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true> conv1_out[24*24*64];
    ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true> conv2_out[12*12*32];
    ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true> conv3_out[6*6*20];
    ac_fixed<FIXP_MAXPOOL_W, FIXP_MAXPOOL_I, true> mp1_out[12*12*64];
    ac_fixed<FIXP_MAXPOOL_W, FIXP_MAXPOOL_I, true> mp2_out[6*6*32];
    ac_fixed<FIXP_MAXPOOL_W, FIXP_MAXPOOL_I, true> mp3_out[3*3*20];
    ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true> reshape_out[180];
    ac_fixed<FIXP_FC_W, FIXP_FC_I, true> fc_out[10];

    load_file("../db/100-normalized-images.out", ld_images);
    load_file("../db/100-labels.out", ld_labels);

    ac_fixed<FIXP_IMAGES_W, FIXP_IMAGES_I, true> images[100*1728];
    for (int i = 0; i < 100*1728; i++) images[i] = ld_images[i];
    ac_fixed<FIXP_LABELS_W, FIXP_LABELS_I, false> labels[10];
    for (int i = 0; i < 100; i++) labels[i] = ld_labels[i];

    Convolution conv_relu_one(conv1_weights, conv1_biases, 64, 24, 3);
    Convolution conv_relu_two(conv2_weights, conv2_biases, 32, 12, 64);
    Convolution conv_relu_three(conv3_weights, conv3_biases, 20, 6, 32);
    Maxpool mp_one(24, 64);
    Maxpool mp_two(12, 32);
    Maxpool mp_three(6, 20);

    ac_fixed<FIXP_LABELS_W, FIXP_LABELS_I, true> analyzed = 0;
    ac_fixed<FIXP_LABELS_W, FIXP_LABELS_I, true> detected = 0;
    ac_fixed<FIXP_LABELS_W, FIXP_LABELS_I, true> assumption = 0;
    double softmax_in[10];

    for (int n=0; n<100; n++) {
        conv_relu_one.conv_layer(images + n*1728, conv1_out);
        mp_one.maxpool_layer(conv1_out, mp1_out);

        conv_relu_two.conv_layer(mp1_out, conv2_out);
        mp_two.maxpool_layer(conv2_out, mp2_out);

        conv_relu_three.conv_layer(mp2_out, conv3_out);
        mp_three.maxpool_layer(conv3_out, mp3_out);

        reshape(mp3_out, reshape_out);

        fully_connected(reshape_out, local3_weights, fc_out, local3_biases);

        ac_fixed<FIXP_FC_W, FIXP_FC_I, true> softmax_temp[10];
        for (int i = 0; i < 10; i++) {softmax_temp[i] = fc_out[i]; softmax_in[i] = softmax_temp[i].to_double();}
        //for (int i = 0; i < 10; i++) softmax_in[i] = (double)fc_out[i];

        assumption = softmax(softmax_in);


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
