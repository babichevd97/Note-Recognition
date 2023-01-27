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

