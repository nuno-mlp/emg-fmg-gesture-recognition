function features = extract_emg_features(X, onsets, offsets)
    n_windows = length(onsets);
    features = [];

    for j = 1:n_windows
        wave = X(onsets(j):offsets(j));
        
        % Time-domain features:
        % Mean Absolute Value (MAV)
        % Root Mean Square (RMS)
        % Standard deviation (SD)
        % Interquartile range (IQR)
        % Waveform Length (WL)
        % Zero Crossings (ZC)
        % Slope Sign Changes (SSC)
        % Willison Amplitude (WAMP)
        % Integrated EMG (IEMG)
        % Kurtosis (KURT)
        % Lod Detector (LOG)
        
        RMS = rms(wave);
        MAV = mean(abs(wave));
        SD = std(wave);
        IQR = iqr(wave);
        WL = find_waveform_length(wave);
        SSC = find_slopSign(wave, 0.015);
        IEMG = find_integratedEMG(wave);
        KURT = kurtosis(wave);
        LOG = find_log_detector(wave);

        % Frequency-domain features:
        % Mean Frequency (MNF)
        % Power Spectral Density (PSD)
        % Peak Frequency (PKF)
        % Mean Power Spectral Density (MNPSD)

        MNF = meanfreq(wave);
        [PSD, F] = pwelch(wave, [], [], [], 1000); % F is the vector of frequencies (in hertz) at which the PSD is estimated        
        [~, maxIndex] = max(PSD);
        PKF = F(maxIndex);
        MNPSD = mean(PSD); 

        % Add features to the output array
        features(j, :) = [RMS MAV SD IQR WL SSC IEMG KURT LOG MNF PKF MNPSD];
    end
end