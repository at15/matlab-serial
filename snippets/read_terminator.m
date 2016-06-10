clear all;
clc;

s = serial('COM3');
s.InputBufferSize = 50000;
s.BaudRate = 115200;

try
    fopen(s);
    % Reading Text Data http://cn.mathworks.com/help/matlab/matlab_external/writing-and-reading-data.html
    % Terminator is LF aka: \n
    out1 = fscanf(s);
    out2 = fscanf(s);
    disp(out1);
    disp(out2);
catch ex
    disp(ex);
end

fclose(s);
delete(s);
clear s;