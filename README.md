# Phonogram note analysis algorithm of a string musical instrument
The work is devoted to the implementation of an adaptive algorithm for phonogram note analysis, which can be considered as an intermediate step in the work of other algorithms. Test phonograms of musical instruments contain notes that differ greatly both in sound and in structure. In view of this, the suitable parameters are selected. 
The result of this work is the developed algorithms:
- Determination of the beginning and end of the sound of a note. 
- Definition of frequency of the basic tone of a sounding note on the basis of several methods.
- Note recognition.
The algorithms were tested on 15 phonograms of different complexity. The algorithms show a high accuracy of note detection, the minimum percentage of recognition - 75%.

## Theoretical Introduction
Most of the signals around us are difficult to express in the form of a simple mathematical formula, because over time the signal can become louder and quieter, can sound intermittent or constant. In this case the signal can be represented as a sum of simple basis functions φ(t). Then the original signal can be represented in the following form:
$$f(t)=\sum_{k=-∞}^∞c_kφ(t)$$
- f(t) – initial signal
- c_k – decomposition coefficient, depending on the signal f(t)
- φ(t) – chosen basis

### Fourier Transform
In our case, we work with a string musical instrument. String oscillation can be represented as a sum of harmonic functions (sine and cosine), then the initial signal can be decomposed into a basis of orthogonal functions - sine and cosine. In general, the decomposition will have the following form:
$$f(t)=\sum_{k=-∞}^{+∞}c_ke^ikwt$$
- f(t) – initial signal
- t – time
- с_k – decomposition coefficient, depending on the signal f(t)
- kw – harmonic frequency
- e^ikwt – complex form of the sine and cosine record

This representation of the signal is called a Fourier series decomposition (Fourier Transform). 

### Discrete Fourier Transform
For this work ase we will use Discrete Fourier Transform to obtain the spectrum of the signal as a set of numbers. This representation of the spectrum allows us to use computer power and the application of various methods for analysis.
Discrete Fourier Transform formula have the following form:
$$X_k=\sum_{n=0}^{N-1}x_ne^{(-2πi/N)kn}$$
- N - number of signal samples 
- n - discrete time value
- x_n – values of the signal samples, input parameter
- X_k – output data, complex amplitude values
- k - frequency index

Spectrum represented by a set of numbers can be analyzed using numerical methods. And in the spectrum of the signal there is information about the frequencies of the sounding notes. 
On top of that Matlab supports this transformation as well as lots of numerical methods for analysis

### Window Fourier Transform
The algorithm is based on the discrete Fourier transform described above. In order to show the dependence of the harmonic frequency of the original signal on time, some "Window" (window or weight function) is used. It runs through the whole time interval in such a way that for each time interval, the window function is applied:
$$W(n-m)$$
- n - array samples index
- m - sets the position of the window

This function is multiplied with each of the intervals, and can be applied with some overlap to each interval (for more accurate analysis). Subsequently, the Fourier transform for each interval is calculated. The result of multiplication is a complex vector of amplitudes corresponding to samples of the selected interval, which is written into a matrix and represents the magnitude and phase of each point in time and frequency.
In general, it looks like this:
$$X(m,w)=\sum_{n=-∞}^∞x[n]W(n-m)e^{-jwn}$$
- x[n] - array of samples
- W[n] - window function

![plot](./Images/WindowFourier.png)

The choice of window depends on the task and on the original signal. After all, by selecting some part of the signal with the window function, it is impossible to reproduce all the frequency characteristics on a given interval as accurately as possible. Window function creates spectral leaks - new frequencies appear that are not present in audio signal. You can minimize the number of leaks just by properly selecting the window function. For example, a simple rectangular window is ideal for sinusoids of comparable loudness, but you should not use this window for sinusoids with disparate amplitudes. The Blackman window is good for cases where high frequency spectrum leakage obscures low frequencies. These windows, in turn, do not handle noise well. The Henning window is the best option for analyzing almost periodic signals, which are the vibrations of strings.

The only disadvantage of the Fourier window transform is that good frequency-time resolution cannot be achieved simultaneously in time and frequency. It is not possible to provide minimum distortion for both features. A wide window gives excellent representation in the frequency domain, while it is impossible to determine when the signal started and when it finished. On the other hand, a narrow window gives excellent representation in the time domain, while being poor in the frequency domain. The choice of window width is a compromise and depends on the task at hand and the problem being investigated.

