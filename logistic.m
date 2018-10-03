clc;
close all;
clear all;

base = load("alunos.txt");
%       (linhas, colunas)
x = base(:, [1, 2]);
y = base(:, 3);

% numero de exemplos
m = size(x, 1);
% adicionar termos independentes
x = [ones(m,1) x];

%função anonima pra calcular o custo
h = @(x, w) 1/(1 + exp(-x*w));


% coeficientes
% termo independente + termo associado a cada coluna de x
% w1 + w2*x2 + w3*x3
w = zeros(size(x, 2), 1);

%inicializacões
max_update = 100;
j = zeros(max_update, 1);
alpha = 0.01;

for update = 1:max_update
  %calculo da função de custo
  for i=1:m;
    j(update) = j(update) + y(i) * log(h(x(i, :), w)) + (1-y(i)) * log(1 - h(x(i, :), w));
  end;
  j(update) = (1/m) * j(update);

  %atualizacao dos pesos (coeficientes)
  w1_temp = 0;
  w2_temp = 0;
  w3_temp = 0;
  for i=1;m;
    w1_temp = w1_temp + (h(x(i, :), w) - y(i)) * x(i, 1);
    w2_temp = w1_temp + (h(x(i, :), w) - y(i)) * x(i, 2);
    w3_temp = w1_temp + (h(x(i, :), w) - y(i)) * x(i, 3);
  end;
  w(1) = w(1) - alpha*(1/m)*w1_temp;
  w(2) = w(2) - alpha*(1/m)*w2_temp;
  w(3) = w(3) - alpha*(1/m)*w3_temp;
end;
w
y_hipotese = round(h(x, w))
