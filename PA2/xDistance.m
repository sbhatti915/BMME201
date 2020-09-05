function t = ToF(v0,b,y0,a)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/29/2018
% xDistance.m
%
% Uses initial velocity, release angle, initial height, initial position
%   and acceleration to calculate the distance traveled in the x direction
%
% Inputs:   v0 -- initial velocity (m/s)
%           b  -- release angle    (radians)
%           y0 -- initial height   (m)
%           x0 -- initial position (m)
%           a  -- acceleration     (m/s)
%     
% Output:   R  -- x distance       (m)
t = ((sqrt((v0*sin(b)).^2)-2*a*y0)-v0.*sin(b)/a);