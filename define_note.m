function [note,oct] = define_note(f)
[oct,num]=chooseoctave(f);
f=f/(2.^(-4+num));
if f >= 254.284 & f < 269.4045
    note = ('��');
elseif f >= 269.4045 & f < 285.424
    note = ('�� ����');
elseif f >= 285.424 & f < 302.396
    note = ('��');
elseif f >= 302.396 & f < 320.3775
    note = ('�� ����');
elseif f >= 320.3775 & f < 339.428
    note = ('��');
elseif f >= 339.428 & f < 359.611
    note = ('��');
elseif f >= 359.611 & f < 380.9945
    note = ('�� ����');
elseif f >= 380.9945 & f < 403.65
    note = ('����');
elseif f >= 403.65 & f < 427.6525
    note = ('���� ����');
elseif f >= 427.6525 & f < 453.082
    note = ('��');
elseif f >= 453.082 & f < 480.0235
    note = ('�� ����');
elseif f >= 480.0235 & f < 508.567
    note = ('��');
else
    disp('������� ��� ���������')
end

end
