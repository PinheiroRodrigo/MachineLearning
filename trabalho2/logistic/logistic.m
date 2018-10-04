
clear ; close all; clc

data= load('alunos.txt');
X=data(:,[1,2]);
Y=data(:,3);


plotData(X, Y);

hold on;

[m, n]= size(X);
X=[ones(m,1) X];

initial_theta=zeros(n+1,1);
[cost , grad]= costFunction(initial_theta, X, Y);
fprintf('Custo do theta inicial: %f\n', cost);
fprintf('Gradiente do theta inicial : \n');
disp(grad);
options=optimset('GradObj', 'on', 'MAxIter', 400);
[theta , cost]=...
fminunc(@(t)(costFunction(t, X, Y)), initial_theta , options);
fprintf('theta: \n');
disp(theta);


Boundary(theta, X, Y);
hold on;


xlabel('Nota Prova 1')
ylabel('Nota Prova 2')
legend('Aprovado', 'Reprovado')
hold off;
