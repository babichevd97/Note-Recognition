function [oct,num] = chooseoctave(f)
if f >= 15 &  f <= 31
    oct = ('��������������');
    num = 0;
elseif f >= 32 & f <= 63
    oct = ('�����������');
    num = 1;
elseif f >= 64 & f <= 124 
    oct = ('������� ������');
    num = 2;
elseif f >= 128 & f <= 252
    oct = ('����� ������');
    num = 3;
elseif f >= 259 & f <= 510
    oct = ('������ ������');
    num = 4;
elseif f >= 515 & f <= 1010
    oct = ('������ ������');
    num = 5;
elseif f >= 1030 & f <= 1995
    oct= ('������ ������');
    num = 6;
elseif f >= 2050 & f <= 4050
    oct = ('��������� ������');
    num = 7;
elseif f >= 4150 & f <= 7902
    oct = ('����� ������');
    num = 8;
end

end