function seconds = secConv(h,m,s)
% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/6/2018
% secConv.m
%
% Converts hours and minutes to seconds and adds seconds for total time
%
% Inputs:   h -- hours (hours)
%           m -- mins (mins)
%           s -- seconds (seconds)
%     
% Output:   seconds -- seconds (seconds)  
seconds = h*3600 + m*60 + s;
end