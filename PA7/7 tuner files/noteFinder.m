clear
clc
% function [note, noteFreq] = noteFinder(freq)
% name email date NoteFinder.m
%
% Determines the closest note to a given input frequency.
%   input:   freq -- frequency data outputs: note -- string containing note
%            noteFreq -- closest note's associated frequency

freq = 28.6;
for m = 1:9
    for n = 1:12
        freqs(m,n) = (16.3516) * (2^((m-1)+(n-1)/12));
    end
end
freqs1 = reshape(freqs,[1,108]);
freqs1 = sort(freqs1);
freqs1(end+1) = freq;
freqs1 = sort(freqs1);
freqInd = find(freqs1==freq);
nextFreq = abs(freqs1(freqInd+1) - freq);
lastFreq = abs(freq - freqs1(freqInd-1));
if nextFreq > lastFreq
    noteFreq = freqs1(freqInd-1);
else
    noteFreq = freqs1(freqInd+1);
end