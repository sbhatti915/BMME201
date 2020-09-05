function [Vol,SA] = RecPrismVolSA(l,w,h)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/17/2018
% RecPrismVolSA.m
%
% Uses length, width, and height to calculate volume and surface area of
%   rectangular prism
%
% Inputs:   l -- length (units)
%           w -- width (units)
%           h -- height (units)
%     
% Output:   Vol -- Volume       (units^3)
%           SA  -- Surface area (units^2)

Vol = l.*w.*h;
SA = 2.*l.*w + 2.*l.*h + 2.*w.*h;
end