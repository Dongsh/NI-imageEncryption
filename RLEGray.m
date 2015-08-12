image = imread('/Users/Dongsh/Desktop/A.png');  % 读取图像image
imageA = rgb2gray(image);   % 灰度图像处理
imageB = imageA(:);         % 将二维图像摊平为一位数列
lengthB = length(imageB);   
shape= size(image);

% 将图像二值化处理(0或255) 
% 若采用二值化操作则压缩率上升
% for i=1:1:lengthB         % 1到lengthB之间步步长为1的等差递增数列
%   if imageB(i) >= 127     
%       imageB(i) = 255;    
%   else imageB(i) = 0;     
%   end
% end

imageC = reshape(imageB,shape(1),shape(2));     % 恢复一维数列到原始图像
figure,imshow(imageC);

%游值压缩算法开始
X = imageC(:);          % 摊平       
x = 1:1:length(X);      % x为X大小的等差数列
figure,plot(x,X(x));    % 展示图像分布

j = 1;      % 遍历计数器 j 赋值 1
imageD(1) = 1;  % 像素计数器集合imageD 首项赋1
for z = 1:1:(length(X)-1)       % 循环遍历X图（数组）
	if X(z) == X(z+1)           
		imageD(j) = imageD(j)+1;    % 若两个相邻像素同色即计数器计数1
	else
		data(j) = X(z);             % 否则记住前像素的色值
		j = j+1;                    % 遍历计数器下跳
		imageD(j) = 1;              % 像素计数器置1
	end
end

data(j) = X(length(X));             % 最后的像素色值赋值（考虑最后像素独立不同）
lengthD = length(imageD);           
y = 1:1:lengthD;                   
figure,plot(y,imageD);              % 展示压缩后图像像素分布

CR = lengthB/lengthD;               % 计算CR 压缩比

l = 1;
 for m = 1:lengthD                  % 解压算法
	for n = 1:1:imageD(m)           % 按计数器与数据值填入像素 
		rec_image(l) = data(m);     
		l = l + 1;
	end
 end
								   
u = 1:1:length(rec_image);
figure,plot(u,rec_image(u));        % 展示解压后图像分布
rec2_image = reshape(rec_image,shape(1),shape(2));
figure,imshow(rec2_image);          % 展示解压图像