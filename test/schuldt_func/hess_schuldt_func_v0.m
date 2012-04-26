function H = hess_schuldt_func_v0(x)
	lambda = 0.03;
	H = hess_schuldt_func(x) + lambda*eye(length(x));
end