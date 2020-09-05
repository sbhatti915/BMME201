function strain = Strain(d,l)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/6/2018
% Strain.m
%
% Caclculates strain using displacement and length of material
%
% Inputs:   d -- displacement (units)
%           l -- mins (units)
%     
% Output:   strain  
strain = d/l;
end