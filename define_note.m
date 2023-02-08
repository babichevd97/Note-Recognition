%After defining main tone this function will determine note itself through frequency and corresponding octave

function [note,oct] = define_note(f)
%Receives only one parameter - f as frequency. Returns octave name - oct and note name - note

[oct,num]=chooseoctave(f);
%Pre-function to get octave name and octave - number

f=f/(2.^(-4+num));
%Normilizing frequency range

if f >= 254.284 & f < 269.4045
    note = ('C');
elseif f >= 269.4045 & f < 285.424
    note = ('C sharp');
elseif f >= 285.424 & f < 302.396
    note = ('D');
elseif f >= 302.396 & f < 320.3775
    note = ('D sharp');
elseif f >= 320.3775 & f < 339.428
    note = ('E');
elseif f >= 339.428 & f < 359.611
    note = ('F');
elseif f >= 359.611 & f < 380.9945
    note = ('F sharp');
elseif f >= 380.9945 & f < 403.65
    note = ('G');
elseif f >= 403.65 & f < 427.6525
    note = ('G sharp');
elseif f >= 427.6525 & f < 453.082
    note = ('A');
elseif f >= 453.082 & f < 480.0235
    note = ('A sharp');
elseif f >= 480.0235 & f < 508.567
    note = ('B');
else
    disp('Frequency out of range')
end

end
