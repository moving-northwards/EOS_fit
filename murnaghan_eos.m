function [ result ] = murnaghan_eos(V, x)
    % x = [B0 B0' V0 E0]
    % function that calculates the internal energy (integral of the
    % pressure) E(V) from the volume using the Murnaghan equation of
    % state. The vector x contains the necessary constants

    result = x(4)+x(1)*V/x(2)/(x(2)-1).*(x(2)*(1-x(3)./V)+(x(3)./V).^x(2)-1);
end