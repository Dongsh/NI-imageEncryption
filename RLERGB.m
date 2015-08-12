clear
% uiopen('/Users/Dongsh/Desktop/A.png',1)
image = imread('/Users/Dongsh/Desktop/logo.png');
figure,imshow(image),title('Ô­Í¼');
% imageA = rgb2gray(image);

for i = 1:1:3 
    imageA = image(:,:,i);
imageB = imageA(:);
lengthB = length(imageB);
shape= size(image);
% for i=1:1:lengthB
% 	if imageB(i) >= 127
% 		imageB(i) = 255;
% 	else imageB(i) = 0;
% 	end
% end
imageC = reshape(imageB,shape(1),shape(2));
figure,imshow(imageC);

X = imageC(:);
x = 1:1:length(X);
figure,plot(x,X(x));
j = 1;
imageD = 0;
imageD(1) = 1;
for z = 1:1:(length(X)-1)
	if X(z) == X(z+1)
		imageD(j) = imageD(j)+1;
	else
		data(j) = X(z);
		j = j+1;
		imageD(j) = 1;
	end
end

data(j) = X(length(X));
lengthD = length(imageD);
% y = 1:1:lengthD;
% figure,plot(y,imageD);

CR(i) = lengthB/lengthD;

l = 1;
 for m = 1:lengthD
 	for n = 1:1:imageD(m) 
        rec_image(l) = data(m);
		l = l + 1;
 	end
 end
u = 1:1:length(rec_image);
figure,plot(u,rec_image(u)),title('Ñ¹Ëõ½á¹û');
rec2_image(:,:,i) = reshape(rec_image,shape(1),shape(2));
% figure,imshow(rec2_image);
end
% for i = 1:1:3
%     reImage(:,:,i) = rec2_image(i);
% end
figure,imshow(rec2_image);
