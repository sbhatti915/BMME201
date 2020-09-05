% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/4/18
% StressStrain.m
%
% Calculates all critical data for stress-strain curve

clc
clear
close all 

%% Declarations
FD = xlsread('FDdata.xlsx'); % Force-Displacement data
gLength = 38; % Gage Length (mm)
r = 1.5; % Radius (mm)

% Anonymous function
meters = @(x) x/1000; % Converts millimeters to meters
MPa = @(y) y/1E6; % Converts Pascals to mega Pascals
slope = @(x1,y1,x2,y2) (y2-y1)/(x2-x1); % Finds slope using rise over run

%% Calculations
rMeters = meters(r);
gMeters = meters(gLength);
stressPa = Stress(FD(:,2),rMeters);
stress = MPa(stressPa);
strain = Strain(FD(:,1),gMeters);
SS(:,1) = strain;
SS(:,2) = stress;

for k = 3:length(SS)
    corrCoeff(k) = corr(strain(1:k),stress(1:k));
end

[~,corrInd] = max(corrCoeff);
propStrain = strain(corrInd);
propStress = stress(corrInd);

elasMod = slope(strain(1),stress(1),propStrain,propStress);

yStress = elasMod*(strain-.002);
convStress = stress - yStress;
[~,yieldInd] = min(abs(convStress));
yieldStress = stress(yieldInd);
yieldStrain = strain(yieldInd);

% plot(strain,convStress) % transformation of graph
% figure
% plot(strain,abs(convStress)) % transformation of graph
% figure

[ultiStress,maxInd] = max(stress);
ultiStrain = strain(maxInd);
failStrain = strain(end);
failStress = stress(end);

resilience = trapz(strain(1:yieldInd),stress(1:yieldInd));
toughness = trapz(strain(1:end),stress(1:end));

%% Plot
area(strain(1:yieldInd),stress(1:yieldInd),'FaceColor','r')
hold on
area(strain(yieldInd:end),stress(yieldInd:end),'FaceColor','c')
hold on
plot(strain,stress,'k')
xlabel('Strain')
ylabel('Stress (MPa)')
title('Stress-Strain of Aluminum')
x = [propStrain yieldStrain ultiStrain failStrain];
y = [propStress yieldStress ultiStress+10 failStress-5];
t = {'proportional' , 'yield' , 'ultimate' , 'failure'};
text(x,y,t);
hold off

%% Output
fprintf('The proportional stress is %.2f MPa at %.4f strain \n', ...
    propStress,propStrain)
fprintf('The elastic modulus is %.2f GPa \n',elasMod*1E-3)
fprintf('The yield stress is %.2f MPa at %.4f strain \n', ...
    yieldStress,yieldStrain)
fprintf('The failure stress is %.2f MPa at %.4f strain \n', ...
    failStress,failStrain)
fprintf('The ultimate stress is %.2f MPa at %.4f strain \n', ...
    ultiStress,ultiStrain)
fprintf('The resilience is %.2f MJ/m^3 \n', resilience)
fprintf('The toughness is %.2f MJ/m^3 \n',toughness)