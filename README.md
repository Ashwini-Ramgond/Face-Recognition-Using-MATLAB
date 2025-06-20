# Face-Recognition-Using-MATLAB
function out=load_database()
persistent loaded;
persistent image_matrix;
if(isempty(loaded))
    image_matrix=zeros(5600,400);
    for i=1:40
        cd(strcat('s',num2str(i)));
        for j=1:10
            a=imread(strcat(num2str(j),'.jpg'));
            image_matrix(:,(i-1)*10+j)=reshape(a,size(a,1)*size(a,2),1);
        end
        cd ..
    end
    image_matrix=uint8(image_matrix);
end
loaded=1;
out=image_matrix;

% Load the database of face images
database = load_database();

% Initializations
random_index = randi(400);   % Randomly pick an index.
test_image = database(:, random_index);  % Select the image for testing
training_images = database(:, [1:random_index-1, random_index+1:end]);  % All other images for training

% Compute the mean face from all training images
mean_face = mean(training_images, 2);  % Compute the average face

% Subtract the mean face from all training images
mean_adjusted_training = double(training_images) - mean_face;

% Calculate eigenvectors of the correlation matrix
N = 20;  % Number of eigenfaces to consider
correlation_matrix = mean_adjusted_training' * mean_adjusted_training;
[eigen_vectors, ~] = eig(correlation_matrix);
eigen_vectors = mean_adjusted_training * eigen_vectors;
eigen_vectors = eigen_vectors(:, end:-1:end-(N-1));

% Normalize eigenvectors
for i = 1:N
    eigen_vectors(:, i) = eigen_vectors(:, i) / norm(eigen_vectors(:, i));
end

% Calculate the signature for each training image
signatures = zeros(size(training_images, 2), N);
for i = 1:size(training_images, 2)
    signatures(i, :) = mean_adjusted_training(:, i)' * eigen_vectors;
end

% Display mean face
figure;
imshow(reshape(uint8(mean_face), 80, 70));
title('Mean Face', 'FontWeight', 'bold', 'FontSize', 16, 'Color', 'red');

% Display eigenfaces
figure;
for i = 1:N
    subplot(4, 5, i);
    imshow(reshape(eigen_vectors(:, i), 80, 70), []);
    title(['Eigenface ', num2str(i)], 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'red');
end

% Recognition
figure;
subplot(121); 
imshow(reshape(test_image, 80, 70));
title('Test Image', 'FontWeight', 'bold', 'FontSize', 16, 'Color', 'red');

% Subtract the mean face from the test image
mean_test_image = double(test_image) - mean_face;

% Project the test image onto the eigenfaces
projection = mean_test_image' * eigen_vectors;

% Calculate distances between the test image and all training images
distances = [];
for i = 1:size(training_images, 2)
    distances = [distances, norm(signatures(i, :) - projection, 2)];
end

%Identify the closest match
[min_distance, index] = min(distances);
subplot(122);
imshow(reshape(training_images(:, index), 80, 70));
title('Recognized Image', 'FontWeight', 'bold', 'FontSize', 16, 'Color', 'red');
