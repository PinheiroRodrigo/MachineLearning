close all;
clc;
clear;

dataSet = load('../housing_1.txt');

x = dataSet(:, 1);
y = dataSet(:, 3);

normalization = true;

if (normalization)
    maxX = max(x);
    minX = min(x);
    x = (x - maxX) / (maxX - minX);
end

x = [ones(length(x), 1) x];

parameters = [0; 0];
learningRate = 0.1;
repetition = 2000;
[parameters, costHistory] = gradient(x, y, parameters, learningRate, repetition);
disp(parameters);

figure;
plot(min(x(:, 2)):max(x(:, 2)), parameters(1) + parameters(2) * (min(x(:, 2)):max(x(:, 2))), '-r', 'linewidth', 2);
hold on;
plot(x(:, 2), y, 'ob', 'linewidth', 2);
