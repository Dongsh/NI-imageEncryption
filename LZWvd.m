function [S,n] = LZWvd(x)
    size = sizeof(x);
    omiga = 0;
    S{1}=x(1); 
    code(1).word = x(1);
    code(1).num = 256;
    sn = 1;
    cn = 1;
    % for i = 1:1:length(x)
    i = 1;
    while i ~= length(x)
%         omiga = x(i);
        if i == 1
             k = x(i+1);
            for j = 1:length(code)
                if [k] == code(j).word;
                    omiga = [k];
                else 
                    for e = 1:length(omiga)
                        sn = sn + 1;
                        S(sn) = omiga(e);
                    end
                    cn = cn+1;
                    code(cn).word = omiga;
                    code(cn).code = code(cn-1)+1;
                end
       
                
                    
              