function [S,sz]=LZW(x)			% S为编码，sz为字典中新短语的个数，x为原消息
	n=length(x);
	S{1}=x(1); 
	zd(1).z=strcat(x(1),x(2));	% 表示对应的字 
	zd(1).p=256;				% 表示对应的编码
	sz=1;						% sz表示字典中字的个数
	ss=1;						% ss表示输出压缩码的个数
	j=2; 
	while j<=n     
		i=n;h=1;     
		while ( i>=j+1 && h>0 )        
			sx=x(j:i);        
			k=1;        
			a=1;         
			while (k<=sz&&a>0)            
				kl=strcmp(sx,zd(k).z);            
				if kl==1                
					a=0;                
					ss=ss+1;                
				    S{ss}=zd(k).p;                
				    if (i<n)
					    sz=sz+1;                     
						zd(sz).z=strcat(sx,x(i+1)); 
						zd(sz).p=255+sz;
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
			zd(sz).z=strcat(sx,x(j+1));         
			zd(sz).p=255+sz;         
		end     
	end 
	m=length(sx);     
	j=j+m; 
end     
