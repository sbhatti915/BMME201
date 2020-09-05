% name
% email
% date
% tuner.m
%
% Records input audio file and compares it to all possible notes. Tell user
% whether they are within a reasonable distance from the desired note using
% LEDs.

close all
clearvars -except myPi

%% Declarations
audioLength = 1; % duration of recorded audio file (sec)
maxFreq = ; % largest expected frequency
minFreq = ; % smallest expected frequency

% Creates string for RP call. If you are using a pre-existing file for
% analysis, then use that file name in the variable fileName.
fileName = 'test.wav';
% Unix command, turns on a speaker and records for duration and spits out 
% as a file name
cmd = sprintf('arecord -D plughw:1 --duration=%d -f cd -vv ~/%s',...
    audioLength, fileName);

% % GPIO Pins
% greenLED       = ;
% yellowFlatLED  = ;
% yellowSharpLED = ;
% redFlatLED     = ;
% redSharpLED    = ;
% pins = [redFlatLED yellowFlatLED greenLED yellowSharpLED redSharpLED];

% Anonymous functions (if any)



%% Register and test pins
% DO NOT NEED TO CHANGE ANYTHING IN THIS SECTION EXCEPT TO COMMENT IT OUT
% If you are using a .wav file from your computer and not the RP, comment
% this section out
%
% Connect to Pi
if (~exist('myPi','var'))
%       myPi = raspi();
      myPi = raspi('169.254.0.2','pi','raspberry');
end

% 
% % Register pins
% configurePin(myPi,redFlatLED,'DigitalOutput');
% configurePin(myPi,redSharpLED,'DigitalOutput');
% configurePin(myPi,yellowFlatLED,'DigitalOutput');
% configurePin(myPi,yellowSharpLED,'DigitalOutput');
% configurePin(myPi,greenLED,'DigitalOutput');
% configurePin(myPi,buzzer,'DigitalOutput');
% 
% % Test components
% for i=1:length(pins)
%     writeDigitalPin(myPi,pins(i),1);
%     pause(0.2)
%     writeDigitalPin(myPi,pins(i),0);
% end


%% Record audio file from Pi
% DO NOT NEED TO CHANGE ANYTHING IN THIS SECTION EXCEPT TO COMMENT IT OUT
% If you are using a .wav file from your computer and not the RP, comment
% this section out
disp('Start recording')
system(myPi, cmd); % runs recording on RP
pause(audioLength); % wait during recording
disp('OK done')
pause(1); % one extra second just to be sure
getFile(myPi, fileName); % reads file from RP


%% Load and FFT data
% Use audioread() to important signal and rate. See its help file and use
% the variable names signal and rate (or change the names in the myFFT.


% Transform your data using myFFT
[freq,power] = myFFT(signal,minFreq,maxFreq,rate);


%% Plot frequency spectra




%% Find what note is closest using NoteFinder

% Find frequency that has maximum magnitude


% Determine what note is closest to max frequency
[closeNote,closeNoteFreq] = NoteFinder(f0);
cents = 1200*(log(f0/closeNoteFreq)/log(2));

% Display max frequency, closest note and its frequency, and cents diff

%% Trigger Raspberry Pi LEDs
if cents >= 15
    writeDigitalPin(myPi,redSharpLED,1)
    fprintf('Red sharp')
    pause(5)
    writeDigitalPin(myPi,redSharpLED,0)
elseif cents >= 5 && cents < 15
    writeDigitalPin(myPi,yellowSharpLED,1)
    fprintf('yellow sharp')
elseif cents >= -5 && cents <= 5
    writeDigitalPin(myPi,greenLED,1)
    fprintf('green')
elseif cents <= -5 && cents > -15
    writeDigitalPin(myPi,yellowFlatLED,1)
    fprintf('yellow flat')
elseif cents <= -15
    writeDigitalPin(myPi,redFlatLED,1)
    fprintf('red flat')
end