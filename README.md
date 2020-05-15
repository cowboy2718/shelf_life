
#### Shelf Life Calculator
##### R package with shiny to explore setting shelf life based on a linear loss function
##### May 14, 2020
##### Created by Tony Gojanovic

***

##### Background

Various products have shelf lives which is usually a time based limit on which a product is deemed useful.  Determining shelf life may be difficult although one approach is to base it on data obtained from time studies.  The studies monitor degradation of a product over time and this can be compared to a "limit" or specification at which point the product is no longer deemed useful.

***

#### Interactive App for Setting Shelf Life

The attached R code is a "what if" calculator based on the user inputing parameters based on a time study and a linear model.  For example, a product may deteriorate over time in a linear fashion which can be modeled using a general linear regresion model (ordinary least squares).  From the least squares model, the intercept, slope and error terms may be estimated and used in the simulation package.

The calculator is based on flavor stability but the ideas can be applied to other domains as well.

***

#### Usage

The estimated shelf life is based on input parameters related to the acceptable level of flavor, estimated weekly flavor decay rate, estimated flavor variability, and the desired risk level for out of code product.  The starting value or intercept is based on the estimated sensory flavor level at week 0.

The shelf life calculator is based on the follow linear model (a general model is only one type of model that may be applicable).

  **flavor level limit = intercept + (decay rate)(week) + error**

Note: Estimates are based on parameters estimated through sensory testing and regression formulations of key flavor attributes as they behave over time including sensory and product variation (normally distributed error terms are assumed).

The calculator is only valid within the range of estimated parameters and caution should be used for extrapolation.  However, 'playing' with values at extreme values will also show how different parameters affect flavor stability.

***

#### References

The following are useful resources.

Capen, Robert, et.al., "On the Shelf Life of Pharmaceutical Products," *AAPS PharmSciTech*, Vol. 13, No. 3, September 2012.  

Capen, Robert, et.al., "Evaluating Current Practices in Shelf Life Estimation," *AAPS PharmSciTech*, Vol. 19, No. 2, February 2018.



