## [K. Chen's Paper](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6056587)
Interesting Notes:<br/>
1. broadband impedance matching at fundamental and harmonics (note that fundamental optimum load impedance does not vary much with frequency)
1. 2nd harmonic load impedance affects efficiency

Design Process:<br/>
1. device modeling
1. hand calculation, which he didn't show (perhaps he started from ideal class E formulas, and used C_P from the previous step, 180 deg cond angle, and targeted 15W output power, and then found out the required supply)
1. loadpull to find optimum impedance at i/p and o/p at the package plane, perhaps biased as class B (again, opt fund load imp does not vary much with freq, and is inductive, opt fund src imp is small, and goes from ind to cap as freq varies)
1. design appropriate lumped matching networks
1. realize matching network with some components or line types
1. ISM to optimize structural design, export model
1. import into ADS, simulate

Things that are tunable after fab:<br/>
1. bias, which he seemed not to have adjusted
1. adjust driving power (but note that the PA seems to be linear, interesting)
1. adjust supply (o/p pwr grows as sup grows, but efficiency optimized at some supply)

Specs:<br/>
1. output power
1. efficiency
1. bandwidth
1. dynamic range, e.g. gain compression, and max efficiency (I doubt whether these specs make sense, since class E is not a lin amp)
