function [ result ] = birch_murnaghan_eos(V, x)
    % x = [B0 B0' V0 E0]
    % function that calculates the internal energy (integral of the
    % pressure) E(V) from the volume using the Birch-Murnaghan equation of
    % state. The vector x contains the necessary constants
    
    result = x(4)+ (9/16)*x(1)*x(3) * (x(2)*((x(3)./V).^(2/3)-1).^3  + ((x(3)./V).^(2/3)-1).^2.*(6-4*(x(3)./V).^(2/3)));
end