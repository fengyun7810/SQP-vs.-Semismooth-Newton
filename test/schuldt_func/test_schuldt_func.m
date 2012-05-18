function [x_ssn,it_ssn,t_ssn,x_sqp,it_sqp,t_sqp] = test_schuldt_func(show)
    a = [-10; 0];
    b = [10; 10];
    x0 = [0.7;0.5];
    tol = 0.0001;
    itmax = 100;
    G = [ -eye(length(a)); eye(length(b)) ];
    r = [ -a; b ];
    tic;
    %[x_ssn,fval_ssn,it_ssn] = active_set_strategy('schuldt_func','grad_schuldt_func','hess_schuldt_func',G,r,x0,itmax,tol);
    [x_ssn,fval_ssn,it_ssn] = semismooth_newton('schuldt_func','grad_schuldt_func','hess_schuldt_func',G,r,x0,itmax,tol);
    t_ssn = toc;
    x1 = sprintf('%.3f ',x_ssn);
    f1 = sprintf('f(x_ssn) = %.3f',fval_ssn);
    t1 = sprintf('solved in %.2f ms.',t_ssn*1000);
    str1 = ['x_ssn = [ ', x1, '], ', f1, ', it = ', num2str(it_ssn), ', ', t1];
    tic;
    [x_sqp,fval_sqp,it_sqp] = seq_quad_prog('schuldt_func','grad_schuldt_func','hess_schuldt_func',G,r,x0,itmax,tol);
    t_sqp = toc;
    x2 = sprintf('%.3f ',x_sqp);
    f2 = sprintf('f(x_sqp) = %.3f',fval_sqp);
    t2 = sprintf('solved in %.2f ms.',t_sqp*1000);
    str2 = ['x_sqp = [ ', x2, '], ', f2, ', it = ', num2str(it_sqp), ', ', t2];
    if ( nargin == 0 )
        show = 1;
    end
    if ( show == 1 )
        a = sprintf('%.3f ',a);
        b = sprintf('%.3f ',b);
        x0 = sprintf('%.3f ',x0);
        str0 = ['a = [ ', a, '], b = [ ', b, '], x0 = [ ', x0, ']'];
        disp(str0);
        disp(str1);
        disp(str2);
    end
end
