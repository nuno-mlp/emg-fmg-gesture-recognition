function [onsets, offsets, mavg_emg] = onsetting(onda, sz, threshold_size, a)
    % Full-wave rectification
    fwlo = abs(onda);

    % Moving average for calculating the test function
    tf_mvgav = conv2(fwlo, ones(sz,1)/sz, 'valid'); % Return only parts of the convolution that are computed without zero-padded edges

    % Moving average with 'same' option (the output of the convolution has
    % the same size as the input signal)
    mavg_emg = conv(fwlo, ones(sz, 1) / sz, 'same');
    
    % Moving average for calculating the adaptive threshold
    threshold_mvgav = conv2(fwlo, ones(threshold_size,1)/threshold_size, 'valid'); % conv also works, convolution of 2 1-D arrays
    
    % Threshold for the median averages
    threshold = a*mean(tf_mvgav) + std(tf_mvgav);  % Sets the onset detection threshold as a percentage of the mean (determined by 'a') plus the data's standard deviation.

    onset_time_list = [];
    offset_time_list = [];
    onset = 0;

    ignore_first_samples = 1000; % Set a fixed value for the number of samples to ignore at the beginning, e.g., 1000 samples
    min_distance = 1000; % Set a fixed value for min_distance, e.g., 3000 samples, for the onset-onset distance
    
    for k=1:length(threshold_mvgav)
        if k <= ignore_first_samples
            continue;
        end
        if onset==1 % An onset was previously detected and we are looking for the offset time, applying the same criteria
            if tf_mvgav(k)< threshold_mvgav(k) && tf_mvgav(k) < threshold
                offset_time_list=[offset_time_list k];
                onset=0; % The offset has been detected, and we can look for another activation
            end
        else
            % We only look for another onset if a previous offset was
            % detected
            if tf_mvgav(k) >= threshold_mvgav(k) && tf_mvgav(k) >= threshold
                % Check if the minimum distance requirement is satisfied.
                if isempty(onset_time_list) || (k - onset_time_list(end) > min_distance)
                    % The first index of the sliding window is used as an
                    % estimate for the onset time (simple post-processor
                    onset_time_list=[onset_time_list k];
                    onset = 1;
                end
            end
        end
    end

    % Adjust indices because of moving average
    onset_time_list=onset_time_list+round(sz/2);
    offset_time_list=offset_time_list+round(sz/2);
    
    % To avoid indices of different dimensions data is discarded in
    % whichever array is longer
    if(length(offset_time_list)>length(onset_time_list))   
        offset_time_list=offset_time_list(:,1:end-1);       
    end                                                     
    if(length(onset_time_list)>length(offset_time_list) && onset_time_list(end)>offset_time_list(end))
        onset_time_list=onset_time_list(:,1:end-1);
    end

    % Only periods of activation above 650 miliseconds are considered to
    % rule out false activations
    d=offset_time_list-onset_time_list;
    b=d>650;
    onsets=onset_time_list(b);
    offsets=offset_time_list(b);
end