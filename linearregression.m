close all;
clc;
clear;

data = load('housing_1.txt');

x = data(:, 1);
y = data(:, end);

%create function to plot
function plotData(x,y)
  plot(x, y, 'bo', 'linewidth', 2);
end

%plotting
plotData(x,y);
xlabel('Attributes');
ylabel('Label');

%adding column of ones
size = size(y, 1);
X = [ones(size, 1) x];

% Calculate theta
theta = (pinv(X'*X))*X'*y
y_hip = X*theta;

%Plot2
hold on;
plot(X(:, 2), y_hip, '-r', 'linewidth', 2)
h = legend('Training data', 'Linear regression');
legend(h, 'location', 'northwest');
hold off
