function g = grad_func_for_problem_v_quad_regression(x)
	xi = [1:1:10]';
	eta = [-0.5; -2; -3; -3; -2.5; -2; -1; 1; 3; 5.5];
	g = approx_gradient('func_for_problem_v_quad_regression',x,0.00001);
end