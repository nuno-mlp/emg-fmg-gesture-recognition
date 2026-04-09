function Hd = filtbandpass20500
% Returns a discrete-time Butterworth bandpass filter object.

Fs = 1000;  % Sampling Frequency

Fstop1 = 20;          % First Stopband Frequency
Fpass1 = 25;          % First Passband Frequency
Fpass2 = 490;         % Second Passband Frequency
Fstop2 = 495;         % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

end
