function [S,sz]=LZW(x)			% SΪ���룬szΪ�ֵ����¶���ĸ�����xΪԭ��Ϣ
	n=length(x);
	S{1}=x(1); 					% ��Ϊ�ֵ�Ϊ�գ�����������Ϊ���ظ��ı�������
	zd(1).z=[ x(1),x(2)];	% �ֵ�����Ϊ1 - 2λ����
	zd(1).p=256;				% ��ʾ��Ӧ�ı���
	sz=1;						% sz��ʾ�ֵ����ֵĸ���
	ss=1;						% ss��ʾ���ѹ����ĸ���
	j=2; 
	while j<= n 	% ����     
        
		i=n;
        % y=j
		h=1;	     
		while ( i>=j+1 && h>0 )        
			sx=x(j:i);        
			k=1;        
			a=1;         
			while (k<=sz&&a>0)   % ��ѯ�ֵ�         
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
