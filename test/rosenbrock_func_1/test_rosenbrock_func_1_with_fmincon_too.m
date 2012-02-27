function test_rosenbrock_func_1_with_fmincon_too()
	lambda = 0.000000001;
	a = [-2; -2];
	b = [0; 2];
	x0 = [-1.9; 2];
	tol = 0.0001;
	itmax = 10000;
	[x,fval,it] = semismooth_newton('rosenbrock_func_1','grad_rosenbrock_func_1','hess_rosenbrock_func_1',lambda,a,b,x0,itmax,tol)
	A = [ -eye(length(a)); eye(length(b)) ];
	c = [ -a; b ];
	[x,fval,it] = sqp('rosenbrock_func_1_v0','grad_rosenbrock_func_1_v0','hess_rosenbrock_func_1_v0',A,c,x0,itmax,tol)
	options=optimset('Algorithm','active-set');
	[x,fval] = fmincon('rosenbrock_func_1_v0',x0,[],[],[],[],a,b,[],options)
end