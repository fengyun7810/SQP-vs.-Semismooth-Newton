function y = paviani_func(x)
	y = 0;
	for k=1:2
		y = y - ( (log(x(k)-2))^2 + (log(10-x(k)))^2 );
	end
end