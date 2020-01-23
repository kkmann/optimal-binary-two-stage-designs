[![DOI](https://zenodo.org/badge/235104748.svg)](https://zenodo.org/badge/latestdoi/235104748)



# Optimal binary two-stage designs


## Interactive examples [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/kkmann/optimal-binary-two-stage-designs/master?urlpath=lab%2Ftree%2Fnotebooks%2Fintroduction.ipynb)

All examples are available as [jupyter](https://jupyter.org/) notebooks in the folder /notebooks and 
can be explored interactively via [binder](https://mybinder.readthedocs.io/en/latest/), 
courtesy to https://mybinder.org by following the [binder-link](https://mybinder.org/v2/gh/kkmann/optimal-binary-two-stage-designs/master?urlpath=lab/tree/notebooks/introduction.ipynb).

Since the instances are running on a free service, availibility and computing speed may vary.

All links on this page point to the respective newest variant of the repository (master), to run an older version,
simply modify the binder link, e.g., 

```
https://mybinder.org/v2/gh/kkmann/optimal-binary-two-stage-designs/master?urlpath=lab/tree/notebooks/introduction.ipynb
```

to 

```
https://mybinder.org/v2/gh/kkmann/optimal-binary-two-stage-designs/0.1.0?urlpath=lab/tree/notebooks/introduction.ipynb
```



## Shiny app [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/kkmann/optimal-binary-two-stage-designs/master?urlpath=shiny%2Fshiny%2F)

A [shiny](https://shiny.rstudio.com/) app is available under [this](https://mybinder.org/v2/gh/kkmann/optimal-binary-two-stage-designs/master?urlpath=shiny/shiny/) binder-link.
The app showcases a few rudimentatry scenarios and does not require any programming experience. 
Note that the app is also hosted on the free https://mybinder.org service and the default settings for the optimisation are
chosen conservatively to ensure proper solutions over a wide range of inputs. 
Depending on the user inputs, optimisation might thus take up to a few minutes.



## Reproduce the results locally

To reproduce the results locally, you will need a Linux command line (tested on Ubuntu 18.04 and 19.10) and the
container software [singularity](https://sylabs.io/guides/3.5/user-guide/quick_start.html#quick-installation-steps).
Note that singularity currently can only be installed manually.
Version 3.5 was used to generate the container image and the singularity version must be compatible with 3.5.

The container contains all required packages ([bad](https://github.com/kkmann/bad.jl), [badr](https://github.com/kkmann/badr), and [adoptr](https://github.com/kkmann/adoptr)) as well as the workflow managment software [snakemake](https://snakemake.readthedocs.io/en/stable/) and a working installation of [jupyter](https://jupyter.org/).

[...]
