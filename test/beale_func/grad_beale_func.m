function g = grad_beale_func(x)
	g = approx_gradient('beale_func',x,0.001);
end