# Hessian-based Frangi filter for tubular/vessel-like structures

<p align="left">
	<img src="https://img.shields.io/badge/language-MATLAB-red?style=for-the-badge"
			 alt="language">
</p>

Based on "Multiscale vessel enhancement filtering" by A.F. Frangi, 1998.
<a href="https://link.springer.com/chapter/10.1007/BFb0056195">Link to paper</a>.

## Mathematical introduction
"A common approach to analyze the local behavior of an image, L, is to consider its Taylor expansion in the neighborhood of a point Xo" - A.F. Frangi

L(Xo+deltaXo, s) ~= L(Xo, s) + (tranpose(deltaXo))*(gradient vector of Xo at scale s) +tranpose(deltaXo)*(Hessian matrix at Xo and scale s)*(deltaXo)

### Taylor Expansion
Looking at an image as a matrix of values, examining the Taylor expansion/Taylor series in the neighborhood of a point will give us information with which we can analyze or modify. A Taylor expansion is a sum of terms composed of the derivatives of a function around a single point. We know this works because a Taylor expansion approximates the function that models the "surface" of intensity.

Per Frangi, we're looking to the second-derivative expansion (the Hessian) as shown in the equation above. To be fair, this isn't the theoretical Taylor expansion because that one has a function as input and expand it, here we are approximating the terms that makes up the expansion, working backwards in a way.

### Hessian matrix and eigenvalues
A Hessian matrix provides valuable information in the form of its eigenvalues.

### Applying the filter
<p align="center">
	<img src="https://latex.codecogs.com/gif.latex?V_{o}(s)=\begin{cases}&space;0&space;&&space;\text{&space;if&space;}&space;\lambda_{2}>&space;0&space;\text{&space;or&space;}&space;\lambda_{3}>&space;0\\&space;\left&space;(&space;1-\text{&space;exp}\left&space;(&space;-\frac{R_{A}^{2}}{2\alpha^{2}}&space;\right&space;)&space;\right&space;)\left&space;(&space;\text{&space;exp}\left&space;(&space;-\frac{R_{B}^{2}}{2\beta^{2}}&space;\right&space;)&space;\right&space;)\left&space;(1-&space;\text{&space;exp}\left&space;(&space;-\frac{S^{2}}{2\gamma&space;^{2}}&space;\right&space;)&space;\right&space;)&&space;\text{&space;otherwise&space;}&space;\end{cases}" title="V_{o}(s)=\begin{cases} 0 & \text{ if } \lambda_{2}> 0 \text{ or } \lambda_{3}> 0\\ \left ( 1-\text{ exp}\left ( -\frac{R_{A}^{2}}{2\alpha^{2}} \right ) \right )\left ( \text{ exp}\left ( -\frac{R_{B}^{2}}{2\beta^{2}} \right ) \right )\left (1- \text{ exp}\left ( -\frac{S^{2}}{2\gamma ^{2}} \right ) \right )& \text{ otherwise } \end{cases}" 
	alt="Hessian-based Frangi filter equation"/>
</p>
