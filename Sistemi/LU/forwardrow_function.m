function b = forwardrow(A,b)
    n = size(A,1);
    for i = 1:n
        for j = 1:i-1
            b(i) = b(i) - A(i,j)* b(j);
        end
        b(i) = b(i) / A(i,i);
    end
end

%example usage

A = [1 0; 1.5 1];
b = transpose([1 8]);

b = forwardrow(A, b)

A * b