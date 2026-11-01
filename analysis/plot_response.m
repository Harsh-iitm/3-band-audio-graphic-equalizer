% Plot the equalizer response measurements recorded in data/response.csv.
% Run from MATLAB with: run("analysis/plot_response.m")

clear;
clc;

projectRoot = fileparts(fileparts(mfilename("fullpath")));
dataFile = fullfile(projectRoot, "data", "response.csv");
readings = readtable(dataFile, "TextType", "string");

bands = ["low", "mid", "high"];
bandLabels = ["Low band", "Mid band", "High band"];
designedHz = [100, 1500, 10000];
measuredHz = [160, 1475, 7800];

figure("Color", "w", "Name", "3-Band Equalizer Measured Response");
tiledlayout(3, 1, "TileSpacing", "compact");

for k = 1:numel(bands)
    selected = readings.band == bands(k);
    f = readings.frequency_hz(selected);
    vpp = readings.output_vpp(selected);

    nexttile;
    semilogx(f, vpp, "o-", "LineWidth", 1.6, "MarkerSize", 5);
    hold on;
    xline(designedHz(k), "--", "Designed");
    xline(measuredHz(k), ":", "Measured center");
    grid on;
    xlabel("Frequency (Hz)");
    ylabel("Output (Vpp)");
    title(bandLabels(k) + " response");
    legend("Recorded sweep", "Location", "best");
end

sgtitle("Three-Band Audio Equalizer: Recorded Frequency Sweeps");
