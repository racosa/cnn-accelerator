/* cifar10.cpp
 * Functions to read and print cifar10 files.
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "../include/cifar10.h"

int load_file(const char *file_name, float *buffer) {
    std::ifstream file(file_name);
    int i = 0;
    if (file.good()) {
        float item = 0;
        while(file >> item) {
            buffer[i] = item;
            i++;
        }
        file.close();
        return 0;
    }
    return 1;
}

int read_cifar10(uint8_t *images, uint8_t *labels) {
    std::ifstream file;
    unsigned int lenght;
    char *buffer;
    int label_bytes = 0;
    
    file.open("test_batch.bin", std::ios::in | std::ios::binary | std::ios::ate);
    if (!file) {
        std::cout << "# Error opening CIFAR-10 file: test_batch.bin. \n";
        std::cout << "# Please make sure it is located in the folder: /cnn-accelerator/pre-hls/ \n";
        return 1;
    }

    lenght = file.tellg();
    file.seekg(0);

    buffer = new char[lenght];
    file.read(buffer, lenght);
    file.close();
    
    for (int i=0; i < 10000; i++) {
        labels[i] = (uint8_t)buffer[i*3073];
    }
    
    for (int j = 0; j < 10000*3073; j++) {
        if (j%3073 == 0) {
            label_bytes++;
        }
        else {
            images[j - label_bytes] = (uint8_t)buffer[j];
        }
    }
    
    delete[] buffer;
    return 0;
}

/* void print_image(char *image, int index):
 *
 * First byte is the label (0-9).
 * Then each 32 bytes represents a row.
 * First 1024 bytes = RED channel,
 * the next 1024 = GREEN channel, 
 * and the final 1024 = BLUE channel.
 */

int print_image(double *images, uint8_t *labels,  int index, bool normalized) {
    char channels[3][6] = {"RED", "GREEN", "BLUE"};
    int width = 32;
    int channel_size = 1024;
    int image_size = 3072;
    
    if(index >= 10000) {
        std::cout << "ERROR: Image not found.";
        return 1;
    } else if (normalized) {
        width = 24;
        channel_size = 576;
        image_size = 1728;
    }
    
    std::cout << "Image label: " << (int)labels[index] << "\n";

    for (int d = 0; d<3; d++) {
        std::cout << "Channel: " << channels[d] << "\n";
        for (int j = 0; j<width; j++) {
            for (int i = 0; i<width; i++) {
                double pixel = images[i+width*j+channel_size*d + image_size*index];
                if (pixel/10 == 0) {
                    std::cout << "00" << pixel << " ";
                } else if (pixel/100 == 0) {
                    std::cout << "0" << pixel << " ";
                } else {
                    std::cout << pixel << " ";
                }
                std::cout << pixel << " ";   
            }
            std::cout << "\n";
        }
        std::cout << "\n";
    }
    return 0;
}
