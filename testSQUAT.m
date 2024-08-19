startup_SQAT;
pkg load signal

fs = 48000;
length = fs * 10;
m = 100;
fmod = 2;
fsig = 1000;
level = 60;
p0 = 20e-6;


time = linspace(0, length - 1, length) / fs;
modulationSine = 1 + (m / 100)*(0.5 * sin(2 * pi * fmod * time) - 0.5);
signal = modulationSine .* sin(2 * pi * fsig * time);

scale = (p0 * 10^(level/20)) / sqrt(mean(signal.^2));
signal = (scale * signal)';

OUT = FluctuationStrength_Osses2016(signal, fs,...  % input signal and sampling freq.
                                                    1,...  % method=0, stationary analysis- window size=length(insig); method=1, time_varying analysis - window size=2s
                                                    0,...  % time_skip, in seconds for statistical calculations
                                                    1);    % show results, 'false' (disable, default value) or 'true' (enable)
