function H = hess_quad_regression_func(x)
	eta = [-8; -7; -6; -5; -2; 1; 5; 12; 17; 25];
	xi = [1:1:10]';
	H = approx_hessian('quad_regression_func',x,0.001);
end