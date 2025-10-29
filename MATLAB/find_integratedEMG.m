%[2012]-"Feature reduction and selection for EMG signal classification"
%(1)
function IEMG = find_integratedEMG(X)
IEMG = sum(abs(X));
end
