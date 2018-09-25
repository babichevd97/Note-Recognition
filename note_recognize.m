function note_recognize(signal)
format long g;
signal = ('Guitar_bass_and_normal.wav'); %������ ������� � ����������
[data,fs]=audioread(signal); %������������� ������� � ���� �������� + ������� �������������
data=data(:,1); % ������ �� ������ ����� - ��� (���������� ������)
N=length(data); % ����� �������� (����� �������)
t=linspace(0,N/fs,N); % ��������� ������� ������� ��� ������� ������� (������� ������� �� ������ ������)
% ������ ������ (�������, �����)
%figure;
subplot(2,1,1)
plot(t,data)
xlabel('t')
ylabel('f(t)')
title('������������ ����������')

[S,F,T]=spectrogram(data,hanning(256),200,256,fs); %��������� ������� �������������� �����, ��������� ������������
subplot(2,1,2)
spectrogram(data,hamming(256),200,256,fs,'yaxis');%������, ��������������
title('������������� ����������')
numOfRows_win = size(S, 1); % ����� �����
numOfCols_win = size(S, 2); % ����� ��������, ����� � ����������
max_values_win = zeros(1,numOfCols_win); %������, ����� ������� ������������ �������� ������� S �� �������� ( ����� ����� ����� �� �������)
S_abs=abs(S);%����� �������� �� ������
for i = 1:numOfCols_win;
    max_db_win=S_abs(1,i);%���������� ��� �������� ������������� �������� � �������
    for j=1:numOfRows_win;
        if S_abs(j,i)>max_db_win;
            max_db_win=S_abs(j,i);
        end
    end
max_values_win(i)=max_db_win; % ������ ������������ ��������
end

%������������� �� 0 �� 1
for i = 1:numOfCols_win;
 norm_values_win(i) = (max_values_win(i) - min(max_values_win)) / (max(max_values_win) - min(max_values_win));
 end
 

for i=1:numOfCols_win-4;
    norm_values_win_LPF(i+2)=norm_values_win(i)*0.1+norm_values_win(i+1)*0.2+norm_values_win(i+2)*0.3+norm_values_win(i+4)*0.2+norm_values_win(i+4)*0.1;
end;
norm_values_win_LPF=[norm_values_win_LPF,norm_values_win(numOfCols_win - 1)];
norm_values_win_LPF=[norm_values_win_LPF,norm_values_win(numOfCols_win)];

begin_moments_win = [];
end_moments_win = [];
tmp=1;
while tmp <= numOfCols_win ;%T(i) - ������� ��������
        if norm_values_win_LPF(tmp) > 0.19; %������ �������� 
            begin_moments_win=[begin_moments_win,T(tmp)];% ���������� ������� ������ ������� 
            for i=tmp:numOfCols_win;
            if norm_values_win_LPF(i) < 0.12%����� ��������
                end_moments_win=[end_moments_win,T(i)];% ���������� ������� ����� ��������
              tmp = i;
                break;
            else 
                continue;
            end
            end
        end
       tmp=tmp+1;
end

for i=1:length(begin_moments_win); % ����, ������� ������� ������ ��� �� �� ������ �� �� ����� 
    sample_start_tmp=find (t<begin_moments_win(i)+0.0001 & t>begin_moments_win(i));
    sample_start_tmp=sample_start_tmp(1);
    sample_starts(i)=sample_start_tmp;
    sample_end_tmp=find (t<end_moments_win(i)+0.0001 & t>end_moments_win(i));
    sample_end_tmp=sample_end_tmp(1);
    sample_ends(i)=sample_end_tmp;
    data_cells(i,:)={[data(sample_starts(i):sample_ends(i))]};
    fftdata_cells(i,:)={[abs(fftshift(fft(data_cells{i,1})))]};
    f_cells(i,:)={[linspace(-fs/2,fs/2,length(fftdata_cells{i,1}))]};
    amp_max(i)= max(fftdata_cells{i,1});
    freq_tmp = f_cells{i,1}(find(fftdata_cells{i,1}==amp_max(i)));
    freq_tmp = abs(freq_tmp(1));
    freq_max(i)=freq_tmp;
end
        
for i=1:length(begin_moments_win);
C_cells(i,1)={abs(fft(log(fftdata_cells{i,1})))};
amin=50;
amax=1000;
[Max_at_pitch,freq]=max(C_cells{i,1}(amin:amax));
freq_true(i)=fs/(freq + amin-1);
end
for i = 1:length(freq_true);
if freq_true(i) > freq_max(i);
    freq_true(i)=freq_max(i);
end
end
%disp('Main_freqs:')
%disp(freq_true)
fprintf('����� ��� � ����������: %1.0f \n',length(begin_moments_win));
for i=1:length(begin_moments_win);
    duration(i)=end_moments_win(i)-begin_moments_win(i);
    fprintf('����� ������ %1.0f - �� ����: %5.5f ���, �����: %5.5f ���, ������������: %5.5f sec.\n',i,begin_moments_win(i),end_moments_win(i),duration(i))
    fprintf('�������� ������� %1.0f - � ����: %5.5f ��. ������: %s, ����: %s\n',i,freq_true(i),chooseoctave(freq_true(i)),define_note(freq_true(i)))
    fprintf('\n')
end

disp('--------------------------------������ ��������--------------------------------')
for i=1:length(amp_max)
    max_amp_index_tmp=(find(fftdata_cells{i,1}==amp_max(i)));
    max_amp_index(i)=max_amp_index_tmp(2);
end

for j = 1:length(max_amp_index)
fft_treshold=[];
for i=1:max_amp_index(j)
    if fftdata_cells{j,1}(i) > 40
        fft_treshold=[fft_treshold,fftdata_cells{j,1}(i)];
    end
end
fft_treshold_cells{j,:}=fft_treshold;
end

for j = 1:length(fft_treshold_cells)
for i=1:length(fft_treshold_cells{j,1})
    freq_tmp = f_cells{j,1}(find(fftdata_cells{j,1}==fft_treshold_cells{j,1}(i)));
    freq_tmp = abs(freq_tmp(1));
    freq_num_cells{j,1}(i)=freq_tmp;
end
end

for j = 1:length(fft_treshold_cells);
harmonics=[];
for k=1:5;
for i=1:length(freq_num_cells{j,1});
    if freq_max(j)/freq_num_cells{j,1}(i)>k-0.1 & freq_max(j)/freq_num_cells{j,1}(i)<k+0.1;
        harmonics=[harmonics,freq_num_cells{j,1}(i)];
        break
    end
end
end
harmonics_cells{j,:}=harmonics;
fprintf('�������� ������� %1.0f - � ����: %5.5f ��, ������������ �������: %5.5f ��, ����� ��������� - %1.0f.\n',j,min(harmonics_cells{j,1}),freq_max(j),length(harmonics_cells{j,1}));
end
end
