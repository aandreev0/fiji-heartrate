Andrey Andreev, PhD
me@aandreev.net

University of Southern California

# fiji-heartrate

Fiji/ImageJ plugin for quick assessment of heart rate

1. Open image stack of interest
1. Use Image->Properties to set up correctly temporal units
1. Select ROI
1. Run plugin
1. Power spectrum is calculated using 1D Fast Hartley Transform
1. Plot power spectrum in power-period coordinates, using original data sampling rate

# Notes

 - Works on XYZ stack as well as XYT
 - Make sure units / sampling period is properly set up in Image -> Properties

# Example

![Example of processing results for zebrafish](https://raw.githubusercontent.com/aandreev0/fiji-heartrate/master/example.png)


# Installation

 - Fiji/ImageJ -> Plugins -> Install... (or Install PlugIn) -> select heartrate_.ijm file
 - Restart Fiji/ImageJ, pluging will appear in the end of Plugins menu

# References:

 - Demonstration of the Array.fourier() https://imagej.nih.gov/ij/macros/examples/TestArrayFourier.txt
