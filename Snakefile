import os
os.makedirs('output/figures', exist_ok = True)
os.makedirs('output/tables', exist_ok = True)





rule introduction:
    input:
        "notebooks/introduction.ipynb"
    output:
        "output/figures/introduction-binomial-power.pdf",
        "output/figures/introduction-binomial-vs-simons.pdf",
        "output/figures/introduction-sample-size-recalculation.pdf",
        "output/figures/introduction-sample-size-recalculation-conditional-power.pdf"
    shell:
        """
        jupyter nbconvert --execute notebooks/introduction.ipynb
        mv notebooks/*.pdf output/figures
        rm notebooks/introduction.html
        """



rule optimal_two_stage_designs:
    input:
        "notebooks/optimal-two-stage-designs.ipynb"
    output:
        "output/figures/optimal-two-stage-designs-simon-vs-optimal.pdf",
        "output/figures/optimal-two-stage-designs-null-vs-alternative-vs-minimax.pdf"
    shell:
        """
        jupyter nbconvert --execute notebooks/optimal-two-stage-designs.ipynb
        mv notebooks/*.pdf output/figures
        rm notebooks/introduction.html
        """
        
 

rule optimisation_under_uncertainty:
    input:
        "notebooks/optimisation-under-uncertainty.ipynb"
    output:
        "output/figures/optimisation-under-uncertainty-prior-choice-designs.pdf",
        "output/figures/optimisation-under-uncertainty-power-constraints.pdf.pdf",
        "output/figures/optimisation-under-uncertainty-power-vs-prior-parameters.pdf"
    shell:
        """
        jupyter nbconvert --execute notebooks/notebooks/optimisation-under-uncertainty.ipynb
        mv notebooks/*.pdf output/figures
        rm notebooks/notebooks/optimisation-under-uncertainty.html
        """



rule bayesian_inference:
    input:
        "notebooks/bayesian-inference.ipynb"
    output:
        "output/figures/bayesian-inference-posteior-mean-bias-rmse.pdf"
    shell:
        """
        jupyter nbconvert --execute notebooks/notebooks/bayesian-inference.ipynb
        mv notebooks/*.pdf output/figures
        rm notebooks/notebooks/bayesian-inference.html
        """



rule frequentist_inference:
    input:
        "notebooks/frequentist-inference.ipynb"
    output:
        "output/figures/frequentist-inference-bias-rmse-performance.pdf",
        "output/figures/frequentist-inference-pvalue-distributions.pdf"
    shell:
        """
        jupyter nbconvert --execute notebooks/notebooks/frequentist-inference.ipynb
        mv notebooks/*.pdf output/figures
        rm notebooks/notebooks/frequentist-inference.html
        """



rule unplanned_adaptations:
    input:
        "notebooks/unplanned-adaptations.ipynb"
    output:
        "output/figures/unplanned-adaptations-base-design.pdf",
        "output/figures/unplanned-adaptations-adapted-sample-size-function-comparison.pdf"
    shell:
        """
        jupyter nbconvert --execute notebooks/notebooks/unplanned-adaptations.ipynb
        mv notebooks/*.pdf output/figures
        rm notebooks/notebooks/unplanned-adaptations.html
        """



rule all:
    input: 
        rules.introduction.output, 
        rules.optimal_two_stage_designs.output, 
        rules.optimisation_under_uncertainty.output,
        rules.bayesian_inference.output, 
        rules.frequentist_inference.output, 
        rules.unplanned_adaptations.output
       