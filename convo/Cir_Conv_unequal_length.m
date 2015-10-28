
%  Program to find the circular convolution of array having unequal length
%%
clc;
clear all;
x1=[1,2,3,4];
x3=[2,3];

x2=zeros(1,length(x1));
for a=1:length(x3)
    x2(a)= x3(a);
end

l1=length(x1);
l2=length(x3);

%%
%using Frequency domain
xf1=fft(x1);
xf2=fft(x2);
xf3=xf1.*xf2;
xc1=ifft(xf3);

%%
%using time domain
H=zeros(4);
h=x2';
for m= 1:max(l1,l2);
    H(:,m)=h;
   h=[h(end);h(1:end-1)];
end
xc2=H*x1';
%%
%using time domain definition method
for n=0:3;
    sum=0;
    for k=0:3
        sum=sum+x1(k+1)*x2(mod(n-k,4)+1);
    end
    xc3(n+1)=sum;
end
using_inbuilt_function= cconv(x1,x2,max(l1,l2))
xc1
xc2
xc3
