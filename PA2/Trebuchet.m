% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/28/2018
% Trebuchet.m
%
% Calculates release angle and initial velocity for trebuchet to hit target

clc
clear
clear all

%% Declarations
% Inputs
x0 = 0;                             % Initial position (m)
h = 120;                            % Height of trebuchet (m)
g = -9.8;                           % Acceleration (m/s^2)
b = pi/4;                           % Release angle part 1 (rad)
th = linspace(-pi/2,pi/2,1000);     % Release angle part 2 (rad)
v1 = linspace(0,100,1000);          % Release velocity part 1 (m/s)
v2 = 75;                            % Release velocity part 2 (m/s)
tSub = 1000;                        % Time subdivisions
gothmogPos = 500;                   % Position of Gothmog (m)
vSolution = 62.862;                 % Part 1 solution (m/s)
bSolution1 = 0.212;                 % Part 2 solution 1 (rad)
bSolution2 = 1.122;                 % Part 2 solution 2 (rad)

%% Calculations
xDistance1 = xDist(x0,h,v1,b,g);
xDistance2 = xDist(x0,h,v2,th,g);
[xTraj1,yTraj1] = Traj(x0,h,vSolution,b,g,tSub);
[xTraj2,yTraj2] = Traj(x0,h,v2,bSolution1,g,tSub);
[xTraj3,yTraj3] = Traj(x0,h,v2,bSolution2,g,tSub);

%% Output
fprintf('The release velocity to hit the gothmog is %.3f m/s ',vSolution)
fprintf('when given a release angle of 45 degrees \n')
fprintf('The 1st release angle to hit the gothmog is %.3f rad ',bSolution1)
fprintf('when given a release velocity of 75 m/s \n')
fprintf('The 2nd release angle to hit the gothmog is %.3f rad ',bSolution2)
fprintf('when given a release velocity of 75 m/s \n')

% Plots
plot(v1,xDistance1,'k',v1,gothmogPos.*ones(length(v1)),'r')
title('Position of Rock with Varying Release Velocity')
xlabel('Release Velocity (m/s)')
ylabel('x position (m)')
figure

plot(th,xDistance2,'k',th,gothmogPos.*ones(length(v1)),'r')
title('Position of Rock with Varying Release Angle')
xlabel('Release angle (rad)')
ylabel('x position (m)')
figure

plot(xTraj1,yTraj1,'k',xTraj2,yTraj2,'r',xTraj3,yTraj3,'b')
title('Trajectory of rock')
xlabel('x position (m)')
ylabel('y position (m)')
legend('ans_1','ans_2a','ans_2b')
hold on

I = imread('careBear.jpg'); 
image([480 520],[40 0],I)