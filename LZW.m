function [S,sz]=LZW(x)			% S为编码，sz为字典中新短语的个数，x为原消息
	n=length(x);
	S{1}=x(1); 					% 因为字典为空，因此输出首项为非重复的编码首项
	zd(1).z=[ x(1),x(2)];	% 字典首项为1 - 2位连接
	zd(1).p=256;				% 表示对应的编码
	sz=1;						% sz表示字典中字的个数
	ss=1;						% ss表示输出压缩码的个数
	j=2; 
	while j<= n 	% 遍历     
        
		i=n;
        % y=j
		h=1;	     
		while ( i>=j+1 && h>0 )        
			sx=x(j:i);        
			k=1;        
			a=1;         
			while (k<=sz&&a>0)   % 查询字典         
				% kl=strcmp(sx,zd(k).z);  
				if size(sx) == size(zd(k).z)        
					if sx == zd(k).z              
						a=0;                
						ss=ss+1;                
					    S{ss}=zd(k).p;                
					    if (i<n)
						    sz=sz+1;                     
							% zd(sz).z=strcat(sx,x(i+1)); 
							zd(sz).z = [sx x(i+1)];
							zd(sz).p=255+sz;
						end
					end
				end
				k=k+1;
			end 
		    if a==0        
	        h=0;          
	    end         
		i=i-1;  
	 end 
	if h == 1        
		sx=x(j);         
		ss=ss+1;         
		S{ss}=sx;         
		if j<n         
			sz=sz+1;          
			% zd(sz).z=strcat(sx,x(j+1));  
			zd(sz).z = [sx x(j+1)];       
			zd(sz).p=255+sz;         
		end     
	end 
	m=length(sx);     
	j=j+m; 
end     
