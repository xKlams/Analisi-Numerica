function f = thomas(a,b,c,f)
    n = length(f);
    for i = 2:n
        beta = b(i-1) / a(i-1);
        a(i) = a(i) - beta * c(i-1);
        f(i) = f(i) - beta * f(i-1);
    end

    f(n) = f(n) / a(n);
    for i = n-1:-1:1
        f(i) = (f(i) - c(i) * f(i+1)) / a(i);
    end
end


% Esempio: sistema tridiagonale A x = f
n = 5;
a = 2*ones(n,1);           % diagonale principale
b = -1*ones(n-1,1);        % sotto-diagonale inferiore
c = -1*ones(n-1,1);        % sotto-diagonale superiore
f = (1:n).';               % termine noto

% Risolvo con Thomas (in-place su f)
x = thomas(a,b,c,f);

% Verifica con matrice piena (solo per controllo)
A = diag(a,0) + diag(b,-1) + diag(c,1)

disp('Soluzione x:'), disp(x)