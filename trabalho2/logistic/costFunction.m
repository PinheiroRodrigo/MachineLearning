function [J , grad]= costFunction(theta, X, Y)

m=length(Y);

J=0;

grad=zeros(size(theta));


J= (1/m) * sum(-Y'*log(sigmoid(X*theta))-(1-Y)'*log(1-sigmoid(X*theta)));

grad= (1/m) * sum(X .* (sigmoid(X*theta)-Y));

end
