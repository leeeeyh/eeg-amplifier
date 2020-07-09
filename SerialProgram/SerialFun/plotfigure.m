close all;
a = load('ads_data1.txt');
b = a(:,2);
c = bp(b);
d = bp10(c);
e =lp30(d);
x = b(1000:5000);
%ʱ����
% subplot(311);
figure
% t = (0:1/250:length(x)/250 - 1/250);
% plot(t,b);
plot(x);
xlabel('time/s');
ylabel('uV');
title('ʱ���ź�');

%Ƶ����
% d=fft(x);
% L = 1000;
% f = 250*(0:(L/2))/L;
% Fs=250;
% P2 = abs(d/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);

N = 1000;
Fs=250;T=1/Fs;Tp=N*T;
fst=fft(x,N);k=0:N-1;f=k/Tp;

figure
% subplot(312);
%plot(f,P1);
plot(f,abs(fst)/max(abs(fst)));
xlabel('Ƶ��');
ylabel('����');
title('��Ƶ��Ӧ');

%������
N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(x):Fs/2;

figure
%subplot(313);
plot(freq,psdx)
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')