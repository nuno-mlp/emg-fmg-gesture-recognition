function plot_signals(fmg_A1, fmg_A2, emg_A3, emg_A4, onsets_A3, offsets_A3, onsets_A4, offsets_A4, mavg_emg_A3, mavg_emg_A4, file_name, fs)
    % Create time vector in milliseconds
    t = (0:length(emg_A3)-1) / fs * 1000;

    % Plot raw EMG signals
    subplot(3, 2, 1);
    plot_raw_emg(t, emg_A3, onsets_A3, offsets_A3, 'EMG Extensor');
    
    subplot(3, 2, 2);
    plot_raw_emg(t, emg_A4, onsets_A4, offsets_A4, 'EMG Flexor');

    % Plot preprocessed EMG signals
    subplot(3, 2, 3);
    plot_preprocessed_emg(t, mavg_emg_A3, onsets_A3, offsets_A3, 'Preprocessed EMG Extensor');
    
    subplot(3, 2, 4);
    plot_preprocessed_emg(t, mavg_emg_A4, onsets_A4, offsets_A4, 'Preprocessed EMG Flexor');

    % Plot FMG signals
    subplot(3, 2, 5);
    plot_fmg(t, fmg_A1, onsets_A3, offsets_A3, 'FMG Extensor');
    
    subplot(3, 2, 6);
    plot_fmg(t, fmg_A2, onsets_A4, offsets_A4, 'FMG Flexor');

    % Set title and layout
    sgtitle(file_name);
    set(gcf, 'Position', [100, 100, 800, 800]);
end

function plot_raw_emg(t, emg, onsets, offsets, title_str)
    plot(t, emg);
    hold on;
    plot_onset_offset(t(onsets), [min(emg), max(emg)], 'g');
    plot_onset_offset(t(offsets), [min(emg), max(emg)], 'r');
    hold off;
    title(title_str);
    xlabel('Time (ms)');
    ylabel('Amplitude');
end

function plot_preprocessed_emg(t, mavg_emg, onsets, offsets, title_str)
    plot(t, mavg_emg);
    hold on;
    plot_onset_offset(t(onsets), [min(mavg_emg), max(mavg_emg)], 'g');
    plot_onset_offset(t(offsets), [min(mavg_emg), max(mavg_emg)], 'r');
    hold off;
    title(title_str);
    xlabel('Time (ms)');
    ylabel('Amplitude');
end

function plot_fmg(t, fmg, onsets, offsets, title_str)
    plot(t, fmg);
    hold on;
    plot_onset_offset(t(onsets), [min(fmg), max(fmg)], 'g');
    plot_onset_offset(t(offsets), [min(fmg), max(fmg)], 'r');
    hold off;
    title(title_str);
    xlabel('Time (ms)');
    ylabel('Amplitude');
end

% Function to plot onset and offset markers
function plot_onset_offset(times, y_limits, color)
    for i = 1:length(times)
        plot([times(i), times(i)], y_limits, color, 'LineWidth', 1);
    end
end