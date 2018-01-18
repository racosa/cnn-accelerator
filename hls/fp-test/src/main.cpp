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
    ac_fixed<FIXP_IMAGES_W, FIXP_IMAGES_I, true> images[100*1728];
    ac_fixed<FIXP_LABELS_W, FIXP_LABELS_I, false> labels[100];
    ac_fixed<FIXP_CONV1_W, FIXP_CONV1_I, true> conv1_out_fp[24*24*64];
    ac_fixed<FIXP_CONV2_W, FIXP_CONV2_I, true> conv2_out_fp[12*12*32];
    ac_fixed<FIXP_CONV3_W, FIXP_CONV3_I, true> conv3_out_fp[6*6*20];
    double mp1_out[12*12*64];
    double mp2_out[6*6*32];
    double mp3_out[3*3*20];
    double reshape_out[180];
    double fc_out[10];

    load_file("../db/100-normalized-images-fixW8I2.out", images);
    load_file("../db/100-labels.out", labels);

    /*double images[100*1728];
    for (int i = 0; i < 100*1728; i++) images[i] = ld_images[i].to_double();
    //pause
    //std::cin.ignore(1024, '\n');std::cout << "Press enter to continue...";std::cin.get();
    double labels[100];
    for (int i = 0; i < 100; i++) labels[i] = ld_labels[i].to_double();
    //std::cin.ignore(1024, '\n');std::cout << "Press enter to continue...";std::cin.get();*/

    Convolution conv_relu_one(conv1_weights, conv1_biases, 64, 24, 3);
    Convolution conv_relu_two(conv2_weights, conv2_biases, 32, 12, 64);
    Convolution conv_relu_three(conv3_weights, conv3_biases, 20, 6, 32);
    Maxpool mp_one(24, 64);
    Maxpool mp_two(12, 32);
    Maxpool mp_three(6, 20);

    float analyzed = 0;
    float detected = 0;
    float assumption = 0;
    //double softmax_in[10];

    double conv1_out[24*24*64];
    double conv2_out[12*12*32];
    double conv3_out[6*6*20];

    ac_fixed<FIXP_MP1_W, FIXP_MP1_I, true> mp1_out_fp[12*12*64];
    ac_fixed<FIXP_MP2_W, FIXP_MP2_I, true> mp2_out_fp[6*6*32];
    //ac_fixed<FIXP_MP3_W, FIXP_MP3_I, true> mp3_out_fp[3*3*20];

    for (int n=0; n<100; n++) {
        conv_relu_one.conv_layer(images + n*1728, conv1_out_fp);
        for (int i = 0; i < 24*24*64; i++) conv1_out[i] = conv1_out_fp[i].to_double();
        mp_one.maxpool_layer(conv1_out, mp1_out);
        for (int i = 0; i < 12*12*64; i++) mp1_out_fp[i] = mp1_out[i];

        conv_relu_two.conv_layer(mp1_out_fp, conv2_out_fp);
        for (int i = 0; i < 12*12*32; i++) conv2_out[i] = conv2_out_fp[i].to_double();
        mp_two.maxpool_layer(conv2_out, mp2_out);
        for (int i = 0; i < 6*6*32; i++) mp2_out_fp[i] = mp2_out[i];

        conv_relu_three.conv_layer(mp2_out_fp, conv3_out_fp);
        for (int i = 0; i < 6*6*20; i++) conv3_out[i] = conv3_out_fp[i].to_double();
        mp_three.maxpool_layer(conv3_out, mp3_out);

        /*ac_fixed<FIXP_MAXPOOL_W, FIXP_MAXPOOL_I, true> mp3_out_fp[3*3*20];
        for (int i = 0; i < 3*3*20; i++) mp3_out_fp[i] = mp3_out[i];*/
        reshape(mp3_out, reshape_out);

        /*ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true> reshape_out_fp[180];
        for (int i = 0; i < 180; i++) reshape_out_fp[i] = reshape_out[i];*/
        fully_connected(reshape_out, local3_weights, fc_out, local3_biases);

        //ac_fixed<FIXP_FC_W, FIXP_FC_I, true> softmax_temp[10];
        //for (int i = 0; i < 10; i++) {softmax_temp[i] = fc_out[i]; softmax_in[i] = softmax_temp[i].to_double();}
        //for (int i = 0; i < 10; i++) softmax_in[i] = (double)fc_out[i];
        //for (int i = 0; i < 10; i++) softmax_in[i] = fc_out[i].to_double();
        //assumption = softmax(softmax_in);
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
