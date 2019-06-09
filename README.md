# Hessian-based Frangi filter for tubular/vessel-like structures<br> 
Based on "Multiscale vessel enhancement filtering" by A.F. Frangi, 1998.<br>
## Mathematical introduction<br>
"A common approach to analyze the local behavior of an image, L, is to consider its Taylor expansion in the neighborhood of a point Xo" - A.F. Frangi<br>
<br>
L(Xo+deltaXo, s) ~= L(Xo, s) + (tranpose(deltaXo))*(gradient vector of Xo at scale s) +tranpose(deltaXo)*(Hessian matrix at Xo and scale s)*(deltaXo)<br>
<br>
### Taylor Expansion<br>
Looking at an image as a matrix of values, examining the Taylor expansion/Taylor series in the neighborhood of a point will give us information with which we can analyze or modify. A Taylor expansion is a sum of terms composed of the derivatives of a function around a single point. We know this works because a Taylor expansion approximates the function that models the "surface" of intensity. <br>
<br>
Per Frangi, we're looking to the second-derivative expansion (the Hessian) as shown in the equation above. To be fair, this isn't the theoretical Taylor expansion because that one has a function as input and expand it, here we are approximating the terms that makes up the expansion, working backwards in a way.<br>
<br>
### Hessian matrix<br>
A Hessian matrix  
