#include "cifar10.h"

int read_cifar10(char **buffer) {
    std::ifstream file;
    unsigned int lenght;
    
    file.open("test_batch.bin", std::ios::in | std::ios::binary | std::ios::ate);
    if (!file) {
        std::cout << "# Error opening CIFAR-10 file: test_batch.bin. \n";
        std::cout << "# Please make sure it is located in the folder: /cnn-accelerator/pre-hls/ \n";
        return 1;
    }

    lenght = file.tellg();
    file.seekg(0);

    *buffer = new char[lenght];
    file.read(*buffer, lenght);
    file.close();

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

int print_image(char *image, int index) {
    if(index > 10000) {
        std::cout << "ERROR: Image not found.";
        return 1;
    }
    char channels[3][6] = {"RED", "GREEN", "BLUE"};
    
    std::cout << "Image label: " << (int)(uint8_t)image[0+3073*index] << "\n";

    for (int d = 0; d<3; d++) {
        std::cout << "Channel: " << channels[d] << "\n";
        for (int j = 0; j<32; j++) {
            for (int i = 0; i<32; i++) {
                uint8_t pixel = image[i+32*j+1024*d + 1 + 3073*index];
                if (pixel/10 == 0) {
                    std::cout << "00" << (int)pixel << " ";
                } else if (pixel/100 == 0) {
                    std::cout << "0" << (int)pixel << " ";
                } else {
                    std::cout << (int)pixel << " ";
                }
                
            }
            std::cout << "\n";
        }
        std::cout << "\n";
    }
    return 0;
}
