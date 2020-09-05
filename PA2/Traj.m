function [xTraj,yTraj] = Traj(x0,y0,v0,b,a,tSub)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/29/2018
% Traj.m
%
% Uses initial velocity, release angle, initial height, acceleration, and
%    initial position to calculate the x and y trajectories
%
% Inputs:   v0      -- initial velocity (m/s)
%           b       -- release angle    (radians)
%           y0      -- initial height   (m)
%           x0      -- initial position (m)
%           a       -- acceleration     (m/s^2)
%     
% Output:   xTraj   -- x trajectory     (m)
%           yTraj   -- y trajectory     (m)
vy = v0*sin(b);
vx = v0*cos(b);
tof = -sqrt((vy.^2-(2*a*y0)))/a - vy/a;
t = linspace(0,tof,tSub);
xTraj = vx.*t + x0;
yTraj = y0 + vy.*t + 1/2*a*t.^2;