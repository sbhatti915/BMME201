function [note, noteFreq] = NoteFinder(freq)
% Sameer Bhatti & Kendall Joseph
% sabhatti@live.unc.edu, k
% 6/11/18
% NoteFinder.m 
%
% Determines the closest note to a given input frequency. 
%   input:   freq -- frequency data
%   outputs: note -- string containing note
%            noteFreq -- closest note's associated frequency
for n = 1:12
    for m = 1:8
        noteFreq(n,m) = 16.3516*2^(m+(n-1)/12);
    end
end