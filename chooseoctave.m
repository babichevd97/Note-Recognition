function [oct,num] = chooseoctave(f)
if f >= 15 &  f <= 31
    oct = ('Субконтроктава');
    num = 0;
elseif f >= 32 & f <= 63
    oct = ('Контроктава');
    num = 1;
elseif f >= 64 & f <= 124 
    oct = ('Большая октава');
    num = 2;
elseif f >= 128 & f <= 252
    oct = ('Малая октава');
    num = 3;
elseif f >= 259 & f <= 510
    oct = ('Первая октава');
    num = 4;
elseif f >= 515 & f <= 1010
    oct = ('Вторая октава');
    num = 5;
elseif f >= 1030 & f <= 1995
    oct= ('Третья октава');
    num = 6;
elseif f >= 2050 & f <= 4050
    oct = ('Четвертая октава');
    num = 7;
elseif f >= 4150 & f <= 7902
    oct = ('Пятая октава');
    num = 8;
end

end