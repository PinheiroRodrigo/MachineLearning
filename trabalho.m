close all;
clc;
clear;

X = [0:0.1:1]'; %11 pontos
noise = normrnd(0, 0.3, 11, 1);
y = sin(2*pi*X) + noise;

plot(X, y, "ob", "linewidth", 2);
hold on;

X = [ones(size(X,1),1) X X.^2 X.^3];
%coeficientes
w = pinv(X'*X)*X'*y;
%regularização
alpha = 0.1;
I = eye(size(X, 2));
W = inv(X'*X + alpha*I)*X'*y;

X_novo = [0:0.01:1]';
X_novo = [ones(size(X_novo, 1), 1) X_novo X_novo.^2 X_novo.^3];
y_hip = X_novo * W;

plot(X_novo(:, 2), y_hip, "-r", "linewidth", 2);


y_erro = X*w;
Erro = (y_erro -y).^2;
SME = (1/size(X,1))*sum(Erro)
