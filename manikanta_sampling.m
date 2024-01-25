clc
clear all
close all

% Author manikanta_sampling
fs = input('enter sampling frequancy:');%take input of sampling frequancy

f1 = input('enter signal frequancy:');%take input of signal frequancy

t = 0:1/fs:1;% time period

x = 2*sin(2*pi*f1*t)+5*cos(2*pi*f1*t);%define signal

subplot(2,2,1)
plot(t,x)  %plot original signal
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous signal');

subplot(2,2,2)
stem(t,x)   %plot discrete original signal 
xlabel('\bf time');
ylabel('\bf Amlitude');
title('discrete original signal');

t1 = t(1:2:end);   %extract time for sampling purpose

x1 = 2*sin(2*pi*f1*t1)+5*cos(2*pi*f1*t1);  %define signal for sampling

subplot(2,2,3)
plot(t1,x1)    % plot sample signal 
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous sampled signal');

subplot(2,2,4)
stem(t1, x1)   %plot discrete version of sampled signal
xlabel('\bf time');
ylabel('\bf Amlitude');
title('discrete sampled signal');

x_max = max(x1);
x_min = min(x1);
xquan=x1/x_max;

n=16;     %number of quantization level


d = (x_max-x_min)/n;    %step size for accomdate n quantization level


 q = (x_min:d:x_max);   %store value of level for quantiz purpose
 for ii=1:n
    q1(ii)=(q(ii)+q(ii+1))/2;
 end


%here we are quantised our signal and also change into in decimal value
for jj=1:n
    xquan(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))) = q1(jj).*ones(1,length(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))));
    deci(find(xquan==q1(jj)))=(jj-1).*ones(1,length(find(xquan==q1(jj))));
end



figure(2);
plot(t,xquan);    %plot quantised signal 
xlabel('Time');
ylabel('Amplitude');
title('Quantised Signal');

%change decimal value of level into binary numbers 

bina = cell(size(deci));
for kk=1:length(deci)
    bina{kk}=flip(de2bi(deci(kk), 4));
end