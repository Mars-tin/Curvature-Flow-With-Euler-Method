# Curvature-Flow-With-Euler-Mathod

## Project Introduction
Many Scientific studies and engineering projects involve curvature flow. 

We would say that a family of surfaces evolves under (mean) curvature flow, if the normal component of the velocity of which a point on the surface moves is given by the mean curvature of the surface. Usually, the process is numerically indirect, by introducing successive evolutions to curve surfaces. The purpose of curvature flow is to smooth, or eliminate noise on the curve.

In our project, the process starts with a predefined initial 2D-curve. By using the Euler Method and differentiation using Fast Fourier Transform and Inverse Fast Fourier Transform, we de-noise the surface of the curve as time-step increases. Eventually, a smooth curve, $i.e.$ a circle in this case, is expected.

Curvature flow serves as a basic model for several phenomena such as evolution of fluid interfaces in droplet/bubble flows and grain coarsening in materials. It is also used as a tool for solving problems in engineering such as image segmentation [2].

## Theoretic Background
### Differentiation with FFT and IFFT
Using FFT and IFFT, we can evaluate differentiation. Given a function $f$, we denote $g = f'$.

First, compute $\hat{f}$ using FFT and Trapezoidal rule:
$$\{\hat{f}\}^{M-1}_{j=-M} = \frac{1}{2\pi}\int_o^{2\pi}f(x)e^{-ijx}\ dx$$

Then, set $\hat{g_k} = (ik)\hat{f_k}$, for all $k=-M,\cdots,M-1$.

Since $f(x)=\sum_{k=-M}^{M-1}\hat{f_k}e^{ikx}$,
\begin{align*}
g(x) = f'(x) &= \sum_{k=-M}^{M-1}\hat{f_k}(ik)e^{ikx}\\
&= \sum_{k=-M}^{M-1}\hat{g_k}e^{ikx}
\end{align*}

Based on this, compute $g(x)=\sum_{k=-M}^{M-1}\hat{g_k}e^{ikx}$ using IFFT.

The complexity of this method is theoretically $O(M\log M)$, where we discretize $[0,2\pi)$ into $2M$ pieces.
### Parametrized Curve
Defined on a finite-dimensional vector space $V$ and an interval $I \subset \mathbb{R}$, a curve $\mathcal{C} \subset V$ is parametrized by a continuous, surjective, and locally injective map $\gamma: I \to \mathcal{C}$. 

In this project, we consider a closed curve that is evolving in time. whose coordinates $\textbf{x}$ are parametrized by $\alpha$. It could be represented in the following form:
$$\textbf{x}(\alpha,0) = \begin{bmatrix} x_1(\alpha,t)\\ x_2(\alpha,t) \end{bmatrix}\text{, where } \textbf{x}(\alpha,0)= (4+\cos 3\alpha)\begin{bmatrix} \cos\alpha\\ \sin\alpha \end{bmatrix}$$
where $\alpha\in I=[0,2\pi)$, and $t$ denotes time, represented using time-steps.

We use notations as follows:
$$x_{i\alpha} = \frac{\partial x_i}{\partial \alpha},\ i=1,2$$
$$|\textbf{x}_\alpha| = \sqrt{x_{1\alpha}^2+x_{2\alpha}^2}$$

The curvature $c$ of a curve is given by
$$c(\alpha) = \frac{ x_{2\alpha}x_{1\alpha\alpha} - x_{1\alpha} x_{2\alpha\alpha} }{|\textbf{x}_\alpha|^3}$$

The normal vector \textbf{n} of a curve is given by
$$\textbf{n}(\alpha) = \frac{1}{|\textbf{x}_\alpha|}\begin{bmatrix} x_{2\alpha}\\ -x_{1\alpha} \end{bmatrix}$$

The length of the curve at time $t$ is given as
$$L(t) = \int_0^{2\pi}|\textbf{x}_\alpha|\ d\alpha$$
\subsection{Euler Method}
The governing equation for the curvature flow is given as
$$\dot{\textbf{x}} = \frac{d\textbf{x}}{dr} = c(\alpha)\textbf{n}(\alpha)$$
where $c$ is the curvature of the curve and \textbf{n} is the normal vector of the curve.

To solve the non-linear ODEs, apply Euler Method. The iterative equation is given by
$$\textbf{x}^{(t+1)} = \textbf{x}^{(t)} + \Delta t\cdot \dot{\textbf{x}}$$
where $\Delta t$ is the time elapse of each time-step.

## Analysis
See Report.pdf

## Conclusion
In our project, We use the \textbf{Euler Method} and differentiation using \textbf{Fast Fourier Transform} and \textbf{Inverse Fast Fourier Transform}, to we de-noise a predefined initial 2D-curve surface and obtain a smooth curve as output.

Investigating the method, we verified that the time complexity is loglinear, which is $O(M\log M)$, and that the rate of convergence is first order, which is $O(h)$.

At last, we observed that the method is not unconditionally stable. For larger values of $M$, one may need larger value of $N$ correspondingly to ensure that the method converges.
