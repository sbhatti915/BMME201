function [Vol,SA] = CubeVolSA(a)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/17/2018
% CubeVolSA.m
%
% Uses side length of cube to calculate volume and surface area of cube
%
% Inputs:   a -- side length (units)
%     
% Output:   Vol -- Volume       (units^3)
%           SA  -- Surface area (units^2)  

Vol = a^3;
SA = 6*a^2; 
end