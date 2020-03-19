
# Static Analysis

> When two utilities interconnect their systems, they do so for several reasons. One is to be able to buy and sell power with neighboring systems whose operating costs make such transactions profitable. Further, even if no power is being transmitted over ties to neighboring systems, if one system has a sudden loss of a generating unit, the units throughout all the interconnection will experience a frequency change and can help in restoring frequency. [_wood2014power_]

## Frequency Dependence of Consumption Devices

- Frequency dependent (i.e. motors) $\omega_{\text{gen}} = \frac{\omega_{\text{elec}}}{N_{\text{pp}}}$, where $N_{\text{pp}}$ is the number of pole pairs
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

Droop characteristics of some generator shows how it react to some frequency change. It determines the change on the unit’s output for a given change in frequency. Note that the true value of droop is used in the calculation, while the percentage value is used when stated. "_Common practice is to set R on each generating unit so that a change from 0 to 100% (i.e., rated) output will result in the same frequency change for each unit. As a result, a change in electrical load on a system will be compensated by generator unit output changes proportional to each unit’s rated output._" [_wood2014power_] It is assumed that the droop of generator $i$, $R_{i}$, is fixed. Frequency bias $B_{i}$ of generator $i$ can be calculated by:

$$
B_{i} = \frac{P^{\text{rated}}_{i}}{R_{i} \cdot f^{\text{rated}}_{i}}
$$

If a frequency change $\Delta f$ is observed suddenly, changes in power productions of generators $\Delta P_{i}$ are proportional with their frequency bias. Then, the power output of generator $i$ in the new steady state $P^{\text{new}}_{i}$ will be:

$$ P^{\text{new}}_{i} = P^{\text{set}}_{i} + \Delta P_{i} = P^{\text{set}}_{i} - B_{i} \Delta f $$

Then, the system power output in the new steady state will be:

$$ P^{\text{new}} = \sum_{i \in I} P^{\text{new}}_{i} = P^{\text{set}} - \Delta f \sum_{i \in I} B_{i} = P^{\text{set}} - B \Delta f $$

If $\Delta f$ is caused by a change of the system load $\Delta L$, then:

$$ \Delta L = - B \Delta f $$

because $P^{\text{new}} + L^{\text{new}} = (P^{\text{set}} + L^{\text{set}}) + (\Delta L - B \Delta f) = 0$ and $P^{\text{set}} + L^{\text{set}} = 0$.

Instead, if $\Delta f$ is unknown, it can be calculated by:

$$ \Delta f = - \Delta L / B $$

If some generator trips, the system frequency bias will change accordingly, and the new steady state will be based on $B^{\text{new}}$.

Infinite systems refer to those with the following features:

- large interconnected system
- dictates the frequency, while the unit only controls its power
- any frequency change influences the power production of the units

## Appendix

$$
\begin{align}
  \omega = 2 \pi f \\
  f = 1 / T
\end{align}
$$

Delta representation describes the deviation of quantities from initial steady state values. The states don't need to be initialized (initialized automatically with zero). Besides, it is easy to use transfer functions (no initial transients).

$$
\begin{align}
  x(t) &= x_{0} + \Delta x(t) \\
  \Delta x(t) &= x(t) - x_{0} \\
  \Delta x(0) &= 0
\end{align}
$$

---

[_wood2014power_]: https://github.com/edxu96/symposium/tree/master/bib/SDN.bib
