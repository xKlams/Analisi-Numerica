function b = backwardrow(A,b)
    n = size(A,1);
    for i = n:-1:1
        for j = i+1:n
            b(i) = b(i) - A(i,j)* b(j);
        end
        b(i) = b(i) / A(i,i);
    end
end

%example usage

A = [4 3; 0 -1.5];
b = transpose([1 8]);

b = backwardrow(A, b)

A * b
