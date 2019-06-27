/*

Andrey Andreev, PhD
me@aandreev.net

University of Southern California
27-6-2019

*/


run("Plot Z-axis Profile");
Plot.getValues(xvalues, yvalues_raw);
Fs = 1./(xvalues[1] - xvalues[0]); // period of sampling, units

windowType="None"; //None, Hamming, Hann or Flattop
N = lengthOf(yvalues_raw);
N2 = pow(2, (floor(log(N) / log(2)))); // round up to the nearest power of 2

yvalues = Array.slice(yvalues_raw,0,N2-1);

y = Array.fourier(yvalues);

f = newArray(lengthOf(y));
for (i=0; i<lengthOf(y); i++){
	f[i] = 1 / ( Fs*i/N2 ); // translate to period
	
}
f[0] = NaN;
Plot.create("Fourier amplitudes: "+windowType, "Period", "Amplitude (RMS)", f, y);

Plot.show();
Plot.setLimits(0, 1 / ( Fs*2*1/N2),NaN,NaN);