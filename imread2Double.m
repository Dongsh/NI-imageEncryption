function fin = imread2Double(imagePath)
	fin = imread(imagePath);
	fin = rgb2gray(fin);
	fin = 255 * im2double(fin);
end
