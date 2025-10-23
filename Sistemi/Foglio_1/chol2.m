function L = chol_2(A)
    n = size(A,1)
    L = zeros(n, class(A));
    for j = 1:n
        s = L(j,1:j-1) * L(j,1:j-1)'; 
        L(j,j) = sqrt(A(j,j) - s);
        for i = j+1:n
            t = L(i,1:j-1) * L(j,1:j-1).';
            L(i,j) = (A(i,j) - t) / L(j,j);
        end
    end
end

%TEST

n = 5; alpha = 1e-9;
B = randn(n);
A = B*B' + alpha*eye(n)

L = chol_2(A)

L * transpose(L)