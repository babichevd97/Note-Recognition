%function to build signal in digital form (counts, time representation)
%function is not used in main code, it is only for convinience

function load_and_plot(signal)

[data,fs]=audioread(signal); %signal representation as samples + sampling rate
data=data(:,1); %turn stereo sound into mono (one-dimensional array)
N=length(data); %sampling length (signal length)
t=linspace(0,N/fs,N); %calculate the moments of time for each count (unit of time per count)

%сonstructing the signal (counts, time)
figure;
plot(t,data);xlabel('time(sec)');ylabel('samples');
end