function [s,n]=LZW4Im(x)
	sizeOfx = size(x);
	% s = zeros(size(x));
	for i = 1:sizeOfx(1)
		%y = i
		im = x(i,:);
		[a,b] = LZW(im);
		n(i) = b;
		if i == 1
			s = {a};
		else
		 s,i,a,cell2mat(a)
			s(i) = cell2mat(a);
		end
	end
end
