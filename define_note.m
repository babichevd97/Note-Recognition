function [note,oct] = define_note(f)
[oct,num]=chooseoctave(f);
f=f/(2.^(-4+num));
if f >= 254.284 & f < 269.4045
    note = ('До');
elseif f >= 269.4045 & f < 285.424
    note = ('До диез');
elseif f >= 285.424 & f < 302.396
    note = ('Ре');
elseif f >= 302.396 & f < 320.3775
    note = ('Ре диез');
elseif f >= 320.3775 & f < 339.428
    note = ('Ми');
elseif f >= 339.428 & f < 359.611
    note = ('Фа');
elseif f >= 359.611 & f < 380.9945
    note = ('Фа диез');
elseif f >= 380.9945 & f < 403.65
    note = ('Соль');
elseif f >= 403.65 & f < 427.6525
    note = ('Соль диез');
elseif f >= 427.6525 & f < 453.082
    note = ('Ля');
elseif f >= 453.082 & f < 480.0235
    note = ('Ля диез');
elseif f >= 480.0235 & f < 508.567
    note = ('Си');
else
    disp('Частота вне диапазона')
end

end
