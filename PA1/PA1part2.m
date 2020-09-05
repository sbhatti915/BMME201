% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/22/2018
% PA1part2.m
%
%

clc
clear

%% Declarations
% Inputs
R = 1;      % radius (units)
delR = .04; % radius uncertainty (units)
H = 5;      % height (units)
delH = .2;  % height uncertainty (units)
P1 = 2;     % exponent of radius
P2 = 1;     % exponent of height

% Anonymous functions
FracUncertainty = @(x1,dx1,x2,dx2,V) V*sqrt(((P1*dx1/x1)^2 + (P2*dx2/x2)^2));
OblSpheroidVol = @(r,h) 4/3*pi*r^2*h;

%% Calculations
cylVol = CylVolSA(R,H);
cylUn = FracUncertainty(R,delR,H,delH,cylVol);
coneVol = ConeVolSA(R,H);
coneUn = FracUncertainty(R,delR,H,delH,coneVol);
spheroidVol = OblSpheroidVol(R,H);
spheroidUn = FracUncertainty(R,delR,H,delH,spheroidVol);

%% Output
fprintf('Cylinder volume = %.3f %c %.3f \n',cylVol,177,cylUn);
fprintf('Cone volume = %.3f %c %.3f \n',coneVol,177,coneUn);
fprintf('Spheroid volume = %.3f %c %.3f \n',spheroidVol,177,spheroidUn);