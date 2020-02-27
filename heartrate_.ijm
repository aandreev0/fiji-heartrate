/*

Andrey Andreev, PhD
me@aandreev.net

27-6-2019 University of Southern California
02-27-2020 Caltech

*/

Stack.getUnits(X, Y, Z, time_units, Value);

fname =getTitle();
// run image difference:
Stack.getDimensions(width, height, channels, zframes, Nframes);
run("Duplicate...", "title=1 duplicate range=1-"+(Nframes-1));
img_1 = getTitle();
selectWindow(fname);
run("Duplicate...", "title=2 duplicate range=2-"+(Nframes));
img_2 = getTitle();
imageCalculator("Subtract create 32-bit stack", img_2,img_1);
res = getTitle();
selectWindow(res);
// run analysis
run("Plot Z-axis Profile");
Plot.getValues(xvalues, yvalues_raw);
Fs = 1./(xvalues[1] - xvalues[0]); // period of sampling, units

windowType="None"; //None, Hamming, Hann or Flattop
N = lengthOf(yvalues_raw);
N2 = pow(2, (floor(log(N) / log(2)))); // round up to the nearest power of 2

yvalues = Array.slice(yvalues_raw,0,N2-1);

y = Array.fourier(yvalues);

f = newArray(lengthOf(y));
fs = newArray(lengthOf(y));
for (i=0; i<lengthOf(y); i++){
	f[i] = 1 / ( Fs*i/N2 ); // translate to period
	fs[i] = Fs*i/N2;
}

f[0] = NaN;

Plot.create("Fourier amplitudes: "+windowType, "Period, "+time_units, "Amplitude (RMS)", f, y);
Plot.show();
Plot.setLimits(0, 1 / ( Fs*2*1/N2),NaN,NaN);

Plot.create("Fourier amplitudes: "+windowType, "Frequency, 1/"+time_units, "Amplitude (RMS)", fs, y);
Plot.show();
Plot.setLimits(0, ( Fs/2),NaN,NaN);
