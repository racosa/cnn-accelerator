/* fc.cpp
 * Reshape and Fully Connected (Perceptron) layers.
 */

void reshape(float input[], float output[]){

	int output_length = 0;

	for (unsigned int i = 0; i < 3; i++) { // height last
		for (unsigned int j = 0; j < 3; j++) { // width second
			for (unsigned int k = 0; k < 20; k++) { // canal first
				output[output_length] = input[k*3*3 + i*3 + j];
				output_length++;
			}
		}
	}

}


void fully_connected(float input[], const float matrix[], float output[], const float bias[]){

	for (unsigned int i = 0; i < 10; i++) {
		output[i] = 0;
		for (unsigned int j = 0; j < 180; j++) {
			output[i] += input[j]*matrix[j*10 + i];
		}
		output[i]+=bias[i];
	}
}
