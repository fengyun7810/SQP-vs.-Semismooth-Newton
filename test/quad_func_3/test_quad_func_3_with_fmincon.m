function test_quad_func_3_with_fmincon()
    lambda = 1;
    a = [3; 6; 2];
    b = [10; 20; 9];
    x0 = [8; 17; 4];
    tol = 0.001;
    itmax = 100;
    A = [ -eye(length(a)); eye(length(b)) ];
    c = [ -a; b ];
    options = optimset('Algorithm','active-set','Display','off');
    tic;
    [x_as,fval_as,exitflag,output] = fmincon('quad_func_3_v0',x0,[],[],[],[],a,b,[],options);
    t_as = toc;
    x1 = sprintf('%.3f ',x_as);
    f1 = sprintf('f(x_as) = %.3f',fval_as);
    t1 = sprintf('solved in %.2f ms.',t_as*1000);
    str1 = ['x_as = [ ', x1, '], ', f1, ', ', t1];
    options = optimset('Algorithm','sqp','Display','off');
    tic;
    [x_sqp,fval_sqp,exitflag,output] = fmincon('quad_func_3_v0',x0,[],[],[],[],a,b,[],options);
    t_sqp = toc;
    x2 = sprintf('%.3f ',x_sqp);
    f2 = sprintf('f(x_sqp) = %.3f',fval_sqp);
    t2 = sprintf('solved in %.2f ms.',t_sqp*1000);
    str2 = ['x_sqp = [ ', x2, '], ', f2, ', ', t2];
    a = sprintf('%.3f ',a);
    b = sprintf('%.3f ',b);
    x0 = sprintf('%.3f ',x0);
    str0 = ['a = [ ', a, '], b = [ ', b, '], x0 = [ ', x0, ']'];
    disp(str0);
    disp(str1);
    disp(str2);
end
