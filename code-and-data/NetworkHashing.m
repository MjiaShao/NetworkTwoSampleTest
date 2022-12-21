function [NetStatList] = NetworkHashing(A, MotifNameList)
	
	
	NetStatList = {};
	
	for (MotifIndex = 1:length(MotifNameList))
	
		MotifName = MotifNameList{MotifIndex};
		
		switch MotifName
			case 'Triangle'
				r = 3;  s = 3;
			case 'Vshape'
				r = 3;  s = 2;
			case 'ThreeStar'
				r = 4;  s = 3;
		end
		
		m = size(A,1);
        % first calculate all statistics needed from A
        rho_ahat = sum(A(:))/(m*(m-1));
        u_mhat = Motif(A, 0, MotifName);
        g_ahat = Motif(A, 1, MotifName);
        g_rhoa_h = Motif(A, 1, 'Edge');
        g_rhoa2_h = Motif(A, 2, 'Edge');
        a1 = r*rho_ahat ^(-s).*g_ahat -2*s*rho_ahat ^(-s-1)*u_mhat.*g_rhoa_h;
        ksei_a2 = sum(g_ahat.^2)/m;
        g_a2hat = Motif(A, 2, MotifName);
        g_a = g_ahat'*ones(1,m);
        g1g1g2_a = mean(mean(g_a2hat.*g_a.*g_a'));
        ksei_a_rhoa = 1/m*sum(g_ahat.*g_rhoa_h);
        ksei_rhoa2 = sum(g_rhoa_h.^2)/m;
        % calculating all a0-a4
        % compute a0 to a4
        a0 = 2*s*(s+1)*rho_ahat^(-s-2)*u_mhat*ksei_rhoa2-2*r*s*rho_ahat^(-s-1)*ksei_a_rhoa;
        a2 = r*(r-1)/2*rho_ahat^(-s).*g_a2hat ...
            - s*rho_ahat^(-s-1)*u_mhat.*g_rhoa2_h...
            + 2*rho_ahat^(-s)*u_mhat*s*(s+1)*rho_ahat^(-2).*g_rhoa_h'*g_rhoa_h...
            -2*r*s*rho_ahat^(-s-1).*g_rhoa_h'*g_ahat;
        a3 = -4*r^2*s*rho_ahat^(-(2*s+1))*ksei_a2.*g_rhoa_h+r^2*rho_ahat^(-2*s)*(g_ahat.^2-ksei_a2)...
            -16*s^2*(s+1)*rho_ahat^(-(2*s+3))*u_mhat^2*ksei_rhoa2.*g_rhoa_h...
            +8*r*s^2*rho_ahat^(-(2*s+2))*u_mhat.*g_ahat*ksei_rhoa2...
            +4*s^2*rho_ahat^(-(2*s+2))*u_mhat^2.*(g_rhoa_h.^2-ksei_rhoa2)...
            -4*r*s*(-(4*s+2)*rho_ahat^(-(2*s+2)).*g_rhoa_h*u_mhat*ksei_a_rhoa + ...
                r*rho_ahat^(-(2*s+1)).*g_ahat*ksei_a_rhoa+rho_ahat^(-(2*s+1))*u_mhat.*(g_ahat.*g_rhoa_h-ksei_a_rhoa));
        a4 = 2*r^2*(r-1)*rho_ahat^(-2*s).*(g_ahat'*ones(1,m).*g_a2hat)...
            +8*s^2*rho_ahat^(-(2*s+2))*u_mhat^2.*(g_rhoa_h'*ones(1,m).*g_rhoa2_h)...
            -4*r*(r-1)*s*rho_ahat^(-(2*s+1))*u_mhat.*(g_rhoa_h'*ones(1,m).*g_a2hat)...
            -4*r*s*rho_ahat^(-(2*s+1))*u_mhat.*(g_ahat'*ones(1,m).*g_rhoa2_h);
		
        e_a4a1 = mean(mean(a4.*(a1'*ones(1,m))'));
        e_a1a3 = mean(a1.*a3);
        e_a3 = sum(a1.^3)/m;
        e_a1a1a2 = mean(mean(a2.*(a1'*ones(1,m)).*(a1'*ones(1,m))'));
		
		StructVar = struct();
		
		StructVar.MotifName = MotifName;
		StructVar.U      = u_mhat;
		StructVar.rho_A  = rho_ahat;
		StructVar.m      = m;
		StructVar.a0     = a0;
		StructVar.aa11   = sum(a1.^2)/m;
		StructVar.aa13   = e_a1a3;
		StructVar.aa41   = e_a4a1;
		StructVar.aaa111 = e_a3;
		StructVar.aaa112 = e_a1a1a2;
		
		NetStatList{MotifIndex} = StructVar;
	
	end
	
	
	
end