function [mins,seconds] = pace(s)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/6/2018
% pace.m
%
% Converts total seconds to minutes and seconds in integers
%
% Inputs:   h -- hours (hours)
%           m -- mins (mins)
%           s -- seconds (seconds)
%     
% Output:   seconds -- seconds (seconds)  
mins = floor(s/60);
seconds = round(abs(s/60 - mins)*60);
end