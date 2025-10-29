%     References
%     ----------
%     Athena Nouhi
%     A GUI on Biosignal-Specific Processing Pipeline
function count = find_slopSign(signal,threshold)
sum=0;
for i=2:length(signal)-1
    if (((signal(i)>signal(i-1)) && (signal(i)>signal(i+1))) || ((signal(i)<signal(i-1)) && (signal(i)<signal(i+1)))) && (abs(signal(i)-signal(i-1))> threshold || abs(signal(i)-signal(i+1))> threshold)
        sum=sum+1;
    end
end
count = sum;
end