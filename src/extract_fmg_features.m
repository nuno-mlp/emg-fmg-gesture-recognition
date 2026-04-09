function features = extract_fmg_features(fmg, onsets, offsets)
    n_windows = length(onsets);
    features = [];

    for j = 1:n_windows
        wave = fmg(onsets(j):offsets(j));
        
        mean_fmg = mean(wave);
        rms_fmg = rms(wave);
        std_fmg = std(wave);
        median_fmg = median(wave);
        wl_fmg = find_waveform_length(wave);
        ssc_fmg = find_slopSign(wave, 0.015);

     features(j, :) = [mean_fmg, rms_fmg, std_fmg, median_fmg, wl_fmg, ssc_fmg];
    end
end