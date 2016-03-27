function [ m ] = Regression( sp1 )
% Linear Regresssion using Gradient descent
%   
i=0;  % itervalue
m=2;
J=1;
C=1;
D=1;
alpha =0.002; % Learning rate
while (J>=10^-6)
   i=i+1;
 D=sum((m*sp1(:,1) -sp1(:,2)).^2) ;
C(i) =sum((m*sp1(:,1) -sp1(:,2)).^2) ;
J = sum((m*sp1(:,1) -sp1(:,2))*2.*sp1(:,1)); 
m = m - J*alpha;
end

plot(1:1:i,C); %Cost function plot
xlabel('Iteration number');
ylabel('Cost slope');
pause;


end

