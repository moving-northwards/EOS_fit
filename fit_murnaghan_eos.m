function [ x,fval,exitflag ] = fit_murnaghan_eos( V, E )
    % function attempts to fit a set of volumes and itnernal energies given
    % by 1D arrays to the Murnaghan equation of state. 
    % x contains the fitted parameters:
    % x = [B0 B0' V0 E0]
    
    x0 = [1 1 mean(V) min(E)]; % initial guess
    banana = @(x)sum((murnaghan_eos(V,x)-E).^2);
    [x,fval,exitflag] = fminsearch(banana,x0,optimset('TolX',1e-12,'MaxFunEvals',3000)); 
end