
# Static Analysis

> When two utilities interconnect their systems, they do so for several reasons. One is to be able to buy and sell power with neighboring systems whose operating costs make such transactions profitable. Further, even if no power is being transmitted over ties to neighboring systems, if one system has a sudden loss of a generating unit, the units throughout all the interconnection will experience a frequency change and can help in restoring frequency. [_wood2014power_]

## Frequency Dependence of Consumption Devices

- Frequency dependent (i.e. motors) <img src="/docs/tex/6c07b86d20085d4e2fe9aa86866b256f.svg?invert_in_darkmode&sanitize=true" align=middle width=82.0842792pt height=23.58895770000001pt/>, where <img src="/docs/tex/ef7cbe5f31eca0181d2d1a7c09d8802c.svg?invert_in_darkmode&sanitize=true" align=middle width=27.72839189999999pt height=22.465723500000017pt/> is the number of pole pairs
- Frequency independent (i.e. lights, computers)


## Governor

> Suppose a generating unit is operated with fixed mechanical power output from the turbine. The result of any load change would be a speed change sufficient to cause the frequency-sensitive load to exactly compensate for the load change (as in Example 10A). This condition would allow system frequency to drift far outside acceptable limits. This is overcome by adding a governing mechanism that senses the machine speed, and adjusts the input valve to change the mechanical power output to compensate for load changes and to restore frequency to nominal value. [_wood2014power_]

Two types of governor

- isochronous (constant speed) governor for systems with only one generator
- speed droop governor for systems with multiple generators

## Droop Characteristics of Generators

When there are multiple generators in a power system, generators

- operate at the same frequency,
- share and supply any load change in the system according to their droop characteristic.

Droop characteristics of some generator shows how it react to some frequency change. It determines the change on the unit’s output for a given change in frequency. Note that the true value of droop is used in the calculation, while the percentage value is used when stated. "_Common practice is to set R on each generating unit so that a change from 0 to 100% (i.e., rated) output will result in the same frequency change for each unit. As a result, a change in electrical load on a system will be compensated by generator unit output changes proportional to each unit’s rated output._" [_wood2014power_] It is assumed that the droop of generator <img src="/docs/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, <img src="/docs/tex/82763aa72d7364a00f652e44d26604e9.svg?invert_in_darkmode&sanitize=true" align=middle width=17.132374049999992pt height=22.465723500000017pt/>, is fixed. Frequency bias <img src="/docs/tex/50b4930fbe0a5c05a9639621f664da50.svg?invert_in_darkmode&sanitize=true" align=middle width=17.11955024999999pt height=22.465723500000017pt/> of generator <img src="/docs/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/> can be calculated by:

<p align="center"><img src="/docs/tex/0a392b5ecbccc852eae1522dd6c09d14.svg?invert_in_darkmode&sanitize=true" align=middle width=112.22890634999999pt height=41.50351095pt/></p>

If a frequency change <img src="/docs/tex/5d287dab9fa370f57a1a7ca52c46f728.svg?invert_in_darkmode&sanitize=true" align=middle width=23.516088749999987pt height=22.831056599999986pt/> is observed suddenly, changes in power productions of generators <img src="/docs/tex/6cc81ec4646ef587d22a81edca3ee3bd.svg?invert_in_darkmode&sanitize=true" align=middle width=28.90321829999999pt height=22.465723500000017pt/> are proportional with their frequency bias. Then, the power output of generator <img src="/docs/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/> in the new steady state <img src="/docs/tex/23b9181359e0077a5d46c5479b5d864f.svg?invert_in_darkmode&sanitize=true" align=middle width=35.50240484999999pt height=22.465723500000017pt/> will be:

<p align="center"><img src="/docs/tex/d9d4cd6dc5e428362e974dc5e1ed095c.svg?invert_in_darkmode&sanitize=true" align=middle width=251.04421979999998pt height=17.9287383pt/></p>

Then, the system power output in the new steady state will be:

<p align="center"><img src="/docs/tex/abdb7954d2f6cc4807c8f76e5857d213.svg?invert_in_darkmode&sanitize=true" align=middle width=371.90125665pt height=37.775108249999995pt/></p>

If <img src="/docs/tex/5d287dab9fa370f57a1a7ca52c46f728.svg?invert_in_darkmode&sanitize=true" align=middle width=23.516088749999987pt height=22.831056599999986pt/> is caused by a change of the system load <img src="/docs/tex/05928d182026fcac092718e010f7259d.svg?invert_in_darkmode&sanitize=true" align=middle width=24.88591379999999pt height=22.465723500000017pt/>, then:

<p align="center"><img src="/docs/tex/ca65dcf19111584e23a6a04192cad9b3.svg?invert_in_darkmode&sanitize=true" align=middle width=96.39846975pt height=14.611878599999999pt/></p>

because <img src="/docs/tex/cb31a0d19ca3fb20412e0a21da6103cd.svg?invert_in_darkmode&sanitize=true" align=middle width=348.37774785pt height=26.085962100000025pt/> and <img src="/docs/tex/5cb7a6e05a0be955c711699a6ff18487.svg?invert_in_darkmode&sanitize=true" align=middle width=108.27504764999999pt height=26.085962100000025pt/>.

Instead, if <img src="/docs/tex/5d287dab9fa370f57a1a7ca52c46f728.svg?invert_in_darkmode&sanitize=true" align=middle width=23.516088749999987pt height=22.831056599999986pt/> is unknown, it can be calculated by:

<p align="center"><img src="/docs/tex/1dd4d7d9430b1e4d5b2889f811a55619.svg?invert_in_darkmode&sanitize=true" align=middle width=104.61768239999999pt height=16.438356pt/></p>

If some generator trips, the system frequency bias will change accordingly, and the new steady state will be based on <img src="/docs/tex/de9312bbb012c640f2bc77e87415bfad.svg?invert_in_darkmode&sanitize=true" align=middle width=35.95903574999999pt height=22.465723500000017pt/>.

Infinite systems refer to those with the following features:

- large interconnected system
- dictates the frequency, while the unit only controls its power
- any frequency change influences the power production of the units

## Appendix

<p align="center"><img src="/docs/tex/9c420cb700e2431c664f364c585880f5.svg?invert_in_darkmode&sanitize=true" align=middle width=60.73625249999999pt height=40.182651299999996pt/></p>

Delta representation describes the deviation of quantities from initial steady state values. The states don't need to be initialized (initialized automatically with zero). Besides, it is easy to use transfer functions (no initial transients).

<p align="center"><img src="/docs/tex/3d32c8251f68c6f9ce5fedbe183d3980.svg?invert_in_darkmode&sanitize=true" align=middle width=144.69172905pt height=65.753424pt/></p>

---

[_wood2014power_]: https://github.com/edxu96/symposium/tree/master/bib/SDN.bib
