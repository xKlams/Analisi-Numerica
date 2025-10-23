function A = lukji(A)
    n = size(A,1);
    for k=1:n-1
        for i = k+1 : n
            A(i,k) = A(i,k)/A(k,k);
            for j = k+1 : n
                A(i,j) = A(i,j) - A(i,k)*A(k,j);
            end
        end
    end
end


%Example usage
B = [23 1 ; 1 1];

B = lukji(B);
U = triu(B)
L = tril(B, -1) + eye(size(B,1))
