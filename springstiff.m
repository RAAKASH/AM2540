%% Readme    
% 
n = [27,34];  
r = [2.85,2.88]/2/1000 ;    % in m
R = [41.8,31.96]/2/1000;    % in m
G = 20 *10^9;               % in pascals   (Enter appropriate value)
k = (G/4) *((r.^4)./(R.^3))./n;   % theoretical values for spring 1 ,spring2

%Note : variable kt generated in the workspace is spring constant obtained after linear regression  
%       variable ktt1,ktt2 represent piecewise spring constants 

%%  Spring 1
s1 = [0,410,409;200,411,410;400,412,413;600,414,415;800,416,418;1000,421,421];
s1=s1/1000;
sp1 = [s1(:,1), (s1(:,2)+s1(:,3))/2];
% plot(sp1(:,1),sp1(:,2));
plot(sp1(:,1),sp1(:,2));
xlabel('Load in Kg');
ylabel('Deflection in m');
title('Spring 1');
pause;
% y = p1*x + p2; ,p1=.011286 ,p2 =.40852
p1=.011286;
kt1 = 1/p1;

g = -sp1(1:5,:)+ sp1(2:end,:); 
ktt1= g(:,1)./g(:,2); 

%%  Spring 2

s2 = [0,9.85,9.82;2,8.8,8.74;2.5,8.27,8.13;3,7.86,7.7;3.5,7.29,7.29];
s2(:,2:3)=s2(:,2:3)/100;
sp2 = [s2(:,1), (s2(:,2)+s2(:,3))/2];

plot(sp2(:,1),sp2(:,2));
xlabel('Load in Kg');
ylabel('Deflection in m');
title('Spring 2');
% y = p1*x + p2; ,p1=.0071644 ,p2 =.099512
p1=.0071644;
kt2 = 1/p1;
kt = [kt1,kt2];
g = -sp2(1:4,:)+ sp2(2:end,:); 
ktt2= g(:,1)./g(:,2); 
pause;
%% Nonlin spring
s3 = [0,7.5,7.8;200,7.1,6.9;400,6.0,5.8;600,5.2,5.1;800,4.4,4.2;1000,3.2,3.2];
s3(:,2:3)=s3(:,2:3)/100;
s3(:,1)=s3(:,1)/1000;
sp3 = [s1(:,1), (s3(:,2)+s3(:,3))/2];
plot(sp3(:,1),sp3(:,2));
xlabel('Load in Kg');
ylabel('Deflection in m');
title('Spring 3 (Nonlinear spring)');
pause;

%% strain gauge
b = 24.89 /1000; % in m
h = 6.27/1000 ;  % in m
lo = 25/100;     % in m
l1 = 24.6/100;   % in m
E = 690*10^9 ;   % in Pascals
del = (0:0.5:3)/1000; % in m
Izz = 1/12 *b*h^3; 
% Theoretical
P= del*3*E*Izz/lo^3   ;
M = P*l1;
sigma = M/Izz*h/2 ;
e     = sigma /E;    % theoretical strain

% Experimental
ep = 10^-6*[0,58,120,178,234,292,352];
%Error
error = (e-ep)*10^6;
plot(del*1000,e,del*1000,ep);
xlabel('Deflection in mm');
ylabel('strain in (mm/mm)');
legend('Theoretical','Experimental');
