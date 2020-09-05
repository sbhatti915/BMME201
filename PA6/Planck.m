% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/11/18
% Planck.m
%
% Calculates the minimum cost and given thickness to build a plank

clc
clear
close all

%% Declarations
l = 15; % length (ft)
minTh = 0.0001; % Min thickness (ft)
maxTh = 2; % Max thickness (ft)
h = linspace(minTh,maxTh,1000); % All possible values of thickness (ft)
r = 6; % Ratio of width to thickness, 6:1
fixCost = 3000; % Fixed cost ($)
pt = 8; % Cost of Paint ($)
Mat = 50; % Cost of Material ($)
thDiscount = 6000; % Thickness Discount ($)
yieldStressPsi = 25000; % Yield Stress (psi)

% Anonymous Function
cost = @(y) fixCost + pt.*(2*l*r.*y + 2*l.*y + 2*r*y.*y)...
    + Mat.*(l*r*y.*y) - thDiscount*y; % Finds the cost of the plank given
%                                       a thickness
psf = @(x) x*144;  % Converts psi to psf

%% Calculations
totCost = cost(h);
[thickness,minCost] = fminbnd(cost,minTh,maxTh);
yieldStress = psf(yieldStressPsi);
weight = (yieldStress*(r*thickness)*(thickness)^2)/(6*l);

%% Plot
plot(h,totCost,'k',linspace(thickness,thickness,100),...
    linspace(0,max(totCost),100),'r')
xlabel('Thickness (ft)')
ylabel('Cost ($)')
title('Cost vs. Thickness')
legend('Cost','Minimum Cost')

%% Output
fprintf('The thickness that minimizes the cost is %.3f ft \n', thickness)
fprintf('The minimum cost is $%.2f \n',minCost)
fprintf('The maximum weight the plank can hold is %.2f lbs \n',weight)