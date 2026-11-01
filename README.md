# 3-Band Audio Graphic Equalizer

A three-band analog audio equalizer built with op-amp filter stages and frequency-selective RC networks. Separate low-, mid-, and high-frequency paths provide band-specific level adjustment. The design work used LTspice for circuit analysis; the prototype was assembled on a breadboard and its audio response was checked with an ADALM1000 and MATLAB.

## Band targets and measured centers

| Band | Designed center | Measured center | Difference |
| --- | ---: | ---: | ---: |
| Low | 100 Hz | 160 Hz | +60.0% |
| Mid | 1,500 Hz | 1,475 Hz | -1.7% |
| High | 10,000 Hz | 7,800 Hz | -22.0% |

The measured center frequencies and sweep readings below are transcribed from the project report. The measured center values are the reported results; the CSV contains the recorded frequency/peak-to-peak output voltage sweep for each band.

## Recorded frequency response

The report records peak-to-peak output voltage at each test frequency:

- Low band: 120–200 Hz, 2.74–3.56 Vpp.
- Mid band: 1.1–1.9 kHz, 0.84–0.94 Vpp.
- High band: 5–12 kHz, 2.04–3.42 Vpp.

See [data/response.csv](data/response.csv) for the complete readings and [analysis/plot_response.m](analysis/plot_response.m) for the MATLAB plot script.

## Audio test workflow

The report documents a MATLAB audio path using an input WAV file and ADALM1000 streaming: the audio is converted to mono, resampled to the interface rate, normalized and offset for the analog input range, streamed through the external filter circuit, then captured and compared in time and frequency domains. The audio test observations report level changes through the filter passbands, unchanged tone frequency for pure-tone input, reduced output outside a passband, and a small background-noise component.

## Circuit and tools

- Three active op-amp filter sections: low-pass, band-pass, and high-pass.
- Frequency-selective RC networks and adjustable band gain.
- Circuit analysis: LTspice.
- Hardware audio measurements: ADALM1000, breadboard prototype.
- Signal analysis and plotting: MATLAB.

The report contains a prototype photograph and measured response tables. It does not specify a component-by-component schematic or resistor/capacitor values, so this repository records the documented targets and measurements without assigning undocumented component values.

## Repository files

- `data/response.csv` — recorded frequency and output voltage readings.
- `analysis/plot_response.m` — MATLAB script to plot the three measured response sweeps.

## Skills

Analog circuits · Active filters · Op-amps · LTspice · MATLAB · Frequency response analysis · Audio signal conditioning
