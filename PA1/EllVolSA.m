function [Vol,SA] = EllVolSA(a,b,c)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/17/2018
% EllVolSA.m
%
% Uses principal axes of a general ellipsoid to calculate its volume and 
%   surface area
%
% Inputs:   a -- principal axis in x direction (units)
%           b -- principal axis in y direction (units)
%           c -- principal axis in z direction (units)
%     
% Output:   Vol -- Volume       (units^3)
%           SA  -- Surface area (units^2)

p = 1.6075;
Vol = 4/3*pi*a*b*c;
SA = 2*pi*((a^p)*(b^p)+(a^p)*(c^p)+(b^p)*(c^p))^(1/p);
end