#! octave-interpreter-name -qf
# a sample Octave program
close all;
clc;
clear;
printf ("Hello, world!\n");

X = [0:0.8:5]';
y = 5*sin(2*pi*X);

X = [ones(size(X,1),1) X X.^2 X.^3 X.^4 X.^5 X.^6 X.^7];

plot (X(:,2),y,"o", "linewidth", 2);
hold on;

alpha = 0;
I = eye(size(X,2));
w = pinv(X'*X + alpha*I)*X'*y;


X_novos = [0:0.1:5'];
X_novos = [ones(size(X_novos, 1),1) X_novos X_novos.^2 X_novos.^3 X_novos.^4 X_novos.^5 X_novos.^6 X_novos.^7];

y_h = X_novos*w;

plot(X_novos(:,2),y_h,"-r","linewidth", 2);
hold on;
axis([-10 10 -10 10]);

y_erro = X*w;
Erro = (y_erro -y).^2;
SME = (1/size(X,1))*sum(Erro)
