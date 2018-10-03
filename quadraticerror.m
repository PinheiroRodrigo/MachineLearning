close all;
clc;
clear;

%2 column of attributes, 1 label column
data = load('housing_2.data');

x = [data(:, 1), data(:, 5), data(:, 6)];
x = [ones(size(x), 1) x];
y = data(:, end);

% Calculate theta
theta = pinv(x'*x)*x'*y

%show coefficients and error
y_erro = x * theta;
Erro = (y_erro - y).^2;
MSE = (1/size(x,1)) * sum(Erro)
