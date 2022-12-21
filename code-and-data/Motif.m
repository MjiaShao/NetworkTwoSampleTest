
function output = Motif(A, xi1, MotifName)
	% Input: 
	% A: adjacency matrix
	% xi1: 0 compute U-hat; 1: compute G_1-hat; 2: compute G_2-hat
	% MotifName: 'Edge', 'Triangle', 'Vshape', 'ThreeStar'
	% output:
	% corresponding xi1 results
	
	if(~exist('xi1','var'))
		xi1 = 0; 
	end
	n = size(A,1);
	
	
	
	switch MotifName
	case 'Edge'
		switch(xi1)
			case 0
				x = sum(A(:))/(n*(n-1));
				output = x;
			case 1
				y = sum(A,1)/(n-1);
				y = y(:)';
				x = mean(y);
				output = y - x;
			case 2
				z = A;
				z  = z - diag(diag(z));
				y  = sum(z,1) / (n-1);
				y  = y(:)';
				x  = mean(y);
				y  = y - x;
				yy = ones(n,1)*y;
				z  = z - yy - yy' - x;
				z  = z - diag(diag(z));
				output = z;
		end
	case 'Triangle'
		switch(xi1)
			case 0
				x = trace(A^3) / (n*(n-1)*(n-2));
				output = x;
			case 1
				y = (diag(A^3)/2) / ((n-1)*(n-2)/2);
				y = y(:)';
				x = mean(y);
				output = y - x;
			case 2
				z  = A .* (A^2)' / (n-2);
				z  = z - diag(diag(z));
				y  = sum(z,1) / (n-1);
				y  = y(:)';
				x  = mean(y);
				y  = y - x;
				yy = ones(n,1)*y;
				z  = z - yy - yy' - x;
				z  = z - diag(diag(z));
				output = z;
		end
	case 'Vshape'
		switch(xi1)
			case 0
				A2 = A^2;  A2 = A2 - diag(diag(A2));
				x  = sum(A2(:)) / (n*(n-1)*(n-2)/3);
				output = x;
			case 1
				A2 = A^2;  A2 = A2 - diag(diag(A2));
				vv = sum(A,1);
				y  = (vv.*(vv-1)/2 + sum(A2,1)) / ((n-1)*(n-2)/2);
				x  = mean(y);
				y  = y - x;
				output = y;
			case 2
				A2 = A^2;  A2 = A2 - diag(diag(A2));
				vv = sum(A,1);
				z  = (A.*(ones(n,1)*vv-A + vv'*ones(1,n)-A) + A2) / (n-2);
				z  = z - diag(diag(z));
				y  = sum(z,1) / (n-1);
				y  = y(:)';
				x  = mean(y);
				y  = y - x;
				yy = ones(n,1)*y;
				z  = z - yy - yy' - x;
				z  = z - diag(diag(z));
				output = z;
		end
	case 'ThreeStar'
	    switch(xi1)
		    case 0
			    vv  = sum(A,1);
			    vv2 = sum(A.^2,1);
			    vv3 = sum(A.^3,1);
			    x   = sum(vv.^3 - 3*vv2.*vv + 2*vv3)/6 / (n*(n-1)*(n-2)*(n-3)/24);
			    output = x;
		    case 1
			    vv = sum(A,1);
			    vv2 = sum(A.^2,1);
			    vv3 = sum(A.^3,1);
			    y  = zeros(n,1);
			    for(i = 1:n)
				    y(i) = ( vv(i).^3 - 3*vv2(i).*vv(i) + 2*vv3(i) )/6 ...
						    + sum( A(i,:) .* ( (vv-A(i,:)).^2 - vv2 + A(i,:).^2 )/2 );
			    end
			    y  = y / ((n-1)*(n-2)*(n-3)/6);
			    x  = mean(y);
			    y  = y - x;
			    output = y';
		    case 2
			    vv  = sum(A,1);
			    vv2 = sum(A.^2,1);
			    vmat = vv(:) * ones(1,n);
			    vmat2 = vv2(:) * ones(1,n);
			    
			    z = A.*...
				    (...
					    (...
						    (vmat - A).^2 ...
						    - vmat2...
						    + A.^2 ...
					    )/2 ...
					    +...
					    (...
						    (vmat'-A).^2 ...
						    - vmat2'...
						    + A.^2 ...
					    )/2 ...
				    )...
				    +...
				    (...
					    A * diag(vv) * A...
					    - A.^2 * A...
					    - A * (A.^2)...
				    );
			    
			    z  = z - diag(diag(z));
			    
			    z  = z/((n-2)*(n-3)/2);
			    y  = sum(z,1) / (n-1);
			    y  = y(:)';
			    x  = mean(y);
			    y  = y - x;
			    yy = ones(n,1)*y;
			    z  = z - yy - yy' - x;
			    z  = z - diag(diag(z));
			    output = z;
	    end
	end % end switch
	
	
end
