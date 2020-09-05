function [Vol,SA] = ConeVolSA(r,h)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/17/2018
% ConeVolSA.m
%
% Uses radius and height of cone to calculate volume and surface area of
%   cone
%
% Inputs:   r -- radius (units)
%           h -- height (units)
%     
% Output:   Vol -- Volume       (units^3)
%           SA  -- Surface area (units^2)
Vol = pi*(r^2)*h/3;
SA = (pi*r)*(r+sqrt(h^2 + r^2));
end