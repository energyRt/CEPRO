
<!-- README.md is generated from README.Rmd. Please edit that file -->

# China Electric Power Sector Province-level Model

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/CEPRO)](https://CRAN.R-project.org/package=CEPRO)
<!-- badges: end -->

<div class="warning">

\[WORK IN PROGRESS\]  
Docs: <https://energyrt.github.io/CEPRO/>

</div>

This R-package is a reproduction of CEPRO model, developed in the study
\[[1](#ref-LUGOVOY2021105176)\] to evaluate energy transition options
for China’s electric power sector by the mid-century . The current
version CEPRO2.0 is an improved with finer resolution of renewable
energy, and is adjusted to the new developments of energyRt modeling
package \[[2](#ref-energyRt)\].

## Installation

You can install the development version of CEPRO from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("energyRt/energyRt", ref = "dev")
devtools::install_github("energyRt/CEPRO")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(energyRt)
library(CEPRO)
## basic example code
```

\[tbc…\]

## References

<div id="refs" class="references csl-bib-body">

<div id="ref-LUGOVOY2021105176" class="csl-entry">

<span class="csl-left-margin">1.
</span><span class="csl-right-inline">Lugovoy O, Gao S, Gao J, et al.
(2021) [Feasibility study of china’s electric power sector transition to
zero emissions by 2050](https://doi.org/10.1016/j.eneco.2021.105176).
*Energy Economics* 96: 105176.</span>

</div>

<div id="ref-energyRt" class="csl-entry">

<span class="csl-left-margin">2.
</span><span class="csl-right-inline">Lugovoy O, Potashnikov V (2022)
[energyRt: Energy systems modeling toolbox in r, development
version](https://github.com/energyRt/energyRt).</span>

</div>

</div>
