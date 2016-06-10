clear all;
clc;

s = serial('COM3');
s.InputBufferSize = 50000;
s.BaudRate = 115200;

try
    fopen(s);
    % Reading Binary Data http://cn.mathworks.com/help/matlab/matlab_external/writing-and-reading-data.html
    % fread read 10 bytes from buffer, disgard terminator 
    out = fread(s,10,'uint8');
    % show ascii http://www.asciitable.com/
    disp(out);
catch ex
    disp(ex);
end

fclose(s);
delete(s);
clear s;