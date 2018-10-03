X = [1 1; 2 2; 3 3; 4 4];
y = [1 1 2 2]';%'
[X y];

X_novo = [5 5];


distancia = @(x, M) sqrt(sum((M, -x), ^2, 2));

dist = distancia(X_novo, X);

[v_ordenado indices] = sortrows(dist);

k = 3;
