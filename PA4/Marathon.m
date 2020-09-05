% Sameer Bhatti
% sabhatti@live.unc.edu
% 6/4/18
% Marathon.m
%
% Allows user to calculate the pace and speed given time at mile marks
%   in Excel sheet

clc
clear
close all 

%% Declarations
splits = xlsread('raceSplits.xlsx');
h = 1;                                  % Column number of hours
m = 2;                                  % Column number of minutes
s = 3;                                  % Column number of seconds
miles = length(splits);                 % number of miles (miles)
mileMarks = linspace(1,miles,miles);    % Each mile marker

% Anonymous function
hoursConv = @(m,s) m/60 + s/60/60; % Converts minutes and seconds to hours

%% Calculations
for k = 1:miles
    if k == 1
        totalSec = secConv(splits(k,h),splits(k,m),splits(k,s));
        [mins(k),secs(k)] = pace(totalSec);
        paceArr(k,:) = [k mins(k) secs(k)];
        totHours = hoursConv(mins(k),secs(k));
        spd(k) = 1/totHours;
        spdArr(k,:) = [k spd(k)];
        decSec(k) = secs(k)/60;
        decPace(k) = mins(k) + decSec(k);
    else
        totalSec = secConv(splits(k,h),splits(k,m),splits(k,s));
        secsMile = totalSec - secConv(splits(k-1,h),splits(k-1,m),...
            splits(k-1,s));
        [mins(k),secs(k)] = pace(secsMile);
        paceArr(k,:) = [k mins(k) secs(k)];
        totHours = hoursConv(mins(k),secs(k));
        spd(k) = 1/totHours;
        spdArr(k,:) = [k spd(k)];
        decSec(k) = secs(k)/60;decPace(k) = mins(k) + decSec(k);
    end
end
    
totTime = secConv(splits(end,1),splits(end,2),splits(end,3));
avgTime = totTime/miles;
[avgMins,avgSecs] = pace(avgTime);

[maxSpd,iMax] = max(spd);
[minSpd,iMin] = min(spd);
%% Plots
subplot(2,1,1)
plot(mileMarks,decPace,'r')
title('Pace at each Mile')
xlabel('Mile Markers (miles)')
ylabel('Pace (mins/mile)')

subplot(2,1,2)
plot(mileMarks,spd,'k')
title('Speed at each Mile')
xlabel('Mile Markers (miles)')
ylabel('Speed (mph)')
saveas(gcf,'figure1.png')
figure

yyaxis left
plot(mileMarks,decPace,'b')
ylabel('Pace (mins/mile)')
xlabel('Mile Markers (miles)')
yyaxis right
plot(mileMarks,spd,'g')
ylabel('Speed (mph)')
title('Pace and Speed at Mile Marks')
legend('Pace','Speed','location','northwest')
saveas(gcf,'figure2.png')

%% Output
fid = fopen('paceData.dat','w');
fprintf(fid,'%5s %10s %10s \n','Mile','Pace(min)','Pace(sec)');
for k = 1:miles
    mile = paceArr(k,1);
    paceMin = paceArr(k,2);
    paceSec = paceArr(k,3);
    fprintf(fid,'   %2.0f        %2.0f         %2.0f\n',mile,paceMin...
        ,paceSec);
end
fclose(fid);

fid1 = fopen('speedData.dat','w');
fprintf(fid1, '%5s %11s \n','Mile','Speed(mph)');
for k = 1:miles
    mile = spdArr(k,1);
    speed = spdArr(k,2);
    fprintf(fid1,'   %2.0f    %2.6f\n',mile,speed);
end
fclose(fid1);

fid2 = fopen('timeData.dat','w');
fprintf(fid2,'%5s  %5s \n','Mile','Time');
for k = 1:miles
    hours = splits(k,1);
    minutes = splits(k,2);
    seconds = splits(k,3);
    fprintf(fid2,'%4i  %02i:%02i:%02i\n',k,hours,minutes,seconds);
end
fclose(fid2);

fprintf('The average pace of the entire run is %02i:%02i per mile \n',...
    avgMins,avgSecs)
fprintf('The fastest mile is %.2f mph at mile %.0f \n',maxSpd,iMax)
fprintf('The slowest mile is %.2f mph at mile %.0f \n',minSpd,iMin)