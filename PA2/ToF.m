function t = ToF(y0,v0,b,a)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/29/2018
% xDist.m
%
% Uses initial velocity, release angle, initial height, acceleration, and
%    initial position to calculate the position
%
% Inputs:   v0 -- initial velocity (m/s)
%           b  -- release angle    (radians)
%           y0 -- initial height   (m)
%           a  -- acceleration     (m/s)
%     
% Output:   t  -- time of flight   (s)
vy = v0*sin(b);
t = -sqrt((vy.^2-(2*a*y0)))/a - vy/a;