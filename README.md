
#### Shelf Life Calculator
##### R package with shiny to explore setting shelf life based on a linear loss function
##### May 14, 2020
##### Created by Tony Gojanovic

***

##### Background

Various products have shelf lives which are a time-based limit on which a product is deemed useful.  Determining shelf life may be difficult although one approach is to base it on data obtained from time studies.  Time studies monitor degradation of a product over time and this can be compared to a "limit" or specification at which point the product is no longer deemed useful or effective.  This limit is called the *maximum degredation level* or **MDL**.

***

#### Interactive App for Setting Shelf Life

The attached R code is a "what if" calculator based on the user inputing parameters-based form a time study based on a linear model.  For example, a product may deteriorate over time in a linear fashion which can be modeled using a general linear regresion model (ordinary least squares).  From the least squares model, the intercept, slope and error terms may be estimated and used in the simulation package.

The calculator is generic and the ideas can be applied to many domains.

***

#### Usage

The estimated shelf life is based on input parameters related to the acceptable level of end user acceptance, or the maximum level of degradation, estimated weekly decay rate, estimated product variability, and the desired risk level for out of code product.  The starting value or intercept is based on the estimated degradation level at week 0.  Some product will exhibit decay even at week = 0 and typical regression models have intercept levels which may be indicative of a “non-zero” intercept.

The shelf life calculator is based on the follow linear model (a general model is only one type of model that may be applicable).

  **$$ MDL = intercept + (decay rate)(week) + error$$**

Note: Estimates are based on parameters estimated through time studies and regression formulations of key product attributes as they behave over time including product variation from batch to batch (normally distributed error terms are assumed).

The calculator is only valid within the range of estimated parameters and caution should be used for extrapolation.  However, 'playing' with values at extreme values will also show how different parameters affect product stability.

***

#### Notes on Loss Functions

Loss functions are defined as formulas in which as one goes away from some target, there is a degradation in quality or performance. Product staling is a good example.  As the time from manufacture increases, staling would generally go up.  Loss functions are generally of the forms shown below.  Note that they are based on a quadratic function ($x^2$) with the idea being that as one moves away from some goal or target, things become much worse much more quickly (there are some other reasons for using a quadratic function as well).

**Higher is Better**

$Loss = k \frac{1}{x^2}$

The value *k* is usually associated with some type of loss (usually monetary).  For example, higher production efficiencies would make the loss function go down.

**Lower is Better**

$Loss = k{x^2}$

An example here might be scrap or rework.  Less scrap or rework implies less loss.

**On Target is Better**

$Loss = k({x-T^2})$

So, if a value *x* is on target *T*, the potential loss would be zero.  So when the target is "0" the function is the same as the lower is better loss function.  This would be most applicable to shelf life studies; the sooner a product is bought and consumed, the better is will be.

**Sensory Loss Function**

However, we can use the linear regression models we created above as loss functions as well.  They are simple and are a good start in the discussion of how to set shelf life.  By taking the estimated parameters (intercept, slope and error) wc can develop "what if" situations to test which is what this Shiny app attempts to do.

**Setting a specification**

Shell life is based on the idea of what is the maximum time limit a product could be stored so that a consumer would not notice an appreciable difference of quality.  For example, if a medical treatment drug is being sold, the effectiveness of that product should still be acceptable at the shelf limit or slightly beyond.  Note, however, that consumer perception might be different than an "expert" so it is clear to define that limit for the consumer.  There has to be a balance between consumer and producer risk; too long a shelf life becomes consumer risk, too short a shelf life becomes producer risk.

Once a reasonable product limit is set, or a bound-on product degradation, the regression parameters can be used to forecast a shelf life.  However, one must also take into account the variability of the system.  A predicted value will be only a point estimate; one has to also take into account the variability associated with that estimate.  For example, suppose that the ideal shelf life is for some product or family of product is determined to be 6 months for a staling level no greater than a "3"; that value of 3 might have a range from let's say 2.5, to 3.5 (higher is assumed to be worse).  We want to assure that the worst-case scenario is taken into account (usually by lowering the shelf life a few weeks to accommodate this variability).  The smaller the system variability, the more precise the shelf life.  Each batch of product will also be different, so this variability has to be taken into account or accurately assessed.



***

#### References

The following are useful resources.

Capen, Robert, et.al., "On the Shelf Life of Pharmaceutical Products," *AAPS PharmSciTech*, Vol. 13, No. 3, September 2012.  

Capen, Robert, et.al., "Evaluating Current Practices in Shelf Life Estimation," *AAPS PharmSciTech*, Vol. 19, No. 2, February 2018.



