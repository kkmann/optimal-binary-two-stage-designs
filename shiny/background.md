## Optimal Single-Arm Two-Stage Designs for Binary Endpoints

This interactive application allows to interactively explore optimal single-arm 
two-stage designs for binary endpoints commonly used in early clinical oncology.

The application is limited to designs minimising expected sample size under
a prior distribution about the response rate under treatment given a
constrain on expected power and 
designs minimising the maximal sample size under a constraint on the power
at a fixed point alternative for the response rate.

For more details, see the GitHub repository

https://github.com/kkmann/optimal-binary-two-stage-designs/tree/master/notebooks 

or visit the repository on zenodo.org

https://zenodo.org/badge/latestdoi/235104748

All results are computed using the R package [badr](https://github.com/kkmann/badr).
Please note that the computation time varies with the complexity of the problem.
Generally, designs for smaller effect sizes tend to take longer (up to 2-3 minutes).
