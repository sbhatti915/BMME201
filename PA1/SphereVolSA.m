function [Vol,SA] = SphereVolSA(r)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/17/2018
% SphereVolSA.m
%
% Uses radius of sphere to calculate volume and surface area
%
% Inputs:   r -- radius (units)
%     
% Output:   Vol -- Volume       (units^3)
%           SA  -- Surface area (units^2)

Vol = 4/3*pi*(r^3);
SA = 4*pi*(r^2);
end