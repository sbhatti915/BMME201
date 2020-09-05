% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/30/18
% jukebox.m
%
% <description>

clear all 

%% Declarations
rate = 32768; % sampling rate



%% Jukebox Code


%%% Opening menu. Give list of options

%%% Prompt user for selection, and check validity
song = input('What song number would you like to listen to --> ');
while song < 1 || song > 8
    song = input('Try again. What song number would you like to listen to --> ');
end

%%% Saves the user-defined song into the variable 'song' by calling the
%%% proper function.

%%% Asks user how much to change volume, and then change it.
V = input('What do you want the volume --> ');

%%% Asks user whether they want to play the song backwards, and then do
%%% it


%%% Asks whether user wants to add a fade over last two bars, and then
%%% do it


%%% Play the song using the function 'sound'
if song == 1
    sound(SuperMarioBros(0,0,32768),32768)
end

if song == 2
    sound(Office(0,0,32768),32768)
end

if song == 3
    sound(LetItGo(0,0,32768),32768)
end

if song == 4
    sound(FurElise(0,0,32768),32768)
end

if song == 5
    sound(EntryIntoValhalla(0,0,32768),32768)
end

if song == 6
    sound(GoT(0,0,32768),32768)
end

if song == 7
    sound(NeverGonna(0,0,32768),32768)
end

if song == 8
    sound(SuperMarioBros(0,0,32768),32768) % Change this
end


%%% Wait until the song is completed before proceeding. Use the
%%% function 'pause(time)', where time is the longest dimension of the
%%% song array. Since the sampling frequency is 8192 per second, you
%%% should wait (dimension)/rate seconds.


%%% Goodbye message

