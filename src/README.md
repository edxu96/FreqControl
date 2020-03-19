

$$
\begin{array}{ccc}
  \hline
  \text{Name} & \text{Value} & \text{Unit} \\
  \hline
  I & 100 & kg \cdot m^2 \\
  c & 2 & kg \cdot m^2 / s \\
  N(t_0) & 1500 & rpm \\
  \hline
\end{array}
$$

$$
\begin{align}
  \omega(t_0) &= 2 \pi N(t_0) / 60 = 157 \quad [rad / s] \\
  T^{l}(t_0) &= c \omega(t_0) = 314 \quad [N \cdot m] \\
  T^{d}(t_0) &= T^{l}(t_0) = 314 \quad [N \cdot m]
\end{align}
$$

##

The damping of the system $D$ can be calculated using:

$$
\begin{align}
    D = \frac{0.4 \times P^{L}(t_0)}{P^{total}} = 0.2424
\end{align}
$$

where $P^{L}(t_0) = 2000 \text{[MW]}$, $P^{total} = 3300 \text{[MW]}$.

$$
\begin{align}
  K_{\text{online}} &= \frac{P_{1} + P_{2} + P_{4}}{P_{1} + P_{2} + P_{3} + P_{4}} = 0.8 \\
  M &= M_{1} + M{2} + M_{4} = \omega^{\text{base}}
\end{align}
$$

$$\begin{array}{ccccc}
    \hline
    \text{Name} & \text{Symbol} & \text{Value} & \text{Unit} & \text{Variable Name} \\
    \hline
    \text{damping coefficient} & D & 0.2424 & - & \text{D} \\
    \text{"charging time" time constant} & T_{\text{CH}} & 2 & - & \text{TCH} \\
    \text{governor} K_{p} & K_{p} & 20 & - & \text{Kp} \\
    \text{governor} K_{i} & K_{i} & 2 & - & \text{Ki} \\
    \text{angular momentum} & M & - & - & \text{M} \\
    \text{governor gain} & R & - & - & \text{R} \\
    \text{power change} & \Delta P & - 400 & MW & \text{dp} \\
    \text{K online} & K_{\text{online}} & 0.8 & - & \text{KOnline} \\
    \hline
\end{array}$$
