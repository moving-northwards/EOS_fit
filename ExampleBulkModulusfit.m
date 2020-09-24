%% Example script
% load volume and internal energy data or copy in 
% Example data here was calculated using VASP for a transition-metal cyanide
V = [355.489092 359.153928 362.818764 366.483600 370.148436 373.813272 377.478198]; % In Angstrom^3
E = [-149.548408 -149.575485 -149.593493 -149.602263 -149.601460 -149.591015 -149.570925]; % In eV

%% Crude extraction of Bulk Modulus from quadratic 
% Use as a check of data 
[A,C] = polyfit(V,E,2);
V0 = -A(2)/(2*A(1));
BulkModulus = 2*V0*A(1)*160.2 % conversion from eV/A3 to GPa
axis = [0:0.01:1]*(max(V)-min(V))+min(V);
Efit = polyval(A,axis);
figure
plot(V,E,'o',axis,Efit);

%% fit data to Murnaghan
M=fit_murnaghan_eos(V,E);
BulkModulus = M(1)*160.2 % conversion from eV/A3 to GPa
BM_Derivative = M(2) % Note that B'0 is dimensionless

%% fit data to Birch-Murnaghan
B=fit_birch_murnaghan_eos(V,E);
BulkModulus = B(1)*160.2 % conversion from eV/A3 to GPa
BM_Derivative = B(2) % Note that B'0 is dimensionless

%% Take a look at the fits
figure
axis = [0:0.01:1]*(max(V)-min(V))+min(V);
Bfit = birch_murnaghan_eos(axis,B);
Mfit = murnaghan_eos(axis,M);
subplot(2,1,1)
plot(V,E,'o',axis,Bfit,'r');
subplot(2,1,2)
plot(V,E,'o',axis,Mfit,'b');
