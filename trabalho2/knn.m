close all;
clc;
clear;

data = load('base_artificial.txt');

% training base
training_neg = data(1:25, 1:2);
training_pos = data(41:65, 1:2);
total = [training_neg; training_pos];
training_labels = [data(1:25, 3); data(41:65, 3)];
% test base
test_base = [data(26:40, 1:2); data(66:80, 1:2)];
test_labels = [data(26:40, 3); data(66:80, 3)];

plot(training_neg(:, 1), training_neg(:, 2), 'or', 'LineWidth', 1);
hold on;
plot(training_pos(:, 1), training_pos(:, 2), 'ob', 'LineWidth', 1)
hold on;
plot(test_base(:, 1), test_base(:, 2), 'og', 'LineWidth', 2)

%função anônima pra distancia euclidiana
% x é a matriz a ser classificado, M é a matriz de exemplos
distancia = @(x,M) sqrt(sum((M.-x).^2,2));
distancia(test_base(1, :), total);

%iniciando variáveis
k = 3;
y_hip = ones(1, 30);

for j = 1:length(test_base)
  votacao = 0;

  dist = distancia(test_base(j, :), total);
  [v_ordenado indices] = sortrows(dist);

  for i = 1:k
    label = training_labels(indices(i));
    votacao = votacao + label;
  end

  if (votacao >= 2)
    y_hip(j) = 1;
  else
    y_hip(j) = 0;
  end
end

%calculando matriz de confusao e acuracia
[C, acuracia] = confmat(transpose(y_hip), test_labels)
