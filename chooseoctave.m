%After defining main tone this function will determine octave through frequency

function [oct,num] = chooseoctave(f)
%Receives only one parameter - f as frequency. Returns octave name - oct and num - number of octave (required for note definition)

if f >= 15 &  f <= 31
    oct = ('subcontroctave');
    num = 0;
elseif f >= 32 & f <= 63
    oct = ('counter octave');
    num = 1;
elseif f >= 64 & f <= 124 
    oct = ('large octave');
    num = 2;
elseif f >= 128 & f <= 252
    oct = ('small octave');
    num = 3;
elseif f >= 259 & f <= 510
    oct = ('first octave');
    num = 4;
elseif f >= 515 & f <= 1010
    oct = ('second octave');
    num = 5;
elseif f >= 1030 & f <= 1995
    oct= ('third octave');s
    num = 6;
elseif f >= 2050 & f <= 4050
    oct = ('fourth octave');
    num = 7;
elseif f >= 4150 & f <= 7902
    oct = ('fifth octave');
num = 8;
end

end
