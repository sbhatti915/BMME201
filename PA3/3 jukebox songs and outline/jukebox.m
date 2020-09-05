% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/30/18
% jukebox.m
%
% Allows user to input a song they'd like to listen to

clc
clear
close all 

%% Declarations
Rate = 32768;   % sampling rate (hz)
Octave = 0;     % Octave
Speed = 0;      % Speed 

%% Jukebox Code
% Opening
fprintf('Welcome to this cool jukebox that sounds so great \n')
fprintf('1 Super Mario Bros \n')
fprintf('2 The Office theme song \n')
fprintf('3 Let It Go \n')
fprintf('4 Fur Elise \n')
fprintf('5 Entry into Valhalla \n')
fprintf('6 GoT \n')
fprintf('7 Never Gonna Give You Up \n')
fprintf('8 Random \n')
fprintf('0 Quit \n')

% Choose song
while 1 == 1
song = input('What song number would you like to listen to --> ');
while song < 0 || song > 9
    song = input(['Try again. What song number would you like to listen'...
    ' to --> ']);
end
switch song
    case 0
        break
    case 1
        song = SuperMarioBros(Octave,Speed,Rate);
    case 2
        song = Office(Octave,Speed,Rate);
    case 3
        song = LetItGo(Octave,Speed,Rate);
    case 4
        song = FurElise(Octave,Speed,Rate);
    case 5
        song = EntryIntoValhalla(Octave,Speed,Rate);
    case 6
        song = GoT(Octave,Speed,Rate);
    case 7
        song = NeverGonna(Octave,Speed,Rate);
    case 8
        r = randi(7,1,1);
        if r == 1
            song = SuperMarioBros(Octave,Speed,Rate);
        elseif r == 2
            song = Office(Octave,Speed,Rate);
        elseif r == 3
            song = LetItGo(Octave,Speed,Rate);
        elseif r == 4
            song = FurElise(Octave,Speed,Rate);
        elseif r == 5
            song = EntryIntoValhalla(Octave,Speed,Rate);
        elseif r == 6
            song = GoT(Octave,Speed,Rate);
        elseif r == 7
            song = NeverGonna(Octave,Speed,Rate);
        end
end

% Volume
V = input('what do you want the volume (1-5) --> ');
while V < 1 || V > 5
    V = input('Try again. What do you want the volume (1-5) --> ');
song = V.*song;
end

% Play song backwards
B = input('Do you want to play the song backwards (y/n) --> ','s');
    if B == 'y'
        song = fliplr(song);
    elseif B == 'n'
        song;
    end
    
% Fade
F = input('Do you want to fade the end of the song (y/n) --> ','s');
if F == 'y'
     f = Rate*2;
     fades= linspace(1,0,f);
     song(end - f + 1:end) = song(end - f + 1:end).*fades;
elseif F == 'n'
    song;
end

% Round
R = input('Would you like a round (y/n) --> ','s');
if R == 'y'
    sound(song,Rate)
    pause(1)
    sound(song,Rate)
    pause(length(song)/Rate)
elseif R == 'n'
    sound(song,Rate)
    pause(length(song)/Rate)
end

% Repeat
L = input('Would you like the song to play again (y/n) --> ','s');
    while L == 'y'
    sound(song,Rate)
    pause(length(song)/Rate)
        if L == 'y'
            L = input(['Would you like the song to play again (y/n)' ...
                ' --> ','s']);
        end
    if L == 'n'
    end
    end

end

fprintf('Thanks for listening \n')
