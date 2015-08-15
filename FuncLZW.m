function [S,sz] = LZW(x)  		        % S¿¿¿¿¿¿¿¿¿, sz¿¿¿¿¿¿¿¿¿¿¿; x¿¿¿¿¿
	
	n = length(x);				% n¿¿¿¿¿
	S{1} = x(1); 				% ¿¿¿¿¿¿
	zd(1).z = strcat(x(1),x(2));		% ¿¿¿¿¿¿¿¿  
	zd(1).p = 256;				% ¿¿¿¿¿¿¿¿¿
	sz = 1;					% ¿¿¿¿¿¿¿¿¿¿
	ss = 1;					% ¿¿¿¿¿¿¿¿¿¿¿

	j = 2;			% ¿¿¿ j ¿¿¿¿¿¿¿ 

	while j <= n     		% ¿¿¿¿
		i = n;			% ¿¿¿ i ¿¿(n)¿¿
		h = 1;     		% ¿¿h¿¿¿
		while ( i >= j + 1 && h > 0 )        
			sx = x( j : i );  	% sx ¿¿¿¿¿¿¿¿¿j-i)   
			k = 1;        		% ¿¿¿k
			a = 1;         		% ¿¿a¿¿¿ 
			while ( k <= sz && a > 0 )            
				kl=strcmp(sx,zd(k).z);		% ¿¿¿¿¿¿¿¿¿            
				if kl == 1         		% ¿¿	
					a = 0;                	% ¿¿¿¿¿a¿¿
					ss = ss + 1;            % ¿¿¿¿+1
				   	S{ss} = zd(k).p;        % S¿¿ss¿¿k¿¿¿¿
				   	if (i < n)		% ¿¿¿¿¿¿¿¿¿¿¿¿¿
						sz = sz + 1;  			% sz¿¿¿¿¿¿¿¿¿  
						zd(sz).z = strcat(sx,x(i+1)); 	% ¿¿¿¿
						zd(sz).p = 255 + sz;		% ¿¿¿¿¿¿
					end
				end
				k = k + 1;			% ¿¿¿¿
			end 			% ¿¿¿¿¿¿
		   	if a == 0       	% ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
	       			h = 0;          	% ¿¿¿h¿¿¿¿¿ 
		end         
		i = i - 1;	% ¿¿¿¿¿¿¿¿  
	end 
	if h == 1        	% ¿¿¿¿¿¿¿¿¿¿¿¿¿¿
		sx = x(j);      	% x¿¿¿¿¿¿¿¿
		ss = ss + 1;         	% ss¿¿¿¿¿¿¿¿¿¿
		S{ss} = sx;         	% ¿¿¿¿
		if j < n         	% ¿¿¿¿¿¿¿¿
			sz = sz + 1;          % ¿¿¿¿¿¿¿
			zd(sz).z = strcat(sx,x(j + 1));       	% ¿¿¿¿  
			zd(sz).p = 255 + sz;         		% ¿¿¿¿¿¿
		end     
	end 
	m = length(sx); 	% ¿¿¿¿¿¿¿¿¿¿¿
	j = j + m; 		% ¿¿¿¿¿¿¿¿¿¿
end     
