function H = hess_func_for_problem_A_huang_aggerwal_hs51(x)
	Q = 2*[1 -1 0 0 0; -1 2 1 0 0; 0 1 1 0 0; 0 0 0 1 0; 0 0 0 0 1];
	c = 6;
	q = [0; -4; -4; -2; -2];
	H = Q;
end