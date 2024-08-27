clc;
clear;
close;

msg = [1 0 0 1 1 1 0 1 1 1 1 1 1 0 1 1 1 1 1 0 0 1];
bitstuffedmsg = [];
destuffedmsg = [];

count = 0;
for i = 1:length(msg)
    if msg(i) == 0 then
        count = 0;
        bitstuffedmsg = [bitstuffedmsg, msg(i)];
    else
        count = count + 1;
        bitstuffedmsg = [bitstuffedmsg, msg(i)];
        if count == 5 then
            bitstuffedmsg = [bitstuffedmsg, 0];
            count = 0;
        end
    end
end

disp("Bit-stuffed message:");
disp(bitstuffedmsg);

count = 0;
i = 1;
while i <= length(bitstuffedmsg)
    if bitstuffedmsg(i) == 0 then
        count = 0;
        destuffedmsg = [destuffedmsg, bitstuffedmsg(i)];
    else
        count = count + 1;
        destuffedmsg = [destuffedmsg, bitstuffedmsg(i)];
        if count == 5 then
            i = i + 1; // Skip the stuffed bit (next 0) after 5 consecutive 1s
            count = 0;
        end
    end
    i = i + 1;
end

disp("Bit-destuffed message:");
disp(destuffedmsg);
