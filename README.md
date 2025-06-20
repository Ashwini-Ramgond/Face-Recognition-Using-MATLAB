Face Recognition Using MATLAB (Eigenfaces – PCA)

This project implements a face recognition system using the Eigenfaces method in MATLAB. By leveraging Principal Component Analysis (PCA), the system extracts key facial features and performs recognition through feature space comparison. This project is ideal for applications such as attendance tracking, access control, and surveillance systems.

Abstract

Face recognition is a biometric identification process that analyzes and compares facial patterns. This system applies PCA to extract "eigenfaces" from a set of training images, reducing dimensionality while preserving essential data. The face in a test image is projected into this reduced feature space, and recognition is performed by comparing the projection with those of the training images using Euclidean distance.

 Objectives

  Develop a PCA-based face recognition system in MATLAB  
- Extract key facial features and construct eigenfaces  
- Match test images with training data using Euclidean distance  
- Evaluate system accuracy under varying lighting and expressions

 Methodology

1. Image Dataset: Load and preprocess a database of grayscale facial images    
2. Feature Extraction: Compute covariance matrix and extract eigenfaces using PCA  
3. Training: Project training images into PCA feature space  
4. Testing: Project test image and compute Euclidean distances to find closest match  
5. Output: Display predicted identity of the test image



  Technologies Used

- MATLAB (R2021b or later)  
- PCA (Principal Component Analysis)  
- Image Processing Toolbox  
- Euclidean Distance Classifier

- Results

- High recognition accuracy achieved  
- Robust against slight facial expression and lighting variations  
- Effective performance with a small set of eigenfaces

  Applications

- Biometric access control systems  
- Automated attendance systems  
- Surveillance and law enforcement  
- Secure user authentication

  Future Scope

- Extend to webcam-based real-time face recognition  
- Integration with CNNs for hybrid PCA-deep learning model  
- Improve robustness against occlusion and poor lighting  
- Deploy on embedded systems (Raspberry Pi + MATLAB Coder)


