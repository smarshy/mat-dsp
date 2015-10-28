
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
l3=l1+l2-1;
%%
%using Frequency domain
xf1=fft(x1,l3);
xf2=fft(x2,l3);
xf3=xf1.*xf2;
xc1=zeros(1,l3);
xc1=ifft(xf3);

%%
%using time domain
H=zeros(l3);
h1=x2';
h=zeros(1,l3);
h=h';
for a=1:length(h1)
    h(a)= h1(a);
end

for m= 1:l3
    H(:,m)=h;
   h=[h(end);h(1:end-1)];
end
x1_1=zeros(1,l3);
for a=1:length(x1)
    x1_1(a)= x1(a);
end

xc2=zeros(1,l3);
xc2=H*x1_1';

%%
%using time domain definition method
xc3=zeros(1,l3);
for n=0 : l3-1
   sum=0;
        for k=0 : max(l1,l2)-1
            if(n-k)>=0 && (n-k)<=l2-1
            sum=sum+x1(k+1)*x2(n-k+1);
            end
        end 
        xc3(n+1)=sum;
end

using_inbuilt_function= conv(x1,x2)
xc1
xc2
xc3
