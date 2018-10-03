close all;
clc;
clear;

function J = computeCost(X, y, theta)

m = length(y); % number of training examples

J = 0;

predictions = X*theta;
sqrErrors   = (predictions - y).^2;

J = 1/(2*m) * sum(sqrErrors);

end

function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

  for iter = 1:num_iters

    x = X(:,2);
    h = theta(1) + (theta(2)*x);

    theta_zero = theta(1) - alpha * (1/m) * sum(h-y);
    theta_one  = theta(2) - alpha * (1/m) * sum((h - y) .* x);

    theta = [theta_zero; theta_one];

    J_history(iter) = computeCost(X, y, theta);
  end

  disp(min(J_history));
end

data = load('housing_1.txt');

x = data(:, 1:2);
y = data(:, end);

alpha = 0.01;
num_iters = 400;
theta = zeros(3, 1);

[theta, J_history] = gradientDescent(x, y, theta, alpha, num_iters);

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
