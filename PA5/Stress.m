function stress = Stress(F,r)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/6/2018
% Stress.m
%
% Calculates stress using force and the radius of a circular cross section
%
% Inputs:   F -- Force (Newtons)
%           r -- radius (meters)
%     
% Output:   stress -- stress (Pascal)  
A = r^2*pi;
stress = F/A;
end