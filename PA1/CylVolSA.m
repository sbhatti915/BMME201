function [Vol,SA] = CylVolSA(r,h)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/17/2018
% CylVolSA.m
%
% Uses radius and height of cylinder to calculate volume and surface area
%
% Inputs:   r -- radius (units)
%           h -- height (units)
%     
% Output:   Vol -- Volume       (units^3)
%           SA  -- Surface area (units^2)

Vol = pi*r^2*h;
SA = 2*pi*r*h + 2*pi*r^2;
end