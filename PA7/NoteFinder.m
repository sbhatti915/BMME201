function [note, noteFreq] = NoteFinder(freq)
% Sameer Bhatti & Kendall Joseph
% sabhatti@live.unc.edu, kjoseph1@live.unc.edu
% 6/14/18
% NoteFinder.m
%
% Determines the closest note to a given input frequency.
%   input:   freq -- frequency data outputs: note -- string containing note
%            noteFreq -- closest note's associated frequency
for m = 1:9
    for n = 1:12
        freqs(m,n) = (16.3516) * (2^((m-1)+(n-1)/12));
    end
end

freqs1 = reshape(freqs,[1,108]);
freqs1 = sort(freqs1);
freqs1(end+1) = freq;
freqs1 = sort(freqs1);

freqInd = find(freqs1 == freq);
nextFreq = abs(freqs1(freqInd+1) - freq);
prevFreq = abs(freqs1(freqInd-1) - freq);
if nextFreq > prevFreq
    noteFreq = freqs1(freqInd-1);
else
    noteFreq = freqs1(freqInd+1);
end

[noteRow,noteCol]= find(freqs == noteFreq);
octave = num2str(noteRow-1);
if noteCol == 1
    frst = 'C';
elseif noteCol == 2
    frst = 'C#';
elseif noteCol == 3
    frst = 'D';
elseif noteCol == 4
    frst = 'D#';
elseif noteCol == 5
    frst = 'E';
elseif noteCol == 6
    frst = 'F';
elseif noteCol == 7
    frst = 'F#';
elseif noteCol == 8
    frst = 'G';
elseif noteCol == 9
    frst = 'G#';
elseif noteCol == 10
    frst = 'A';
elseif noteCol == 11
    frst = 'A#';
elseif noteCol == 12
    frst = 'B';
end

note = [frst octave];
        

