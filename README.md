# Convolutional Neural Network (CNN) Hardware Accelerator
# gitlab.com/racosa/cnn-accelerator
#
# authors: Rafael COSTA SALES
#          Duc Huy DAO

## Directories:

- ./algorithm/cnn: CNN reference code in python used to classify 
  images of the cifar-10 test_batch (for more instructions see ./algorithm/cnn/README).

- ./pre-hls: CNN pre-hls code 

  -- ./pre-hls/db: database folder with cifar10 images and labels.
  
  -- ./pre-hls/vanilla: CNN implementation in C++, also tested
      with cifar-10 test_batch  (for more instructions see ./pre-hls/vanilla/README).
      
  -- ./pre-hls/fixed-point: CNN implementation in C++ using fixed poit
      precision with the library ac_fixed  (for more instructions see ./pre-hls/fixed-point/README).

- ./hls: HLS code used to generate Convolution+ReLU RTL with Catapult.

- ./fpga: top level VHDL entity used test Convolution+ReLU layer on FPGA 
  and generated bitstreams.

## Research and Study links

- [Deep Learning Book](http://www.deeplearningbook.org/): Focus on Chap. 1, 6, 9, 11 and 12.

- [Stanford Course CS231n: Convolutional Neural Networks for Visual Recognition](http://cs231n.stanford.edu/syllabus.html)
   + [Project Report: Design and Analysis of a Hardware CNN Accelerator](http://cs231n.stanford.edu/reports/2017/pdfs/116.pdf)
   + [Assignments 1, 2 and 3](https://github.com/shenxudeu/Convnet): experiments of someone based on course assignments.   

- [Hardware Acceleration of Convolutional Neural Networks](https://daim.idi.ntnu.no/masteroppgaver/013/13656/masteroppgave.pdf)

- [AI GitBook - ReLU Layer](https://leonardoaraujosantos.gitbooks.io/artificial-inteligence/content/relu_layer.html)

- [Krizhevsky et al. - ImageNet Challenge Winner 2012](http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf)

- [Intuitive Explanation to ConvNets](https://ujjwalkarn.me/2016/08/11/intuitive-explanation-convnets/)

- [Convolution](https://beckernick.github.io/convolutions/)

## Tutorials

- [Python Numpy Tutorial](http://cs231n.github.io/python-numpy-tutorial/)
- [C++ Template Tutorial](https://cpp.developpez.com/cours/cpp/?page=page_14)
