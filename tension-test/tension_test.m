%%   Groove

% variable initialization
length = 40.32;
d = 7.26/1000;
Area   = pi*(d/2)^2;

Load = xlsread('Groove.xls','Sheet1','A2:A606');
elongation = xlsread('Groove.xls','Sheet1','B2:B606');
time =  xlsread('Groove.xls','Sheet1','D2:D606');
 
e      = elongation/length;  % E strain
sigma  = Load/Area;          % E stress

 lim =find(sigma.*(1+e)== max(sigma.*(1+e)));
lim1 =find(sigma== max(sigma)); % limit
% Plotting
 plot(e,sigma,'r');
 hold on;
 plot(e(lim1),sigma(lim1),'g-o');
title(' Uniaxial tension test (Groove)');
xlabel('Strain in (mm/mm)');
ylabel('Stress in KPa');
hold on;
plot(log(1+e(1:lim)),sigma(1:lim).*(1+e(1:lim)),'b');
legend('Engineering stress-strain','UTS','True stress-strain');
pause;
hold off;
hold off;

% Regression
lim2 = find(abs(e-.0248)<10^-5);
reg=[e(1:lim2(1)),sigma(1:lim2(1))];
[ m ] = Regression( reg );
plot(e,sigma,'r');
 hold on;
plot(e(1:lim2(1)),m*e(1:lim2(1)),'b');
pause;
hold off;

%off set Yield point
plot(e,sigma,'r');
 hold on;
plot(e(1:lim2(1))+.002,m*e(1:lim2(1)),'b');
pause;
hold off;
%% No Groove 
length = 35.6;
d = 7.26/1000;
Area   = pi*(d/2)^2;

Load = xlsread('NoGroove.xls','Sheet1','A2:A661');
elongation = xlsread('NoGroove.xls','Sheet1','B2:B661');
time =  xlsread('NoGroove.xls','Sheet1','D2:D661');
 
e      = elongation/length;   % E strain
sigma  = Load/Area;           % E stress

lim =find(sigma.*(1+e)== max(sigma.*(1+e))); % limit
lim1 =find(sigma== max(sigma)); % limit
% Plotting
plot(e,sigma,'r');
hold on;
plot(e(lim1(1)),sigma(lim1(1)),'g-o');
title(' Uniaxial tension test (No Groove)');
xlabel('Strain in (mm/mm)');
ylabel('Stress in KPa');
hold on;
plot(log(1+e(1:lim)),sigma(1:lim).*(1+e(1:lim)),'b');

legend('Engineering stress-strain','UTS','True stress-strain');

hold off;
pause;
% Regression
lim2 = find(abs(sigma-5.4956*10^5)<10^2);
reg=[e(1:lim2(end)),sigma(1:lim2(end))];
[ m ] = Regression( reg );
plot(e(1:lim2(end)),sigma(1:lim2(end)),'g');
 hold on;
 plot(e,sigma,'r');
hold on;
plot(e(1:lim2(end)),m*e(1:lim2(end)),'b');
pause;
hold off;
