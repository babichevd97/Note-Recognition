# Phonogram note analysis algorithm of a string musical instrument
The work is devoted to the implementation of an adaptive algorithm for phonogram note analysis, which can be considered as an intermediate step in the work of other algorithms. Test phonograms of musical instruments contain notes that differ greatly both in sound and in structure. In view of this, the suitable parameters are selected. 
The result of this work is the developed algorithms:
- Determination of the beginning and end of the sound of a note. 
- Definition of frequency of the basic tone of a sounding note on the basis of several methods.
- Note recognition.
The algorithms were tested on 15 phonograms of different complexity. The algorithms show a high accuracy of note detection, the minimum percentage of recognition - 75%.

## Theoretical Introduction
Most of the signals around us are difficult to express in the form of a simple mathematical formula, because over time the signal can become louder and quieter, can sound intermittent or constant. In this case the signal can be represented as a sum of simple basis functions φ(t). Then the original signal can be represented in the following form:
> f(t)= ∑_(k=-∞)^∞▒〖c_k φ(t) 