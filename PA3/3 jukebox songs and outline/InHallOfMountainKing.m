function song = InHallOfMountainKing(octave, speed, rate)
% In the Hall of the Mountain King -- Edvard Grieg
%   Inputs: octave -- integer value to go up or down an octave. 
%                     0 is default; >0 is higher; <0 is lower
%           speed -- integer speed value (default is 1 s per bar in 4/4)
%                    0 is default; >0 is faster; <0 is slower
%           rate -- sample rate for music playback (usually 8192 or 32768)
%   Output: song -- vector for mono or matrix for stereo

% Define anonymous function that creates note for duration t and frequency
% freq and at the defined rate
note = @(t,freq,oct) sin(linspace(0,2*pi*t*freq*2^oct,round(t*rate)));

% Define notes w.r.t. A0 = 27.5 Hz. Octave lets user change octave.
C0 = 13.75*2^(3/12);
C  = C0*2^octave;       % C
Cs = C*2^(1/12); Db=Cs; % C# or Db
D  = C*2^(2/12);        % D
Ds = C*2^(3/12); Eb=Ds; % D# or Eb
E  = C*2^(4/12);        % E
F  = C*2^(5/12);        % F
Fs = C*2^(6/12); Gb=Fs; % F# or Gb
G  = C*2^(7/12);        % G
Gs = C*2^(8/12); Ab=Gs; % G# or Ab
A  = C*2^(9/12);        % A
As = C*2^(10/12); Bb=As;% A# or Bb
B  = C*2^(11/12);       % B
r  = 0;                 % rest

% Assume time signature of 4/4
barLength = 1/2^speed; % default is too slow

w = barLength;     %whole note
h = barLength/2;   %half note
t = barLength/3;   %thirds
q = barLength/4;   %quarter note
tt= barLength/6;   %triplet
e = barLength/8;   %eighth note
et= barLength/12;  %"eighth" triplet
s = barLength/16;  %sixteenth note


% Assume time signature of 4/4
w = barLength;     %whole note
h = barLength/2;   %half note
t = barLength/3;   %thirds
q = barLength/4;   %quarter note
tt= barLength/6;   %triplet
e = barLength/8;   %eighth note
et= barLength/12;  %"eighth" triplet
s = barLength/16;  %sixteenth note

% Creates two-part harmony
song= [
    note(h,A,2) ...
    note(h,B,2) ...
    note(h,C,3) ...
    note(h,D,3) ...
    note(h,E,3) ...
    note(h,C,3) ...
    note(w,E,3) ...
    note(h,Ds,3) ...
    note(h,B,2) ...
    note(w,Ds,3) ...
    note(h,D,3) ...
    note(h,As,2) ...
    note(w,D,3) ...
    note(h,A,2) ...
    note(h,B,2) ...
    note(h,C,3) ...
    note(h,D,3) ...
    note(h,E,3) ...
    note(h,C,3) ...
    note(h,E,3) ...
    note(h,A,3) ...
    note(h,G,3) ...
    note(h,E,3) ...
    note(h,C,3) ...
    note(h,E,3) ...
    note(w*2,G,3)...
    note(q,A,2) ...
    note(q,B,2) ...
    note(q,C,3) ...
    note(q,D,3) ...
    note(q,E,3) ...
    note(q,C,3) ...
    note(h,E,3) ...
    note(q,Ds,3) ...
    note(q,B,2) ...
    note(h,Ds,3) ...
    note(q,D,3) ...
    note(q,As,2) ...
    note(h,D,3) ...
    note(q,A,2) ...
    note(q,B,2) ...
    note(q,C,3) ...
    note(q,D,3) ...
    note(q,E,3) ...
    note(q,C,3) ...
    note(q,E,3) ...
    note(q,A,3) ...
    note(q,G,3) ...
    note(q,E,3) ...
    note(q,C,3) ...
    note(q,E,3) ...
    note(w,G,3) ...
    note(e,E,3)...
    note(e,Fs,3)...
    note(e,Gs,3)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,Gs,3)...
    note(q,B,3)...
    note(e,C,4)...
    note(e,Gs,3)...
    note(q,C,4)...
    note(e,B,3)...
    note(e,Gs,3)...
    note(q,B,3)...
    note(e,E,3)...
    note(e,Fs,3)...
    note(e,Gs,3)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,Gs,3)...
    note(q,B,3)...
    note(e,C,4)...
    note(e,Gs,3)...
    note(q,C,4)...
    note(h,B,3)...
    note(e,E,3)...
    note(e,Fs,3)...
    note(e,Gs,3)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,Gs,3)...
    note(q,B,3)...
    note(e,C,4)...
    note(e,Gs,3)...
    note(q,C,4)...
    note(e,B,3)...
    note(e,Gs,3)...
    note(q,B,3)...
    note(e,E,3)...
    note(e,Fs,3)...
    note(e,Gs,3)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,Gs,3)...
    note(q,B,3)...
    note(e,C,4)...
    note(e,Gs,3)...
    note(q,C,4)...
    note(h,B,3)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,C,4)...
    note(e,D,4)...
    note(e,E,4)...
    note(e,C,4)...
    note(q,E,4)...
    note(e,Ds,4)...
    note(e,B,3)...
    note(q,Ds,4)...
    note(e,D,4)...
    note(e,As,3)...
    note(q,D,4)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,C,4)...
    note(e,D,4)...
    note(e,E,4)...
    note(e,C,4)...
    note(e,E,4)...
    note(e,A,3)...
    note(e,G,4)...
    note(e,E,4)...
    note(e,C,4)...
    note(e,E,4)...
    note(h,G,4)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,C,4)...
    note(e,D,4)...
    note(e,E,4)...
    note(e,C,4)...
    note(q,E,4)...
    note(e,Ds,4)...
    note(e,B,3)...
    note(q,Ds,4)...
    note(e,D,4)...
    note(e,As,3)...
    note(q,D,4)...
    note(e,A,3)...
    note(e,B,3)...
    note(e,C,4)...
    note(e,D,4)...
    note(e,E,4)...
    note(e,C,4)...
    note(e,E,4)...
    note(e,A,4)...
    note(e,Gs,4)...
    note(e,E,4)...
    note(e,Gs,4)...
    note(e,B,4)...
    note(h,A,4)...
   ];
