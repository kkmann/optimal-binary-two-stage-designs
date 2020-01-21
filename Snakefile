rule introduction:
    input:
        "notebooks/introduction.ipynb"
    output:
        "latex/figures/introduction-binomial-power.pdf",
        "latex/figures/introduction-binomial-vs-simons.pdf",
        "latex/figures/introduction-sample-size-recalculation.pdf",
        "latex/figures/introduction-sample-size-recalculation-conditional-power.pdf"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.timeout=3600 --execute notebooks/introduction.ipynb
        mv notebooks/*.pdf latex/figures
        rm notebooks/introduction.html
        """



rule optimal_two_stage_designs:
    input:
        "notebooks/optimal-two-stage-designs.ipynb"
    output:
        "latex/figures/optimal-two-stage-designs-simon-vs-optimal.pdf",
        "latex/figures/optimal-two-stage-designs-null-vs-alternative-vs-minimax.pdf"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.timeout=3600 --execute notebooks/optimal-two-stage-designs.ipynb
        mv notebooks/*.pdf latex/figures
        rm notebooks/optimal-two-stage-designs.html
        """
        
 

rule optimisation_under_uncertainty:
    input:
        "notebooks/optimisation-under-uncertainty.ipynb"
    output:
        "latex/figures/optimisation-under-uncertainty-prior-choice-designs.pdf",
        "latex/figures/optimisation-under-uncertainty-power-constraints.pdf",
        "latex/figures/optimisation-under-uncertainty-power-vs-prior-parameters.pdf"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.timeout=3600 --execute notebooks/optimisation-under-uncertainty.ipynb
        mv notebooks/*.pdf latex/figures
        rm notebooks/optimisation-under-uncertainty.html
        """



rule bayesian_inference:
    input:
        "notebooks/bayesian-inference.ipynb"
    output:
        "latex/figures/bayesian-inference-posteior-mean-bias-rmse.pdf"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.timeout=3600 --execute notebooks/bayesian-inference.ipynb
        mv notebooks/*.pdf latex/figures
        rm notebooks/bayesian-inference.html
        """



rule frequentist_inference:
    input:
        "notebooks/frequentist-inference.ipynb"
    output:
        "latex/figures/frequentist-inference-bias-rmse-performance.pdf",
        "latex/figures/frequentist-inference-pvalue-distributions.pdf"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.timeout=3600 --execute notebooks/frequentist-inference.ipynb
        mv notebooks/*.pdf latex/figures
        rm notebooks/frequentist-inference.html
        """



rule unplanned_adaptations:
    input:
        "notebooks/unplanned-adaptations.ipynb"
    output:
        "latex/figures/unplanned-adaptations-base-design.pdf",
        "latex/figures/unplanned-adaptations-adapted-sample-size-function-comparison.pdf"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.timeout=3600 --execute notebooks/unplanned-adaptations.ipynb
        mv notebooks/*.pdf latex/figures
        rm notebooks/unplanned-adaptations.html
        """



rule all:
    input: 
        rules.introduction.output, 
        rules.optimal_two_stage_designs.output, 
        rules.optimisation_under_uncertainty.output,
        rules.bayesian_inference.output, 
        rules.frequentist_inference.output, 
        rules.unplanned_adaptations.output
       