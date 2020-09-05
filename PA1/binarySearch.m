% Sameer Bhatti
% sabhatti@live.unc.edu
% 5/24/2018
% binarySearch.m
%
% Uses binary search to find a number and find the number guesses required


%% Declarations
actual = 80; % answer
k = 1; % counter

lB = 0; % Lower bound
uB = 100; % upper bound

%% Prompt
guess = input('Pick a number between 0 and 100 --> ');
while (guess > 100) || (guess < 0)
    guess = input('Try again between 0 and 100 --> ');
end


%% Binary search
while guess(k) ~= actual
    if guess(k) < actual
        lB = guess(k);
    elseif guess(k) > actual
        uB = guess(k);
    end
    guess(k+1) = round((uB + lB)/2);
    k = k + 1;
   
end

%% Output
fprintf('This took %i tries to find the answer\n',k)