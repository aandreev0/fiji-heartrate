Andrey Andreev, PhD
me@aandreev.net

University of Southern California

# fiji-heartrate

Fiji/ImageJ plugin for quick assessment of heart rate

1. Open image stack of interest
2. Run plugin
3. Power spectrum is calculated using 1D Fast Hartley Transform
4. Plot power spectrum in power-period coordinates, using original data sampling rate

# Notes

 - Works on XYZ stack as well as XYT
 - Make sure units / sampling period is properly set up in Image -> Properties

# References:

 - Demonstration of the Array.fourier() https://imagej.nih.gov/ij/macros/examples/TestArrayFourier.txt