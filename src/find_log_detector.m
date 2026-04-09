%     References
%     ----------
%     Athena Nouhi
%     A GUI on Biosignal-Specific Processing Pipeline
function logDetect = find_log_detector(signal)
N=length(signal);
logDetect = exp((sum(log10(abs(signal))))/N);
end
